# returns a cacheable version of the given matrix (x),
# with extra functions to get/set its inverse value.
#
# Example:
# myMatrix = matrix(c(2, 4, 3, 5), nrow=2, ncol=2)
# mySpecialMatrix = makeCacheMatrix(myMatrix)
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <- solve
    getinverse <- function() m
    list(
        set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse
    )
}

# returns the inverse of the given matrix (x),
# the given matrix should be created using makeCacheMatrix,
# otherwise this function returns error.
# Example:
# cacheSolve(mySpecialMatrix)
cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    # return the cached matrix, if available
    if (! is.null(m)) {
        message("Getting cached data")
        return (m)
    }
    # not cached?  let's calculate the inverse,
    # and store it in cache
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
