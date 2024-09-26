import torch
import sentencepiece
from langchain_huggingface import ChatHuggingFace

from transformers import (
    pipeline,
    AutoModelForCausalLM,
    AutoTokenizer,
    BitsAndBytesConfig
)

from langchain_huggingface import HuggingFacePipeline


class LLM:
    def __init__(self, model_id: str = 'microsoft/Phi-3-mini-128k-instruct', device: str = 'cuda'):
        self.bnb_config = BitsAndBytesConfig(
            load_in_4bit=True,
            bnb_4bit_quant_type="nf4",
            bnb_4bit_compute_dtype=torch.bfloat16,
            bnb_4bit_use_double_quant=True
        )

        self.tokenizer = AutoTokenizer.from_pretrained(model_id)
        self.model = AutoModelForCausalLM.from_pretrained(
            model_id,
            trust_remote_code=True,
            quantization_config=self.bnb_config,
        )

        self.llm = ChatHuggingFace(
           model_id = model_id,
            llm=HuggingFacePipeline(
                pipeline=pipeline(
                    task='text-generation',
                    model=self.model,
                    tokenizer=self.tokenizer,
                    max_new_tokens=256,
                )
            ),
            tokenizer=self.tokenizer,
        )

    def get_info(self):
        print(f"""model_info:\n\t'model_id': {self.model}\n\t'quantized': True""")

    def get_llm(self) -> ChatHuggingFace:
        return self.llm
