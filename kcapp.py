from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    message = os.getenv('this is my app')
    return message

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)