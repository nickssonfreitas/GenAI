# 🚀 GenAI - Generative AI Projects

Welcome to **GenAI**, a project focused on **Generative AI**, utilizing advanced LLM and RAG models. This repository provides everything you need to quickly set up a professional development environment.

# Project 01. ChatBot - Personal Assistant

## 📌 **Objective**
The ChatBot aims to be a personal assistant, providing users with an interactive tool to ask questions and obtain general information quickly and efficiently.

## 🎯 **Target Audience**
The target audience consists of users looking for a virtual assistant to ask questions and receive answers on various topics in an intuitive manner.

## 🔄 **Interaction Model**
The interaction model is based on a **question-and-answer** system, where users can submit queries to the ChatBot, and it will provide responses based on its pre-trained knowledge.

## 🧠 **AI Model**
The ChatBot uses a **pre-trained model** available on Hugging Face. This project employs a model that runs **locally on the machine**, without requiring an external API for inference, ensuring fast and efficient responses.

**Chosen Model:**
- **Pre-trained Model:** [Mistral-7B-Instruct](https://huggingface.co/mistralai/Mistral-7B-Instruct) (or another available model from Hugging Face of your choice).


## 📌 Requirements
Before starting, make sure you have the following installed:

- **WSL (if on Windows)**
- **Python 3.11+**
- **uv** (Dependency management)
- **Git** (To clone the repository)

---

## 📚 Installation

### 🔹 **1. Clone the Repository**
```bash
git clone https://github.com/nickssonfreitas/genai.git
cd genai
```

### 🔹 **2. Install Dependencies**
Use o script para configurar o ambiente virtual e instalar as dependências:
```bash
make venv-install
```

---

## 🚀 Running the Project

### 🔹 **1. Configure the `.env` File**
Crie o arquivo `.env` com base no exemplo:
```bash
make env
```
Edite o arquivo `.env` para ajustar as configurações, como portas e caminhos de volumes.


### 🔹 **2. Build and Run the Docker Containers**
Construa e inicie os serviços Docker:
```bash
make start
```

### 🔹 **3. Install the AI Models**
Baixe e configure os modelos de IA necessários:
```bash
make install-models
```

### 🔹 **4. Access the Application**
A aplicação estará disponível em:
```
http://localhost:3000
```

### 🔹 **5. Useful Commands**
- Parar os containers:
  ```bash
  make stop
  ```
- Limpar containers e volumes:
  ```bash
  make clean
  ```
- Ver logs do container Ollama:
  ```bash
  make logs-ollama
  ```
- Ver logs do container OpenWebUI:
  ```bash
  make logs-openwebui
  ```

---

## 🚀 Running the Project with Python

Se preferir rodar o projeto diretamente com Python, siga os passos abaixo:

### 🔹 **1. Ative o Ambiente Virtual**
Ative o ambiente virtual criado:
```bash
source .venv/bin/activate
```

### 🔹 **2. Execute o Projeto**
Rode o projeto diretamente:
```bash
uv run python main.py
```

Se o projeto tiver um ponto de entrada configurado no `pyproject.toml`, você pode rodar:
```bash
uv run genai
```

---

## 📝 Testing and Code Quality

This project is configured with **linting, formatting, and automated testing** tools.

### ✅ **Run Linter and Auto-Fix**
```bash
uv lint
uv format
```

### ✅ **Run Static Typing with `mypy`**
```bash
uv typecheck
```

### ✅ **Run Tests**
```bash
uv test
```

### ✅ **Set Up `pre-commit` (Auto-check before committing)**
```bash
uv pre-commit install
```
Now, every time you make a `git commit`, all tools will run automatically.

## 📝 Project Structure

```
genai/
├── genai/                   # Project source code
│   ├── __init__.py
│   ├── main.py              # Main script
│   ├── utils.py             # Helper functions
│   ├── models/              # AI models
│   ├── data/                # Dataset files
│   ├── config/              # Project settings
│
├── tests/                   # Automated tests
│   ├── test_main.py
│
├── scripts/                 # Utility scripts
│   ├── install-pyenv.sh     # Installation script for WSL/Linux
│
├── pyproject.toml           # Project and dependencies configuration
├── README.md                # Documentation
├── .gitignore               # Files ignored by Git
```

---

## 📢 Contributing

1. **Fork** the repository.
2. **Create a Branch** for your feature:
   ```bash
   git checkout -b my-feature
   ```
3. **Commit Your Changes**:
   ```bash
   git commit -m "Adding new feature"
   ```
4. **Push to the Remote Repository**:
   ```bash
   git push origin my-feature
   ```
5. **Open a Pull Request**.

---

## 🛠 Technologies Used

- **Python 3.11**
- **uv** (Dependency Management)
- **LangChain** (LLMs and Agents)
- **Transformers** (AI Models)
- **PyTorch** (Deep Learning Framework)
- **FAISS** (Indexing for RAG)
- **Mypy** (Static Typing)
- **Black** (Code Formatting)
- **Ruff** (Linting and Auto-Fix)
- **Pytest** (Automated Testing)

---

## 📍 License

This project is licensed under the **MIT License**.

---

## 📲 Contact

📧 Email: **nickssonarrais@gmail.com**  
🤖 GitHub: [**@nickssonfreitas**](https://github.com/nickssonfreitas)

If you have any questions or suggestions, feel free to open an **Issue**! 🚀

