from ollama.core.api import generate_response

def test_generate_response_success(mocker):
    mock_response = {"response": "The sky is blue because of Rayleigh scattering."}
    mocker.patch("requests.post", return_value=mocker.Mock(status_code=200, json=lambda: mock_response))
    
    result = generate_response("Why is the sky blue?")
    assert "response" in result
    assert result["response"] == "The sky is blue because of Rayleigh scattering."

def test_generate_response_failure(mocker):
    mocker.patch("requests.post", return_value=mocker.Mock(status_code=500, text="Internal Server Error"))
    
    result = generate_response("Why is the sky blue?")
    assert "error" in result
    assert "Request failed with status code 500" in result["error"]
