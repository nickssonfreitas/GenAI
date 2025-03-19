import requests
import json

def generate_response(prompt, model="llama3.2", url="http://localhost:11434/api/generate", stream=False, return_json=True):
    """
    Envia um prompt para a API do Ollama e retorna a resposta do modelo.
    
    :param prompt: Texto de entrada para o modelo.
    :param model: Nome do modelo a ser utilizado.
    :param url: URL da API do Ollama.
    :return: Dicionário contendo a resposta da API.
    """
    payload = {
        "model": model,
        "prompt": prompt,
         "stream": stream
    }
    
    headers = {"Content-Type": "application/json"}
    response = requests.post(url, data=json.dumps(payload), headers=headers)
    
    if response.status_code == 200:
        if return_json:
            return response.json()
        else:
            response
    else:
        return {"error": f"Request failed with status code {response.status_code}", "details": response.text}