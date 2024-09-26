import os

from duckduckgo_search import DDGS
from tavily import TavilyClient
import dotenv

dotenv.load_dotenv()


class TavilySearch:
    def __init__(self, api_key, text=None):
        self.api_key = api_key
        self.text = text
        self.client = TavilyClient(api_key=api_key)

    def search(self, query, max_results=2, search_depth='basic'):
        try:
            results = self.client.search(
                query=query,
                max_results=max_results,
                search_depth=search_depth
            )

            return results
        except Exception as e:
            raise e


class DDGSearch:
    def __init__(self):
        self.client = DDGS()

    def search(self, query, max_results=2):
        try:
            results = self.client.text(
                keywords=query,
                max_results=max_results,
            )

            results = [
                {'url': result['href'],
                 'title': result['title'],
                 'content': result['body']
                 } for result in results
            ]

            return results

        except Exception as e:
            raise e



class MultiSearch:
    def __init__(self, search_api_keys: dict):
        self.search_api_keys = search_api_keys
        self.clients = [
            TavilySearch(search_api_keys['tavily']),
            DDGSearch()
        ]

    def search(self, query: str, max_results=2):
        results = []

        for client in self.clients:
            results.append(
                client.search(query=query, max_results=max_results)
            )

        return results
