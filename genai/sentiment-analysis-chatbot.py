"""
chatbot.py

This script implements a chatbot using the BERTimbau model, a Portuguese-trained
BERT variant. The chatbot classifies user input as either "Positive" or
"Negative" and provides responses through a Gradio-based UI.

Features:
- Loads a pre-trained BERTimbau model for sequence classification.
- Uses Gradio to create a web-based chatbot interface.
- Supports CUDA for faster inference if a GPU is available.
"""

import os
from dotenv import load_dotenv
from transformers import AutoTokenizer, AutoModelForSequenceClassification
import torch
import gradio as gr

# Load environment variables
load_dotenv()
MODEL_NAME = os.getenv("MODEL_NAME", "neuralmind/bert-base-portuguese-cased")

# Load tokenizer and model
print("Loading the model...")
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)
model = AutoModelForSequenceClassification.from_pretrained(MODEL_NAME, num_labels=2)

device = "cuda" if torch.cuda.is_available() else "cpu"
model.to(device)
print("Model loaded successfully!")


def chatbot_response(prompt: str) -> str:
    """
    Generate a response based on user input using the BERTimbau model.

    Parameters
    ----------
    prompt : str
        The input text provided by the user.

    Returns
    -------
    str
        The classification output: "Positive" or "Negative".
    """
    inputs = tokenizer(prompt, return_tensors="pt", padding=True, truncation=True).to(device)
    with torch.no_grad():
        outputs = model(**inputs)
    prediction = torch.argmax(outputs.logits, dim=1).item()
    response = "Positive" if prediction == 1 else "Negative"
    return response


# Create Gradio interface
gr.Interface(
    fn=chatbot_response,
    inputs="text",
    outputs="text",
    title="🧠 ChatBot BERTimbau - Portuguese Assistant",
    description="Enter your question and the ChatBot will respond using BERTimbau.",
).launch(share=True)
