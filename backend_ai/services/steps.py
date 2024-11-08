from typing import List

from langchain.prompts import ChatPromptTemplate
from langchain.schema import StrOutputParser
from langchain_ollama import ChatOllama
from .numbered_list_parser import NumberedListParser


class StepsService:
    def __init__(self):
        self.chat_ollama = ChatOllama(model="llama3.2", device="mps")
        self.prompt_template_with_caption = ChatPromptTemplate.from_messages(
            [
                ("system", "You are very at breaking down the steps of a process"),
                (
                    "human",
                    """The user submitted an image from which we created a caption. The caption is: {caption}.
The user also provided a description of the problem: {description}
The user also chose a solution: {solution}
Break down the steps of the solution as a numbered list.
Each step should be a one line solution with at most 12 words.
For example:
1. Solution 1
2. Solution 2
3. Solution 3""",
                ),
            ]
        )
        self.prompt_template_without_caption = ChatPromptTemplate.from_messages(
            [
                ("system", "You are very at breaking down the steps of a process"),
                (
                    "human",
                    """The user provided a description of the problem: {description}
The user also chose a solution: {solution}
Break down the steps of the solution as a numbered list.
Each step should be a one line solution with at most 12 words.
For example:
1. Solution 1
2. Solution 2
3. Solution 3""",
                ),
            ]
        )

    def get_response(self, description: str, solution: str, caption: str = None) -> List[str]:
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
                    "solution": solution,
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
                    "solution": solution,
                    "caption": caption,
                }
            )


if __name__ == "__main__":
    solution = StepsService()
    print(solution.get_response("There is garbage everywhere in the streets."))
