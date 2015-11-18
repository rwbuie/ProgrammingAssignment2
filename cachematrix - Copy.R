## Put comments here that give an overall description of what your
## functions do

## creates an object that contains 4 functions for storing and calling 2 vectors, a matrix and the matrix's inverse

makeCacheMatrix <- function(x = matrix()) {

        i <- NULL
        
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) i <<- solve
        getinverse <- function() i
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
        
}


## checks the passed matrix for existing cache, and creates and caches the matrix's inverse if absent

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)){
                message("solving inverse")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
