from flask import Flask, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def get_time():
    return jsonify({'time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')})

if __name__ == "__main__":
    app.run()