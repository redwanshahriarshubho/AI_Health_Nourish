import uuid
import regex as re

from back_end.llm.chat_model import LLM
from back_end.llm.PhiPrompt import PhiPrompt

from langchain.prompts import PromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_community.document_loaders import PyPDFLoader as PDFLoader
from langchain_huggingface import HuggingFaceEmbeddings
from langchain_core.runnables import (
    RunnableLambda
)

from back_end.web_search.SearchClient import MultiSearch

def embed_test():
    store = {}
    hf_embedding = HuggingFaceEmbeddings(model_name='all-MiniLM-L6-v2', model_kwargs={'device': 'cuda'})
    loader = PDFLoader("./dataSource/FCT_10_2_14_final_version.pdf")
    documents = loader.load_and_split()

    texts = [doc.page_content for doc in documents]
    metadatas = [doc.metadata for doc in documents]

    vectors = hf_embedding.embed_documents(list(texts))
    ids_ = []

    for i, text in enumerate(texts):
        doc_id = str(uuid.uuid4())
        print(doc_id)
        ids_.append(doc_id)
        store[doc_id] = {
            "id": doc_id,
            "vector": vectors[i],
            "text": text,
            "metadata": metadatas[i] if metadatas else {},
        }

    print(store, ids_)


def load_store():
    pass


class Chain:
    def __init__(self, model_id: str, api_key: dict, embedding_model_id: str = 'all-MiniLM-L6-v2', device: str = 'cuda'):
        self.model_id = model_id
        self.phi_prompt_builder = PhiPrompt()
        self.llm= LLM(model_id=model_id, device=device).get_llm()
        self.search = MultiSearch(api_key)

        # self.embedding = HuggingFaceEmbeddings(model_name=embedding_model_id, model_kwargs={'device': 'cuda'})
        # self.vector_store = InMemoryVectorStore(self.embedding)

    # def load_pdf(self, path):
    #     loader = PDFLoader(path)
    #     pages = loader.load_and_split()
    #     self.vector_store.add_documents(pages)
    #     print('Page Added')

    def _prompt_template(self, system_prompt_text: str, user_prompt_text: str, input_vars: []) -> PromptTemplate:
        system_prompt = self.phi_prompt_builder.system_prompt(system_prompt_text)
        user_prompt = self.phi_prompt_builder.user_prompt(user_prompt_text)
        assistant_prompt = self.phi_prompt_builder.assistant_prompt()

        prompt = system_prompt + ' ' + user_prompt + ' ' + assistant_prompt

        return PromptTemplate(template=prompt, input_variables=input_vars)

    def _search_prompt(self):
        system_prompt_text = """You are a helpful assistant. You will assist me by generating queries and returning \
the queries in a list format to search the web about recipes for given context."""

        user_prompt_text = """
        Generate 3 queries to find food recipe for context: '{prompt}'
        """

        return self._prompt_template(system_prompt_text, user_prompt_text, ["prompt"])

    def _web_search(self, queries: []):

        search_results = [self.search.search(q) for q in queries]
        return search_results

    def search_chain(self, prompt: str) -> list:
        search_prompt = self._search_prompt()
        chain = ((search_prompt
                  | self.llm
                  | StrOutputParser()
                  | (lambda x: (x.split("<|assistant|>")[-1]).strip())
                  | (lambda x: (re.findall(r'[1-9]\.\s?"(.*)"\n?', x)))
                  )
                 | RunnableLambda(self._web_search)
                 )
        
        res = chain.invoke({"prompt": prompt})

        return res

    def _llm_prompt(self) -> PromptTemplate:
        # system_prompt_text = """You are an expert dietitian also a great cook. Your task is to produce diet plan \
        # according to the patient's requirement and give your recipe to cook your prescribed diet. You will be provided \
        # with supplementary cookbooks and nutritional values of ingredients for your assistance. You may use them but ONLY as \
        # your supplementary. Supplementary cookbook to generate recipes: {cookbook}. You may use information from nutritional \
        # values guide which may have errors. The nutrition value guide is: {nutritional_values}. Use these to generate your own \
        # recipe or use cookbooks according to the user's need. Your generated output should have calorie contents of each recipes
        # ."""

        system_prompt_text = """You are an expert dietitian also a great cook. Your task is to produce diet plan \
according to the patient's requirement and give your recipe to cook your prescribed diet. You will be provided \
with supplementary cookbooks. You may use them but ONLY as \
your supplementary. Supplementary cookbook to generate recipes: {cookbook}. Use these to generate your own \
recipe or use cookbooks according to the user's need. Your generated output should have calorie contents of each recipes
."""

        user_prompt_text = """Generate diet plan with recipe for the requirement: {prompt}"""

        return self._prompt_template(system_prompt_text, user_prompt_text, ['prompt', 'cookbook'])

    def prompt_chain(self, prompt: str):
        _prompt = self._llm_prompt()
        cookbook = self.search_chain(prompt)
        # self.load_pdf('./dataSource/FCT_10_2_14_final_version.pdf')

        # nutritional_values = [self.vector_store.similarity_search(c, k=4) for c in cookbook]

        chain = (_prompt
                 | self.llm
                 | StrOutputParser()
                 | (lambda x: (x.split("<|assistant|>")[-1]).strip())
                 )

        return chain.invoke({'prompt': prompt, "cookbook": cookbook})
