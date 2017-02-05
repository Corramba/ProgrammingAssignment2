

## This function creates a matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
invert<-NULL
set<-function(y) {
  x<<-y
  invert<<-NULL
}
get<-function()x
setinvert<-function(inverse) invert<<-inverse
getinvert<-function() invert
list(set=set, get=get, setinvert=setinvert, getinvert=getinvert)
  
}
 

## This function computes the inverse of the object created by 
## makeCacheMatrix function. If the inverse has already been calculated,
## then it should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
invert<-x$getinvert()
if(!is.null(invert)) {
  message("getting cashed data")
  return(invert)
  
}

m<-x$get()
invert<-solve(m, ...)
x$setinvert(invert)
invert

 
  
}