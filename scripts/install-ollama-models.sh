#!/bin/bash

# Verificar se o Ollama está instalado
if ! command -v ollama &> /dev/null; then
  echo "Ollama não está instalado. Certifique-se de que o binário 'ollama' está disponível no PATH."
  exit 1
fi

# Exibir a versão do Ollama
echo "Ollama instalado. Versão:"
ollama --version

# Função para verificar e baixar modelos
download_model() {
    MODEL_NAME=$1
    if ollama list | grep -q "^$MODEL_NAME"; then
        echo "Modelo $MODEL_NAME já está baixado."
    else
        echo "Baixando modelo $MODEL_NAME..."
        ollama pull $MODEL_NAME
    fi
}

# Lista de modelos a serem baixados
download_model gemma3:1b
#download_model gemma3:12b
#download_model gemma3:27b
download_model llama3.2
#download_model llama3.3
#download_model deepseek-r1
#download_model deepseek-r1:671b
#d#ownload_model mistral
#download_model phi4
#download_model codellama
#download_model llava

echo "Todos os modelos foram verificados e instalados conforme necessário."

# Confirmar a instalação
if [ $? -eq 0 ]; then
  echo "Modelos instalados com sucesso."
else
  echo "Erro ao instalar os modelos."
  exit 1
fi
