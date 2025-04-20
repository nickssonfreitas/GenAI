#!/bin/bash

# -----------------------------------------------------------------------------
# Script para instalação do Python 3.11, uv e Poetry no WSL
# -----------------------------------------------------------------------------
# Este script realiza as seguintes tarefas:
# 1. Atualiza os pacotes do sistema.
# 2. Instala dependências essenciais para o Python.
# 3. Instala o uv.
# 4. Instala o Python 3.11 usando o uv.
# 5. Cria um ambiente virtual (venv) com Python 3.11.
# 6. Instala o Poetry.
# 7. Remove pacotes desnecessários.
# -----------------------------------------------------------------------------

# Configuração inicial
set -e  # Interrompe o script em caso de erro

# Atualizar pacotes do sistema
echo -e "\n🔄 Atualizando pacotes do sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar dependências essenciais
echo -e "\n📦 Instalando dependências essenciais..."
sudo apt install -y build-essential curl libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
    libffi-dev liblzma-dev git

# Instalar o uv
echo -e "\n📥 Instalando o uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

# Atualizar pacotes novamente com o uv
echo -e "\n🔄 Atualizando pacotes novamente com o uv..."
uv self update

# Instalar Python 3.11 usando o uv
PYTHON_VERSION="3.11"
echo -e "\n🐍 Instalando Python $PYTHON_VERSION via uv..."
uv python install $PYTHON_VERSION

# Verificar instalação do Python
echo -e "\n🔢 Verificando instalação do Python..."
python --version

# Criar um ambiente virtual com Python 3.11 na pasta .venv do projeto
PROJECT_DIR="$(pwd)"  # Diretório atual do projeto
VENV_DIR="$PROJECT_DIR/.venv"
echo -e "\n🐍 Criando um ambiente virtual em $VENV_DIR..."
if [ -d "$VENV_DIR" ]; then
    echo -e "⚠️ Ambiente virtual já existe em $VENV_DIR, pulando a criação."
else
    python -m venv "$VENV_DIR"
    echo -e "✅ Ambiente virtual criado em $VENV_DIR."
fi

# Ativar o ambiente virtual
echo -e "\n🚀 Ativando o ambiente virtual..."
source "$VENV_DIR/bin/activate"
echo -e "✅ Ambiente virtual ativado."

# Limpar pacotes desnecessários
echo -e "\n🧹 Removendo pacotes desnecessários..."
sudo apt autoremove -y

# Mensagem final
echo -e "\n👌 Instalação concluída com sucesso!"
echo -e "Python $PYTHON_VERSION, uv e Poetry estão prontos para uso."
echo -e "Reinicie o terminal ou rode: source ~/.bashrc"
