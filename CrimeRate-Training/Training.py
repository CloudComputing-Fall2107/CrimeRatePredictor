import pandas as pd
from statsmodels.iolib.smpickle import load_pickle
from statsmodels.formula.api import ols
#csv to dataframe
df = pd.read_csv('Datasets/CrimeRate.csv')
#create model
model1 = ols("X1 ~ X2 + X3 + X4 + X5 + X6 + X7 + X8",df).fit()
model2 = ols("X3 ~ X1 + X2 + X8",df).fit()
model3 = ols("X4 + X5 + X6 + X7 ~ X1 + X2 + X3 + X8",df).fit()
#store model
model1.save('model1.pickle')
model2.save('model2.pickle')
model3.save('model3.pickle')