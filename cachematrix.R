## Put comments here that give an overall description of what your
## functions do

#1. Use this function to create a special "matrix" object that can cache its inverse


makeCacheMatrix <- function(x = matrix()) 
{
	seq_matrix <<- matrix(rnorm(16), 4)
	print(seq_matrix)
}

makeCacheMatrix()

#2. Use this function to calculate the inverse matrix
cacheSolve <- function(x, ...) 
{
 	if (det(x) != 0)
	{
		invMatrix <<- solve(x) 
	}
}

cacheSolve(seq_matrix)
print(invMatrix)

makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}
