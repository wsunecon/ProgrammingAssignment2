## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Create a list that can save the matrix to be inversed, save the function to take the inverse, 
## and store the result

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## First check if the inverse matrix regarding the list created based on some matrix has been stored.
## If stored, return the cached value.
## If not, take the inverse using information saved in the list in the first step.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)){
    message("getting cached inverse matrix")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
