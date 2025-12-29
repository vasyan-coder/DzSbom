"""Minimal demo app for SBOM/SCA exercises.

The point is not the functionality but having a realistic dependency graph.
"""

from flask import Flask, jsonify
import requests

app = Flask(__name__)


@app.get("/")
def root():
    # Make a harmless request so 'requests' is actually used.
    r = requests.get("https://example.com", timeout=3)
    return jsonify({"status": "ok", "example_com": r.status_code})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
