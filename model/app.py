from flask import Flask, request, redirect, url_for, flash, jsonify
import numpy as np
import pickle
import pandas as pd
import json

# app
app = Flask(__name__)

# routes
@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/predict', methods=['POST'])
def predict():
    
    data = request.get_json(force=True)
    # prediction = np.array2string(model.predict(data))
    prediction = np.array2string(model.predict(data))
    return jsonify(prediction)

if __name__ == '__main__':

    # load model
    file = open('/Users/amy/deployment-model/recommender.pkl', 'rb')
    model = pickle.load(file)

    app.run(port = 5000, debug=True)