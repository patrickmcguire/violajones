function val = apply_type_two(img, vec)
  y0 = vec(1);
  x0 = vec(2);
  height = vec(3);
  width = vec(4);
  y_half = y0 + height / 2;
  x_end = x0 + width;
  y_end = y0 + height;
  val1 = img(y0,x0) - (img(y0,x_end)+img(y_half,x0)) + img(y_half,x_end);
  val2 = img(y_half+1,x0) - (img(y_half+1,x_end)+img(y_end,x0)) + img(y_end,x_end);
  val = val1 - val2;
end
