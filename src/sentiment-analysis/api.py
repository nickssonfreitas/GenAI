from fastapi import FastAPI
from genai.chatbot import ChatBot

app = FastAPI(title="GenAI Chatbot API", version="1.0.0")

# Inicializa o Chatbot
bot = ChatBot()


@app.get("/")
def home():
    return {"message": "Welcome to the GenAI Chatbot API!"}


@app.post("/chat")
def chat(prompt: str):
    response = bot.chat(prompt)
    return {"response": response}
