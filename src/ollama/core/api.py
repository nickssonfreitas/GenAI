import requests
import json

def generate_response(prompt, model="llama3.2", url="http://localhost:11434/api/generate"):
    """
    Envia um prompt para a API do Ollama e retorna a resposta do modelo.
    
    :param prompt: Texto de entrada para o modelo.
    :param model: Nome do modelo a ser utilizado.
    :param url: URL da API do Ollama.
    :return: Dicionário contendo a resposta da API.
    """
    payload = {
        "model": model,
        "prompt": prompt
    }
    
    headers = {"Content-Type": "application/json"}
    response = requests.post(url, data=json.dumps(payload), headers=headers)
    
    if response.status_code == 200:
        return response.json()
    else:
        return {"error": f"Request failed with status code {response.status_code}", "details": response.text}