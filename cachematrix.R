## Put comments here that give an overall description of what your
## functions do

#seq_matrix <- matrix(rnorm(16), 4) #test out inverse function with known output (T1-86)
#print(seq_matrix)

#1. Use this function to create a special "matrix" object that can cache its inverse. Note: Use makeVector() function as reference
makeCacheMatrix <- function(x = matrix()) 
{
	m <- NULL
	set <- function(y) 
	{
		x <<- y
		m <<- NULL
	}

	get <- function() x
	setInverse <- function(inverse) m <<- inverse
	getinverse <- function() m
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

#2. Use this function to calculate the inverse matrix. Note: Use cashemean() function as reference
cacheSolve <- function(x, ...) 
{
	m <- x$getinverse()

	if(!is.null(m)) 
	{
		message("getting cached data")
		return(m)
	}

	data <- x$get()
	m <- inverse(data, ...)
	x$setinverse(m)
	m
}

#makeVector <- function(x = numeric()) {
#        m <- NULL
#        set <- function(y) {
#                x <<- y
#                m <<- NULL
#        }
#        get <- function() x
#        setmean <- function(mean) m <<- mean
#        getmean <- function() m
#        list(set = set, get = get,
#             setmean = setmean,
#             getmean = getmean)
#}
#
#cachemean <- function(x, ...) {
#        m <- x$getmean()
#        if(!is.null(m)) {
#                message("getting cached data")
#                return(m)
#        }
#        data <- x$get()
#        m <- mean(data, ...)
#        x$setmean(m)
#        m
#}
