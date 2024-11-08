import os

from fastapi import FastAPI, File, UploadFile

from .services.caption import CaptionService
from .services.solution import SolutionService
from .services.steps import StepsService

app = FastAPI()

caption_service = CaptionService()
solution_service = SolutionService()
steps_service = StepsService()


@app.post("/caption")
async def caption(file: UploadFile = File(...)):
    with open("image.jpg", "wb") as image:
        image.write(file.file.read())
    caption = caption_service.generate_caption("image.jpg")
    os.remove("image.jpg")

    return {"caption": caption}


@app.get("/solution")
async def solution(description: str, caption: str = None):
    return solution_service.get_response(description, caption)


@app.get("/steps")
async def steps(description: str, solution: str, caption: str = None):
    return steps_service.get_response(description, solution, caption)
