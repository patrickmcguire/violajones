function val = apply_type_five(img, vec)
  y0 = vec(1);
  x0 = vec(2);
  height = vec(3);
  width = vec(4);
  y_half = y0 + height / 2 - 1;
  height_half = height / 2;
  val = apply_type_one(img, [y0; x0; height_half; width]) - apply_type_one(img, [y_half+1; x0; height_half; width]);
end
