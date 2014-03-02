function int_im = integral_image(im)
  int_im = zeros(size(im));
  for i=1:size(im,1)
    for j=1:size(im,2)
      top_val = 0.0;
      if i ~= 1
        top_val = double(int_im(i-1,j));
      end

      left_val = 0.0;
      if j ~= 1
        left_val = double(int_im(i, j-1));
      end
      
      int_im(i,j) = double(im(i,j)) + left_val + top_val;
    end
  end
end
