from typing import List
from langchain.schema import BaseOutputParser
import re

class NumberedListParser(BaseOutputParser):
    def parse(self, text: str) -> List[str]:
      pattern = "^\d+\.\s*(.*)$"
      return [match.strip() for match in re.findall(pattern, text, re.MULTILINE)]