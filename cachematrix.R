## The following two functions cache their result when calculating the inverse of a matrix

## This function returns a list containing functions to:
## 1. set the value of the original matrix
## 2. get the value of the original matrix
## 3. set the value of the inverse matrix
## 4. get the value of the invrese matrix

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) inv <<- solve
  getsolve <- function() inv
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)

}


## This function accepts the list above as input, check if inverse has been calculated,
## get the cached value if yes, and caculate inverse if not

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getsolve()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setsolve(inv)
  inv
  
  
}
