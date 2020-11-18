## Creating a function that will cache the inverse of a matrix

## Creating function...
makeCacheMatrix <- function(x = matrix()) {
  ## to set the inverse property
  i <- NULL
  ##setting up the matrix
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  ##get and return the matrix that has been set up
  {get <- function() 
    x
  }
  ##set and get the inverse of the matrix, and then return the inverse property
  {setinverse <- function(inverse)
    i <<- inverse
  }
  {getinverse <- function() 
    i
  }
  ## Return the list of the method
  {list(set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse)
  }
}


## Compute the inverse of the special matrix returned by "makeCacheMatrix"
## above. If the inverse has already been calculated (and the matrix has not
## changed), then the "cachesolve" should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}

## That's all folks!