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
- **Poetry** (Dependency management)
- **Git** (To clone the repository)

If you haven't set up your environment yet, run this script to install everything automatically on WSL:
```bash
wget https://raw.githubusercontent.com/nickssonfreitas/genai/main/scripts/install-pyenv.sh
chmod +x scripts/install-pyenv.sh
./scripts/install-pyenv.sh
```

---

## 📚 Installation

### 🔹 **1. Clone the Repository**
```bash
git clone https://github.com/nickssonfreitas/genai.git
cd genai
```

### 🔹 **2. Install Dependencies**
```bash
poetry env use python3.11
poetry install
```

### 🔹 **3. Activate the Virtual Environment**
```bash
poetry shell
```

---

## 🚀 Running the Project

After activating the virtual environment, you can run the project with:
```bash
poetry run python main.py
```

If the project has an entry point configured in `pyproject.toml`, you can run:
```bash
poetry run genai
```

---

## 📝 Testing and Code Quality

This project is configured with **linting, formatting, and automated testing** tools.

### ✅ **Run Linter and Auto-Fix**
```bash
poetry run ruff check .
poetry run black .
poetry run isort .
```

### ✅ **Run Static Typing with `mypy`**
```bash
poetry run mypy .
```

### ✅ **Run Tests**
```bash
poetry run pytest
```

### ✅ **Set Up `pre-commit` (Auto-check before committing)**
```bash
poetry run pre-commit install
```
Now, every time you make a `git commit`, all tools will run automatically.

---

## 📚 Publishing to PyPI (Optional)

If you want to publish your package on **PyPI**, follow these steps:

### 🔹 **1. Create a PyPI Account**
Register at [https://pypi.org/account/register/](https://pypi.org/account/register/).

### 🔹 **2. Generate an API Token**
Create an API token at [https://pypi.org/manage/account/token/](https://pypi.org/manage/account/token/).

### 🔹 **3. Configure Poetry**
```bash
poetry config pypi-token.pypi YOUR_TOKEN_HERE
```

### 🔹 **4. Build the Package**
```bash
poetry build
```

### 🔹 **5. Publish to PyPI**
```bash
poetry publish
```

Now, anyone can install your package with:
```bash
pip install genai
```

---

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
- **Poetry** (Dependency Management)
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

