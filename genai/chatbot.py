import os
from dotenv import load_dotenv
from transformers import AutoModelForCausalLM, AutoTokenizer
import torch

# Carregar variáveis do .env
load_dotenv()

# Caminho do modelo salvo localmente
local_model_path = os.getenv("LOCAL_MODEL_PATH", "models/mistral-7b")

# Verifica se o modelo foi baixado
if not os.path.exists(local_model_path):
    raise ValueError(
        f"❌ Model not found at {local_model_path}. Run 'download_model.py' first.")


class ChatBot:
    def __init__(self):
        self.device = "cuda" if torch.cuda.is_available() else "cpu"

        print(f"🔄 Loading model from: {local_model_path} on {self.device}")

        self.tokenizer = AutoTokenizer.from_pretrained(local_model_path)
        self.model = AutoModelForCausalLM.from_pretrained(
            local_model_path).to(self.device)

    def chat(self, prompt, max_length=100):
        input_ids = self.tokenizer.encode(
            prompt, return_tensors="pt").to(self.device)
        output = self.model.generate(
            input_ids, max_length=max_length, temperature=0.7, top_k=50)
        response = self.tokenizer.decode(
            output[:, input_ids.shape[-1]:][0], skip_special_tokens=True)
        return response


if __name__ == "__main__":
    bot = ChatBot()
    print("\n🤖 Welcome to GenAI Chatbot! Type 'exit' to quit.")

    while True:
        user_input = input("You: ")
        if user_input.lower() == "exit":
            print("👋 Goodbye!")
            break

        response = bot.chat(user_input)
        print(f"GenAI: {response}")
