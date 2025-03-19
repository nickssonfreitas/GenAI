#!/bin/bash

# Carregar variáveis do arquivo .env
export $(grep -v '^#' /home/nicksson/Git/GenAI/ollama/.env | xargs)

# Nome do contêiner
CONTAINER_NAME="${OLLAMA_CONTAINER_NAME}"

# Caminho do script dentro do contêiner
CONTAINER_SCRIPT_PATH="/usr/local/bin/install-ollama-models.sh"

# Verifique se o contêiner está em execução
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Contêiner $CONTAINER_NAME está em execução."

    # Criar o script dentro do contêiner
    echo "Criando o script dentro do contêiner..."
    docker exec $CONTAINER_NAME /bin/sh -c "cat > $CONTAINER_SCRIPT_PATH << 'EOF'
#!/bin/sh
set -e

ollama -v

# Função para verificar e baixar modelos
download_model() {
    MODEL_NAME=\$1
    if ollama list | grep -q \"^\$MODEL_NAME\"; then
        echo \"Modelo \$MODEL_NAME já está baixado.\"
    else
        echo \"Baixando modelo \$MODEL_NAME...\"
        ollama pull \$MODEL_NAME
    fi
}

# Lista de modelos a serem baixados
download_model gemma3:1b
download_model llama3.2
download_model llama3.3
download_model codellama
download_model mistral
download_model phi4
download_model gemma3:27b
download_model deepseek-r1
download_model llava
#download_model deepseek-r1:671b
echo \"Todos os modelos foram verificados e instalados conforme necessário.\"
EOF"

    # Conceder permissões de execução ao script dentro do contêiner
    echo "Concedendo permissões de execução ao script..."
    docker exec $CONTAINER_NAME chmod +x $CONTAINER_SCRIPT_PATH

    # Executar o script dentro do contêiner
    echo "Executando o script dentro do contêiner..."
    docker exec $CONTAINER_NAME $CONTAINER_SCRIPT_PATH
else
    echo "Erro: Contêiner $CONTAINER_NAME não está em execução."
fi


# Após executar os script, verifique se os modelos foram baixado corretamente;
# docker exec -it ollama ollama list
