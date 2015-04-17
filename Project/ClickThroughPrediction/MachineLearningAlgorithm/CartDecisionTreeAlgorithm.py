from sklearn import tree
from sklearn.ensemble import RandomForestClassifier
import numpy as np
class CartDecisionTreeAlgorithm:
    def __init__(self,train_file,test_file):
        self.train_file = train_file
        self.test_file = test_file

    def classify_random_forest(self,X,Y):
       rf = RandomForestClassifier(n_estimators=1)
       return rf.fit(X,Y)

    def classify(self,X,Y):

        return tree.DecisionTreeClassifier().fit(X,Y)

    def loadData(self,file_name):

        with open(file_name) as f:
            data = []
            for line in f:
                line = line.strip().split(",")
                data.append([x for x in line])

        return  data

    def learnCART(self):
        train_input_data = self.loadData(self.train_file)
        target = [x[1] for x in train_input_data]
        target = target[1:]
        features = [x[2:] for x in train_input_data]
        features = features[1:]
        model = self.classify(features,target)

        test_input_data = self.loadData(self.test_file)
        target = [x[1] for x in test_input_data]
        target = target[1:]
        features = [x[2:] for x in test_input_data]
        features = features[1:]

        res = model.predict(features)
        print res
        print target


obj = CartDecisionTreeAlgorithm('../Data/preprocesseddata1.csv','../Data/preprocesseddata2.csv')
obj.learnCART()