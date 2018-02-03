gradientDescent <- function(X, y, theta, alpha, iterations) {
	m = dim(X)[1]

	for (i in 1:iterations) {
		hypothesis = X %*% theta
		
		theta_0 = theta[1] - (alpha) * (1 / m) * sum((hypothesis - y) * X[,1])
		theta_1 = theta[2] - (alpha) * (1 / m) * sum((hypothesis - y) * X[,2])
		theta_2 = theta[3] - (alpha) * (1 / m) * sum((hypothesis - y) * X[,3])
	

		theta[1,1] = theta_0
		theta[2, 1] = theta_1
		theta[3, 1] = theta_2	
	}

	return(theta)
}