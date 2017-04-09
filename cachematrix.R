## Calculating the inverse of a matrix if it is not availabl in the cache already

## The below function creates a list which has four functions as attributes set, get, setinverse and getinverse 

makeCacheMatrix <- function(x = matrix()) {
  inverse_matrix <- NULL
  set <- function(y) {
      x <<- y
      inverse_matrix <<- NULL
    }
  get <- function() x
  setinverse <- function(inv) inverse_matrix <<- inv
  getinverse <- function() inverse_matrix 
  list (set = set, get =get , setinverse = setinverse, getinverse = getinverse)
}


## The below function gets the inverse of the matrix if it is already available in the cache 
## else calculates the inverse and stores it in the cache 

cacheSolve <- function(x, ...) {
       inverse_matrix <- x$getinverse()
       if (!is.null(inverse_matrix)) {
         message ("getting cached data")
         return(inverse_matrix)
       }
       data <- x$get()
       inverse_matrix <- solve(data)
       inv <- x$setinverse (inverse_matrix)
       inv
}


