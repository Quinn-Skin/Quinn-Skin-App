import pickle
import numpy as np
import bentoml
from bentoml import api, artifacts, env, BentoService
from bentoml.frameworks.sklearn import SklearnModelArtifact
from bentoml.adapters import DataframeInput

    
# Load the pickled model 
# modelLoad = joblib.load('recommender_model.pkl')


@bentoml.env(infer_pip_packages=True)
@bentoml.artifacts([SklearnModelArtifact('model')])
class SklearnModelService(bentoml.BentoService):

    @bentoml.api(input = DataframeInput(), batch =True)
    def predict(self, df):
        return self.artifacts.model.predict(df)

file = open('/Users/amy/recommender_model.pkl', 'rb')
modelLoad = pickle.load(file)

svc = SklearnModelService()
print(type(svc))
svc.pack('model',modelLoad)
# saved_path = svc.save()

svc.predict([[1,40,4,1, 0, 1, 0, 1]])




