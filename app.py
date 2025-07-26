from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello! , Welcome to the Flask python web app.'

@app.route('/health')
def health():
    return 'Server is up and running'

