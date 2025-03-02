import os
from dotenv import load_dotenv
from transformers import AutoModelForCausalLM, AutoTokenizer
from huggingface_hub import snapshot_download

# Carregar variáveis do .env
load_dotenv()

# Obter credenciais da Hugging Face
model_name = os.getenv("HUGGINGFACE_MODEL",
                       "mistralai/Mistral-7B-Instruct-v0.3")
huggingface_token = os.getenv("HUGGINGFACE_TOKEN")
local_model_path = os.getenv("LOCAL_MODEL_PATH", "models/mistral-7b")

# Criar diretório para o modelo, se não existir
os.makedirs(local_model_path, exist_ok=True)

print(f"📥 Downloading model: {model_name} to {local_model_path}")

# Baixar o modelo da Hugging Face
snapshot_download(
    repo_id=model_name,
    local_dir=local_model_path,
    token=huggingface_token,
    allow_patterns=["*.json", "*.bin", "*.pt", "*.txt", "*.model"],
)

print(f"✅ Model downloaded and saved at {local_model_path}")
