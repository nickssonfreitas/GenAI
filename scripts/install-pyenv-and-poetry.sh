#!/bin/bash

# Exibir mensagens formatadas
echo -e "\n🚀 Iniciando a instalação do pyenv e Poetry no WSL...\n"

# Atualizar pacotes do sistema
echo -e "🔄 Atualizando pacotes do sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar dependências necessárias para compilar o Python via pyenv
echo -e "📦 Instalando dependências essenciais..."
sudo apt install -y build-essential curl libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
    libffi-dev liblzma-dev git

# Instalar o pyenv
echo -e "📥 Baixando e instalando o pyenv..."
curl https://pyenv.run | bash

# Adicionar configuração do pyenv no shell
echo -e "🔧 Configurando variáveis de ambiente para pyenv..."

# Definir o shell correto (bash ou zsh)
if [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
else
    SHELL_CONFIG="$HOME/.profile"
fi

# Adicionar pyenv ao shell
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$SHELL_CONFIG"
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "$SHELL_CONFIG"
echo 'eval "$(pyenv init --path)"' >> "$SHELL_CONFIG"

# Recarregar o shell para aplicar mudanças do pyenv
echo -e "🔄 Aplicando mudanças no shell..."
exec $SHELL

# Instalar Poetry
echo -e "📦 Instalando Poetry..."
curl -sSL https://install.python-poetry.org | python3 -

# Adicionar Poetry ao PATH
echo -e "🔧 Configurando Poetry no ambiente..."
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_CONFIG"

# Recarregar o shell para aplicar mudanças do Poetry
echo -e "🔄 Finalizando instalação..."
exec $SHELL

# Limpar pacotes desnecessários
echo -e "🧹 Removendo pacotes desnecessários..."
sudo apt autoremove -y

# Exibir mensagem final
echo -e "\n✅ pyenv e Poetry instalados com sucesso! Reinicie o terminal ou rode: source $SHELL_CONFIG"
