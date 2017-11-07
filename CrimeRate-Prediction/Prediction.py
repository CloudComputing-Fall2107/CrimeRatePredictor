import pandas as pd
from statsmodels.iolib.smpickle import load_pickle

df1 = pd.read_csv('TestData/TestData1.csv')
df2 = pd.read_csv('TestData/TestData2.csv')
df3 = pd.read_csv('TestData/TestData3.csv')

#load model
loaded_model1 = load_pickle('model1.pickle')
loaded_model2 = load_pickle('model2.pickle')
loaded_model3 = load_pickle('model3.pickle')

#x8 -> states
di = {1:"New Hampshire",2:"Connecticut",3:"Rhode Island",4:"Maine",5:"New York",6:"Virginia",7:"North Carolina",
      8:"South Carolina",9:"Georgia",10:"Florida"}
#predict-data
result1 = loaded_model1.predict(df1).astype('int')
df_new_1 = pd.DataFrame(result1).join(df1)
new_cols_1 = ['X1','X2','X3','X4','X5','X6','X7','X8']
df_new_1.columns = new_cols_1
df_new_1['X8'].replace(di,inplace= True)
df_new_1.to_csv('result1.csv')

result2 = loaded_model2.predict(df2).astype('int')
df_new_2 = pd.DataFrame(result2).join(df2)
new_cols_2 = ['X3','X1','X2','X8']
df_new_2.columns = new_cols_2
df_new_2['X8'].replace(di,inplace= True)
df_new_2.to_csv('result2.csv')

result3 = loaded_model3.predict(df3).astype('int')
df_new_3 = pd.DataFrame(result3).join(df3)
new_cols_3 = ['X4','X5','X6','X7','X1','X2','X3','X8']
df_new_3.columns = new_cols_3
df_new_3['X8'].replace(di,inplace= True)
df_new_3.to_csv('result3.csv')

