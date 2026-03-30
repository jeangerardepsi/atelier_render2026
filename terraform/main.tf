import os  # <--- N'oublie pas l'import tout en haut !
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def hello():
    return "Flask + Docker + GHCR + Terraform + Render"

# --- ROUTE DE L'EXERCICE 1 ---
@app.route("/info")
def info():
    return {
        "app": "Flask Render",
        "student": "Jean Gerard", 
        "version": "v1"
    }

# --- ROUTE DE L'EXERCICE 2 ---
@app.route("/env")
def env():
    # os.getenv("ENV") va récupérer la valeur "production" injectée par Terraform
    return {"env": os.getenv("ENV", "non défini")}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
