# Ollama

Ollama is a powerful library for natural language processing (NLP) that provides a range of pre-trained models for various NLP tasks. This README provides an overview of why you should use Ollama, the models available, and how to install it on Linux.

## Why Use Ollama?

### Advantages
- **Pre-trained Models**: Ollama offers a variety of pre-trained models that can be used out-of-the-box for different NLP tasks such as text classification, named entity recognition, and text generation.
- **Ease of Use**: The library is designed to be user-friendly, with simple APIs that make it easy to integrate into your projects.
- **Performance**: Ollama models are optimized for performance, providing fast and accurate results.
- **Community Support**: Being part of the Hugging Face ecosystem, Ollama benefits from a large community of developers and researchers who contribute to its development and provide support.

### Disadvantages
- **Resource Intensive**: Some of the larger models can be resource-intensive, requiring significant computational power and memory.
- **Dependency on Hugging Face**: Ollama relies on the Hugging Face infrastructure, which means you need to have access to the internet to download models and updates.
- **Limited Customization**: While pre-trained models are convenient, they may not always fit specific use cases perfectly, requiring fine-tuning or custom model training.

## Available Models

Ollama provides access to a wide range of models, including but not limited to:
- **Run Llama 3.3**: A versatile model for various NLP tasks.
- **DeepSeek-R1**: Specialized in deep text analysis and understanding.
- **Phi-4**: Optimized for high-performance text generation.
- **Mistral**: Focused on accurate and coherent text generation.
- **Gemma 3**: Designed for named entity recognition and classification.
- **Other Models**: Various other models for specific NLP tasks.

## Installation on Linux

To install Ollama on a Linux system, follow these steps:

1. **Install Ollama**: Ensure you have Python 3.6 or higher installed on your system. You can check your Python version with
    ```sh
    curl -fsSL https://ollama.com/install.sh | sh
    ```

2. **Install Poetry**: If you don't have pip installed, you can install it using:
    ```sh
    poetry add ollama
    ```
3. **QuickStart**
    ```sh
    ollama run llama3.2
    ```
4. **Installa OpenWebUUI**
    ```sh
    docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
    ```