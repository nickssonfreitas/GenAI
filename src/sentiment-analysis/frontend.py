import streamlit as st
import requests
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()
API_URL = os.getenv("API_URL", "http://127.0.0.1:8000/chat")

st.title("🤖 GenAI Chatbot")
st.write("Interact with the AI-powered chatbot!")

if "messages" not in st.session_state:
    st.session_state.messages = []

# Display chat history
for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.write(message["content"])

# User input field
user_input = st.chat_input("Ask me anything...")
if user_input:
    st.session_state.messages.append({"role": "user", "content": user_input})

    # Send request to API
    response = requests.post(API_URL, params={"prompt": user_input})
    bot_response = response.json().get("response", "I'm not sure how to respond.")

    st.session_state.messages.append(
        {"role": "assistant", "content": bot_response})

    # Display chatbot response
    with st.chat_message("assistant"):
        st.write(bot_response)
