from langchain_huggingface import HuggingFaceEmbeddings

class EmbeddingModel:
    def __init__(self, model_id: str = 'all-MiniLM-L6-v2', device: str = 'cuda'):
        self.embedding = HuggingFaceEmbeddings(model_name=model_id, model_kwargs={'device': device})

    def get_embedding_model(self) -> HuggingFaceEmbeddings:
        return self.embedding