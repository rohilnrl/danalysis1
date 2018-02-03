featureNormalize <- function(X) {
	m = length(X[, 1])
	iter = length(X[1, ])

	ran = apply(X, 2, mean)

	for (i in 2:iter) {
		v = X[, i]
		tmp = ran[i]
		X[, i] = (v - tmp) / sd(X[, i])
	}

	return(X)
}