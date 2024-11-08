import requests
from PIL import Image
from transformers import BlipForConditionalGeneration, BlipProcessor


class CaptionService:
    def __init__(self):
        self.processor = BlipProcessor.from_pretrained(
            "Salesforce/blip-image-captioning-large"
        )
        self.model = BlipForConditionalGeneration.from_pretrained(
            "Salesforce/blip-image-captioning-large"
        )

    def generate_caption(self, image_path):
        image = Image.open(image_path)
        inputs = self.processor(image, return_tensors="pt")
        caption = self.model.generate(**inputs)
        return self.processor.decode(caption[0], skip_special_tokens=True)
