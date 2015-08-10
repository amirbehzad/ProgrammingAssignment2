## Let's TEST ##
source('cachematrix.R')

# Let's create a simple square matrix and see its contents
myMatrix = matrix(c(2, 4, 3, 5), nrow=2, ncol=2)
myMatrix

# Now, let's transform it to our special cacheable matrix
mySpecialMatrix = makeCacheMatrix(myMatrix)

# Find (or calculate) the inverse of matrix
cacheSolve(mySpecialMatrix)
