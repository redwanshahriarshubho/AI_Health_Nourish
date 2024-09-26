class PhiPrompt:
    user_turn = "<|user|>"
    system_turn = "<|system|>"
    assistant_turn = "<|assistant|>"
    end_turn = "<|end|>"

    def system_prompt(self, text) -> str:
        return f"""{self.system_turn}\n {text} {self.end_turn}"""

    def user_prompt(self, text) -> str:
        return f"""{self.user_turn}\n {text} {self.end_turn}"""

    def assistant_prompt(self) -> str:
        return f"""{self.assistant_turn}\n"""
