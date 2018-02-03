computeCost <- function(X, y, theta) {
	m = dim(X)[1]
	J = 0

	hypothesis = X %*% theta
	cost = (hypothesis - y) ^ 2
	J = (1 / (2 * m)) * sum(cost)
	print(J)
}