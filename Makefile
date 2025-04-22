# Nome do ambiente virtual
VENV=.venv

# Carregar variáveis do .env
include .env
export $(shell sed 's/=.*//' .env)

# ==========================
# Comandos Docker
# ==========================

# Buildar os serviços Docker
build:
	docker-compose -f $(DOCKER_COMPOSE_OLLAMA_PATH) build --no-cache

# Rebuildar os serviços Docker (força o rebuild)
rebuild:
	docker-compose -f $(DOCKER_COMPOSE_OLLAMA_PATH) up --build -d

# Subir os serviços Docker (sem rebuild)
start:
	docker-compose -f $(DOCKER_COMPOSE_OLLAMA_PATH) up -d

# Parar e remover os serviços Docker
stop:
	docker-compose -f $(DOCKER_COMPOSE_OLLAMA_PATH) down

# Limpar containers e volumes Docker
clean:
	docker-compose -f $(DOCKER_COMPOSE_OLLAMA_PATH) down -v

# Ver logs do container Ollama
logs-ollama:
	docker logs -f $(OLLAMA_CONTAINER_NAME)

# Ver logs do container OpenWebUI
logs-openwebui:
	docker logs -f $(OPENWEBUI_CONTAINER_NAME)

# Acessar o shell do container Ollama
shell-ollama:
	docker exec -it $(OLLAMA_CONTAINER_NAME) bash

# Acessar o shell do container OpenWebUI
shell-openwebui:
	docker exec -it $(OPENWEBUI_CONTAINER_NAME) bash

# Forçar a instalação dos modelos no container Ollama
install-models:
	docker exec -it $(OLLAMA_CONTAINER_NAME) bash install-ollama-models.sh

# ==========================
# Comandos Ambiente Virtual
# ==========================

# Instalar o ambiente virtual
venv-install:
	bash scripts/install-venv-with-uv.sh
	$(VENV)/bin/pip install --upgrade pip
	$(VENV)/bin/pip install .
	@echo "Para ativar o ambiente virtual, execute o seguinte comando no terminal:"
	@echo "source $(VENV)/bin/activate"

# ==========================
# Comandos Auxiliares
# ==========================

# Verificar status dos containers
status:
	docker-compose -f $(DOCKER_COMPOSE) ps

# Reiniciar os serviços Docker
restart:
	$(MAKE) stop
	$(MAKE) start

# ==========================
# Ajuda
# ==========================

# Exibir ajuda com a lista de comandos disponíveis
help:
	@echo "Comandos disponíveis:"
	@echo "  build           - Buildar os serviços Docker"
	@echo "  rebuild         - Rebuildar os serviços Docker (força o rebuild)"
	@echo "  start           - Subir os serviços Docker (sem rebuild)"
	@echo "  stop            - Parar e remover os serviços Docker"
	@echo "  clean           - Limpar containers e volumes Docker"
	@echo "  logs-ollama     - Ver logs do container Ollama"
	@echo "  logs-openwebui  - Ver logs do container OpenWebUI"
	@echo "  shell-ollama    - Acessar o shell do container Ollama"
	@echo "  shell-openwebui - Acessar o shell do container OpenWebUI"
	@echo "  venv-install    - Instalar o ambiente virtual"
	@echo "  venv-activate   - Exibir comando para ativar o ambiente virtual"
	@echo "  install         - Instalar dependências no ambiente virtual"
	@echo "  status          - Verificar status dos containers"
	@echo "  restart         - Reiniciar os serviços Docker"
	@echo "  install-models  - Forçar a instalação dos modelos no container Ollama"
