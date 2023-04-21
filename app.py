from __future__ import division, print_function

from flask import Flask

import tensorflow as tf
import sys
import os
import glob
import re
import numpy as np


from keras.models import load_model
from keras.preprocessing import image

from flask import Flask, redirect, url_for, request, render_template, jsonify
from werkzeug.utils import secure_filename
#from gevent.pywsgi import WSGIServer

app = Flask(__name__)

MODEL_PATH = 'C:/Users/User/ResNet50_Model.h5'


model = load_model(MODEL_PATH)


class_names = []

# print('Model loaded. Check http://127.0.0.1:4000/')
print('Model loaded. Check http://127.0.0.1:4000/')


def model_predict(img_path, model):
    img = tf.keras.utils.load_img(img_path, target_size=(128, 128))
    x = tf.keras.utils.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    preds = model.predict(x)
    return preds


@app.route('/predict', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        f = request.files['file']
        basepath = os.path.dirname(__file__)
        file_path = os.path.join(
            basepath, 'uploads', secure_filename(f.filename))
        f.save(file_path)
        preds = model_predict(file_path, model)

        if np.amax(preds) > 0.6:
            result = class_names[int(np.argmax(preds,axis=1))]
        else:
            result = "Invalid image"
        print('prediction' , result )
        return jsonify({'prediction' : preds})
    print(jsonify({'prediction' : result}))
    return None


if __name__ == '__main__':
    app.run(debug=True, port=4000)

