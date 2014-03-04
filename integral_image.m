function int_im = integral_image(im)
  int_im = cumsum(cumsum(im),2);
end
