import pytest
from genai.chatbot import ChatBot


@pytest.fixture
def chatbot():
    return ChatBot()


def test_chatbot_response(chatbot):
    user_input = "Hello, how are you?"
    response = chatbot.chat(user_input)

    assert isinstance(response, str)
    assert len(response) > 0
