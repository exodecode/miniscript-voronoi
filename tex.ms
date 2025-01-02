generatePPM = function(colors, width, height)
  filename = "voronoi";

  f = file.open(filename + ".ppm", "a")
  header = ["P3",[width, height].join(" "), "255"].join(char(10)) + char(10)
  f.write header

  for y in range(0, height - 1)
    for x in range(0, width - 1)
      idx = y * width + x
      col = colors[idx]
      f.write [col.r, col.g, col.b].join(" ") + " "
    end for
    f.write char(10)
  end for

  f.close

  print "Magick Conversion"
  c = ["convert", filename + ".ppm", filename + ".png"].join(" ")
  out = exec(c).output
end function
