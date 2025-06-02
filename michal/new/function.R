pole <- function(a, b, c) {
  # a: first point coordinates (x,y)
  # b: second point coordinates (x,y)
  # c: third point coordinates (x,y)
  
  # Extract coordinates
  xa <- a[1]; ya <- a[2]
  xb <- b[1]; yb <- b[2]
  xc <- c[1]; yc <- c[2]
  
  # Calculate area using shoelace formula
  area <- abs(((xb - xa) * (yc - ya) - (xc - xa) * (yb - ya)) / 2)
  
  return(area)
}

pole(c(0, 0), c(1, 0), c(0, 1))