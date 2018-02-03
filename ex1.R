print("Loading data...")

data = read.csv(file="C:/Users/Rohil/Documents/machine-learning-ex1/machine-learning-ex1/ex1/ex1data2.txt", header=F)
X = data[, 1:2]
y = data[, 3]
m = length(y)

print("Normalizing features...")

X = featureNormalize(X)
X = cbind((1 + numeric(m)), X)