# Developers

Developer quick-start

1) Create a virtualenv and install deps (see README).
2) Add your `GROQ_API_KEY` to `.env`.
3) Run `python -m pip install -r requirements.txt` and then `python app.py`.

Key extension points
- `transcribe_with_groq(audio_path)` in `app.py`: replace or extend to add other providers (local Whisper, OpenAI, etc.).
- `Recorder` class: change sample rate, device selection, or add voice activity detection (VAD) to auto-split recordings.
- GUI popup: `GUIManager` is simple and can be adapted for richer interactions or removed for headless (CLI) usage.

Adding other models or providers
- To add another provider, implement a function with the same signature as `transcribe_with_groq` and call it from the processing thread. Consider adding a simple provider registry and a config option in `.env` to choose provider.

Adding agents or tools
- Suggested approach:
  - Add a new module that wraps the agent framework (e.g., LangChain, Auto-GPT) and exposes a function to process text results.
  - Keep the recording/transcription pipeline separate from agent logic; after transcription, pass the text to the agent module.

Packaging and distribution
- For PyPI packaging, add `pyproject.toml` and a proper entry point script.

Notes
- Replace the placeholder copyright and "Your Name" in `LICENSE`.
