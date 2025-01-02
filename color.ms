globals.Color = {}

Color.from = function(r, g, b)
  col = new Color;
  col.r = r; col.g = g; col.b = b;
  return col;
end function

Color.print = function()
  vals = [self.r, self.g, self.b].join(",")
  print "(" + vals + ")"
end function

Color.black = Color.from(0, 0, 0);
Color.white = Color.from(255, 255, 255);
Color.random = function()
  r = floor(rnd() * 254);
  g = floor(rnd() * 254);
  b = floor(rnd() * 254);
  return Color.from(r, g, b);
end function
