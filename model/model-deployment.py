from sklearn.externals import joblib
import pickle
import bentoml
from bentoml.frameworks.sklearn import SklearnModelArtifact
from bentoml.adapters import DataframeInput

    
# Load the pickled model 
# modelLoad = joblib.load('recommender_model.pkl')


@bentoml.env(infer_pip_packages=True)
@bentoml.artifacts([SklearnModelArtifact('model')])
class SklearnModelService(bentoml.BentoService):

    @bentoml.api(input = DataframeInput(), batch =True)
    def predict(self, df):
        result = self.artifacts.model.predict(df)
        return result 

file = open('/Users/amy/recommender_model.pkl', 'rb')
modelLoad = pickle.load(file)

svc = SklearnModelService()
svc.pack('model',modelLoad)
saved_path = svc.save()




