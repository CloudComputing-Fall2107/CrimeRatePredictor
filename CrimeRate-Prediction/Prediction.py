import pandas as pd
from statsmodels.iolib.smpickle import load_pickle

df1 = pd.read_csv('TestData/TestData1.csv')
df2 = pd.read_csv('TestData/TestData2.csv')
df3 = pd.read_csv('TestData/TestData3.csv')

#load model
loaded_model1 = load_pickle('model1.pickle')
loaded_model2 = load_pickle('model2.pickle')
loaded_model3 = load_pickle('model3.pickle')

#predict-data
result1 = loaded_model1.predict(df1).astype('int')
result1.to_csv('result1.csv')
result2 = loaded_model2.predict(df2).astype('int')
result2.to_csv('result2.csv')
result3 = loaded_model3.predict(df3).astype('int')
result3.to_csv('result3.csv')

