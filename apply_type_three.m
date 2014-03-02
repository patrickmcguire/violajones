function apply_type_three(img, vec)
  y0 = vec(1);
  x0 = vec(2);
  height = vec(3);
  width = vec(4);
  y_end = y0 + height;
  
  x_third = x0 + width / 3;
  x_two_third = x0 + (2 * width / 3);
  x_end = x0 + width;

  v1 = img(y0,x0) - (img(y0,x_third) + img(y_end,x0)) + img(y_end,x_third);
  v2 = img(y0,x_third+1) - (img(y0,x_two_third) + img(y_end, x_third+1)) + img(y_end,x_two_third);
  v3 = img(y0,x_two_third+1) - (img(y0,x_end) + img(y_end,x_two_third+1)) + img(y_end,x_end);
  val = v1 - v2 + v3;
end
