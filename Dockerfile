FROM python:3.8-slim
WORKDIR /kcapp
COPY . /kcapp/
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
