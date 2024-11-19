FROM python:3.8-slim-buster
WORKDIR /src
ENV FLASK_APP app.py
COPY requirements.txt . 
RUN pip3 install -r requirements.txt
COPY app.py .
COPY templates ./templates
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]