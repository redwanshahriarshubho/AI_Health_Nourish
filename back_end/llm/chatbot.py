import re

from back_end.llm.chat_model import LLM
from back_end.llm.embedding_model import EmbeddingModel

from langchain_core.runnables import RunnableLambda
from langchain_core.runnables.history import RunnableWithMessageHistory
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser

from back_end.web_search.WebSearch import WebSearch

from langchain_chroma import Chroma
from langchain_community.chat_message_histories import ChatMessageHistory

import dotenv
dotenv.load_dotenv()

class ChatBot:
    def __init__(self):
        self.first_login = False
        self.s_id = "0"

        self.llm = LLM().get_llm()
        self.embedding_model = EmbeddingModel().get_embedding_model()

        self.vector_store = Chroma(
            collection_name="chat_history",
            embedding_function=self.embedding_model,
            persist_directory="./chroma_langchain_db",  # Where to save data locally, remove if not necessary
        )

        self.web_search = WebSearch()
        self.history = ChatMessageHistory()

    def introduce(self):
        system_prompt = (
            "You are an expert dietitian and you will assist your patients by generating diet routines and recipes for the"
            "diet based on their 'context'. Show the calorie counts for each recipe you suggest. You will also be given a 'recipe_book'"
            " so you can generate the recipes. Your patient may ask you to change the recipe, and you should change those accordingly."
            "You will also have 'chat_history' which will contain the previous interactions between you and your patient."
            "You MUST NOT answer or reply to any other tasks and"
        
            "\n\nGreet your patient and introduce yourself."
        )

        introductory_prompt = ChatPromptTemplate.from_messages(
            [
                ('system', system_prompt)
             ]
        )

        chain = introductory_prompt | self.llm

        return chain.invoke({})

    def search(self, query) -> list:
        prompt = self.web_search.search_prompt()

        search_chain = (
                prompt
                | self.llm
                | StrOutputParser()
                | (lambda x: (x.split("<|assistant|>")[-1]).strip())
                | (lambda x: (re.findall(r'[1-9]\.\s?"(.*)"\n?', x)))
        ) | RunnableLambda(self.web_search.search_web)

        return search_chain.invoke({'prompt': query})

    def set_session_id(self, s_id):
        self.s_id = s_id
    def get_session_id(self) -> str:
        return self.s_id

    def prompt(self, query: str):
        stored_messages = self.history.messages
        if len(stored_messages) == 0:
            return self.introduce()

        chat_prompt = ChatPromptTemplate.from_messages(
            [
                ('placeholder', "chat history: {chat_history}"),
                ('placeholder', "recipe book: {recipe_book}"),
                ('human', "{input}")
            ]
        )

        query_results = self.search(query)

        prompt_chain = (
            chat_prompt
                | self.llm
                | StrOutputParser()
                | (lambda x: (x.split("<|assistant|>")[-1]).strip())
        )

        chain_with_message_history = RunnableWithMessageHistory(
            prompt_chain,
            lambda session_id: self.history,
            input_messages_key="input",
            history_messages_key="chat_history",
        )

        return chain_with_message_history.invoke(
            {"input": query, "recipe_book": query_results},
            {"configurable": {"session_id": self.get_session_id()}},
        )




