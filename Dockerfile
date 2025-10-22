# 1. Wähle ein offizielles Python-Basis-Image
# Wir nehmen "slim", da es kleiner ist und alles Nötige enthält.
FROM python:3.12-slim

# 2. Lege ein Arbeitsverzeichnis im Container fest
# Alle folgenden Befehle werden in /app ausgeführt
WORKDIR /app

# 3. Kopiere die Abhängigkeiten-Liste
# Wir kopieren diese Datei zuerst, um den Docker-Cache zu nutzen.
# Dieser Schritt wird nur wiederholt, wenn sich die requirements.txt ändert.
COPY requirements.txt .

# 4. Installiere die Python-Abhängigkeiten
RUN pip install --no-cache-dir -r requirements.txt

# 5. Kopiere den gesamten restlichen Projektcode
# (app.py, model.pkl, etc.) in das Arbeitsverzeichnis
COPY . .

# 6. Gib den Port frei, auf dem Streamlit standardmäßig läuft
EXPOSE 8501

# 7. Definiere den Befehl, der beim Starten des Containers ausgeführt wird
# Das startet deine Streamlit-App
CMD ["streamlit", "run", "Live_Demo.py"]
