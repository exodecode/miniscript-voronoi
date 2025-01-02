globals.Coordinate = {}
Coordinate.x = 0
Coordinate.y = 0
Coordinate.from = function(x, y)
  instance = new Coordinate;
  instance.x = x; instance.y = y;
  return instance;
end function

Coordinate.random = function(width, height)
  x = floor(rnd() * width);
  y = floor(rnd() * height);
  return Coordinate.from(x, y);
end function

Coordinate.distance = function(destinationCoord)
  x = destinationCoord.x - self.x
  y = destinationCoord.y - self.y
  return abs(sqrt(x^2 + y^2))
end function

Coordinate.print = function()
  print "(" + [self.x, self.y].join(",") + ")"
end function
