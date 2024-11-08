from typing import List

from langchain.prompts import ChatPromptTemplate
from langchain.schema import StrOutputParser
from langchain_ollama import ChatOllama

from .numbered_list_parser import NumberedListParser


class SolutionService:
    def __init__(self):
        self.chat_ollama = ChatOllama(model="llama3.2", device="mps")
        self.prompt_template_with_caption = ChatPromptTemplate.from_messages(
            [
                ("system", "You suggest excellent solutions to social problems"),
                (
                    "human",
                    """The user submitted an image from which we created a caption. The caption is: {caption}.
The user also provided a description of the problem: {description}
Provide some solutions to the problem as numbered list.
Each solution should be a one line solution with at most 12 words.
For example:
1. Solution 1
2. Solution 2
3. Solution 3""",
                ),
            ]
        )
        self.prompt_template_without_caption = ChatPromptTemplate.from_messages(
            [
                ("system", "You suggest excellent solutions to social problems"),
                (
                    "human",
                    """The user provided a description of the problem: {description}
Provide some solutions to the problem as numbered list.
Each solution should be a one line solution with at most 12 words.
For example:
1. Solution 1
2. Solution 2
3. Solution 3""",
                ),
            ]
        )

    def get_response(self, description: str, caption: str = None) -> List[str]:
        if caption == None:
            chain = (
                self.prompt_template_without_caption
                | self.chat_ollama
                | StrOutputParser()
                | NumberedListParser()
            )
            return chain.invoke(
                {
                    "description": description,
                }
            )
        else:
            chain = (
                self.prompt_template_with_caption
                | self.chat_ollama
                | StrOutputParser()
                | NumberedListParser()
            )
            return chain.invoke(
                {
                    "description": description,
                    "caption": caption,
                }
            )


if __name__ == "__main__":
    solution = SolutionService()
    print(solution.get_response("There is garbage everywhere in the streets."))
