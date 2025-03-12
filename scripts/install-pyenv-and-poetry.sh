#!/bin/bash

# Exibir mensagens formatadas
echo -e "\n🚀 Iniciando a instalação do pyenv, Python 3.11 (versão mais recente) e Poetry no WSL...\n"

# Atualizar pacotes do sistema
echo -e "🔄 Atualizando pacotes do sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar dependências necessárias para compilar o Python via pyenv
echo -e "📦 Instalando dependências essenciais..."
sudo apt install -y build-essential curl libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
    libffi-dev liblzma-dev git

# Verificar se o pyenv já está instalado
if command -v pyenv &> /dev/null; then
    echo -e "🚀 pyenv já está instalado, pulando a instalação."
else
    echo -e "📥 Baixando e instalando o pyenv..."
    curl https://pyenv.run | bash

    # Adicionar configuração do pyenv no shell
    echo -e "🔧 Configurando variáveis de ambiente para pyenv..."
    if [ -n "$ZSH_VERSION" ]; then
        SHELL_CONFIG="$HOME/.zshrc"
    elif [ -n "$BASH_VERSION" ]; then
        SHELL_CONFIG="$HOME/.bashrc"
    else
        SHELL_CONFIG="$HOME/.profile"
    fi
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$SHELL_CONFIG"
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "$SHELL_CONFIG"
    echo 'eval "$(pyenv init --path)"' >> "$SHELL_CONFIG"
    source "$SHELL_CONFIG"
fi

# Obter a versão mais recente do Python 3.11 disponível
LATEST_PYTHON_3_11=$(pyenv install --list | grep -E " 3.11.[0-9]+$" | tail -1 | tr -d ' ')

# Instalar a versão mais recente do Python 3.11 se não estiver instalada
if pyenv versions | grep -q "$LATEST_PYTHON_3_11"; then
    echo -e "🐯 Python $LATEST_PYTHON_3_11 já está instalado, pulando a instalação."
else
    echo -e "🐯 Instalando Python $LATEST_PYTHON_3_11 via pyenv..."
    pyenv install $LATEST_PYTHON_3_11
fi
pyenv global $LATEST_PYTHON_3_11

# Verificar instalação do Python
echo -e "🔢 Verificando instalação do Python..."
python --version

# Verificar se Poetry já está instalado
if command -v poetry &> /dev/null; then
    echo -e "🚀 Poetry já está instalado, pulando a instalação."
else
    echo -e "📦 Instalando Poetry..."
    curl -sSL https://install.python-poetry.org | python3 -
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_CONFIG"
    source "$SHELL_CONFIG"
fi

# Limpar pacotes desnecessários
echo -e "🧩 Removendo pacotes desnecessários..."
sudo apt autoremove -y

# Exibir mensagem final
echo -e "\n👌 Python $LATEST_PYTHON_3_11, pyenv e Poetry instalados/configurados com sucesso! Reinicie o terminal ou rode: source $SHELL_CONFIG"
