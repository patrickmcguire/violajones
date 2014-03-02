function apply_type_four(img, vec)
  y0 = vec(1);
  x0 = vec(2);
  height = vec(3);
  width = vec(4);
  
  y_third = y0 + height / 3;
  y_two_third = y0 + (2 * height / 3);
  y_end = y0 + height;
  x_end = x0 + width;

  v1 = img(y0,x0) - (img(y0, x_end) + img(y_third, x0)) + img(y_third, x_end);
  v2 = img(y_third+1,x0) - (img(y_third+1,x_end) + img(y_two_third, x0)) + img(y_two_third,x_end);
  v3 = img(y_two_third+1,x0) - (img(y_end,x0) + img(y_two_third+1,x_end)) + img(y_end,x_end);
  val = v1 - v2 + v3;
end
