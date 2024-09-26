import os

from langchain_core.prompts import ChatPromptTemplate
from back_end.web_search.SearchClient import MultiSearch

import dotenv
dotenv.load_dotenv()

class WebSearch:
    def __init__(self):
        self.search_engine = MultiSearch({
            'tavily': os.getenv('TAVILY_API_KEY'),
        })
    def search_prompt(self):
        system_prompt_text = """You are a helpful assistant. You will assist me by generating queries to search the web for\
         recipe to cook on given context and just returning the queries in a numbered list format.\
         You MUST ONLY generate queries on food or diet or if the context is based on food. If asked on any other context or\
         topic you must reject the prompt in a respectful way.
         """

        user_prompt_text = """
            Generate 3 queries to find food recipe for context: '{prompt}'
            """

        return ChatPromptTemplate.from_messages(
            [
                ('system', system_prompt_text),
                ('user', user_prompt_text)
            ]
        )

    def search_web(self, queries):
        return self.search_engine.search(queries)

