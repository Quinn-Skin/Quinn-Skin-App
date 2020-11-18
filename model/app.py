from flask import Flask, request, redirect, url_for, flash, jsonify
import numpy as np
import pickle
import pandas as pd
import json

# load model
file = open('model/recommender.pkl', 'rb')
model = pickle.load(file)

# app
app = Flask(__name__)

# routes
@app.route('/')
def hello_world():
    return 'Welcome to Quinn Skin'

@app.route('/predict', methods=['POST'])
def predict():
    
    data = request.get_json(force=True)
    prediction = np.array2string(model.predict(data))
    return jsonify(prediction)

@app.route('/productid', methods=['POST'])
def productid():

    data = request.get_json(force=True)
    prediction = model.predict(data)
#     prediction = np.array2string(model.predict(data))
    
    df = pd.read_csv('productid.csv')
    ids = df[df.name == prediction[0]]['product_id'].values[0]
    id = np.array2string(ids)
    

    return jsonify(id)

if __name__ == '__main__':
    
    app.run(debug=True)