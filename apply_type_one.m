function val = apply_type_one(img, vec)
  y0 = vec(1);
  x0 = vec(2);
  height = vec(3);
  width = vec(4);
  x_half = x0 + width / 2;
  x_end = x0 + width;
  y_end = y0 + height;
  val1 = img(y0,x0) - (img(y0,x_half)+img(y_end,x0)) + img(y_end,x_half);
  val2 = img(y0,x_half+1) - (img(y0,x_end)+img(y_end,x_half+1)) + img(y_end,x_end);
  val = val1 - val2;
end
