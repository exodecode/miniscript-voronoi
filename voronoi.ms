import "coordinate"; import "color"; import "tex"
generatePPM = @tex.generatePPM

width = 128; height = 128; cellCount = 8; scale = 8

print "Setup..."

randColors = function(n)
  cols = []
  for a in range(n); cols.push(Color.random); end for;
  return cols
end function

randCoordinates = function(n, width, height)
  coords = []
  for a in range(n)
    coords.push(Coordinate.random(width, height));
  end for
  return coords
end function

coordinates = []
for i in range(0, width * height - 1)
  x = i % width
  y = floor(i / width)
  coordinates.push(Coordinate.from(x, y))
end for

cellColors = randColors(cellCount)
cellCoordinates = randCoordinates(cellCount, width, height)

colors = []
for coord in coordinates
  dist = []
  minIdx = -1
  minDist = -1
  for ccoordIdx in cellCoordinates.indexes
    d = coord.distance(cellCoordinates[ccoordIdx])
    if minIdx < 0 or d < minDist then
      minIdx = ccoordIdx
      minDist = d
    end if
  end for

  col = cellColors[minIdx]
  colors.push(col)
end for

upscaleColors = []
for y in range(0, (height * scale) - 1)
  for x in range(0, (width * scale) - 1)
    upscaleColors.push(colors[floor(y / scale) * width + floor(x / scale)])
  end for
end for

print "Writing Data..."
generatePPM(upscaleColors, width * scale, height * scale)
