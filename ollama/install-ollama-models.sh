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

    # Crie o script dentro do contêiner
    echo "Criando o script dentro do contêiner..."
    docker exec $CONTAINER_NAME /bin/sh -c "cat > $CONTAINER_SCRIPT_PATH << 'EOF'
#!/bin/sh
ollama -v
# Baixar e configurar os modelos principais do Ollama
echo -e 'Baixando e configurando o modelo gemma3:1b...\n'
ollama run gemma3:1b
echo -e 'Baixando e configurando o modelo gemma3:27b...\n'
ollama run gemma3:27b
#echo -e 'Baixando e configurando o modelo deepseek-r1:671b...\n'
#ollama run deepseek-r1:671b
#echo -e 'Baixando e configurando o modelo llama3.3...\n'
#ollama run llama3.3 #70B
echo -e 'Baixando e configurando o modelo llama3.2...\n'
ollama run llama3.2 #3B
echo -e 'Baixando e configurando o modelo mistral...\n'
ollama run mistral #7B
echo -e 'Baixando e configurando o modelo phi4...\n'
ollama run phi4 #14B
EOF"

    # Conceda permissões de execução ao script dentro do contêiner
    echo "Concedendo permissões de execução ao script..."
    docker exec $CONTAINER_NAME chmod +x $CONTAINER_SCRIPT_PATH

    # Execute o script dentro do contêiner
    echo "Executando o script dentro do contêiner..."
    docker exec $CONTAINER_NAME $CONTAINER_SCRIPT_PATH
else
    echo "Erro: Contêiner $CONTAINER_NAME não está em execução."
fi