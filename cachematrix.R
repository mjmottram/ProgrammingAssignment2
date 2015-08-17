## cachematrix.R: 
##
## Script containing two functions that allows users to store
## matrices and cache their inverse.

## makeCacheMatrix: function that creates a matrix object that
## is able to cache a copy of its inverse.  Actually returns a
## list that contains the required getinverse and setinverse
## methods.  Arguments: x: matrix to be stored.

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    # setter and getter functions
    # get / set: for the initial matrix
    # getinverse / setinverse: for the inverse matrix
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x 
    setinverse <- function(inv) inverse <<- inv
    getinverse <- function() inverse
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## cacheSolve: function that computes the inverse of a
## matrix object (list) created by makeCacheMatrix.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverse <- x$getinverse()
    if(!is.null(inverse)) {
        # inverse already calculated
        return(m)
    }
    # inverse not calculated, find and set for the object x
    data <- x$get()
    inverse <- solve(data, ...)
    x$setinverse(inverse)
    inverse
}
