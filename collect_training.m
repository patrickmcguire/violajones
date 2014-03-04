function [yay, nay] = collect_training()
  faces = slurp_faces();
  [type_ones, type_twos, type_threes, type_fours, type_fives] = viola_features();

  window_size = 24;

  yay_features = [];

  for i=1:window_size:size(faces,2)
    printf('%d\n', i);
    fflush(stdout);
    im = integral_image(faces(:,i:i+window_size-1));
    feat = apply_features(im, type_ones, type_twos, type_threes, type_fours, type_fives);
    yay_features = [yay_features; feat];
  end

  nay_features = [];
  nonface_files = dir('./nonfaces/*589.jpg');
  for i=1:numel(nonface_files)
    printf('%d\n', i);
    fflush(stdout);
    nonface_file=strcat('./nonfaces/',nonface_files(i).name);
    nonface_image = imread(nonface_file);
    if (size(size(nonface_image),2)) == 3 % whether it's in color or black and white
      nonface_image = integral_image(rgb2gray(nonface_image));
    else
      nonface_image = integral_image(nonface_image);
    end
    [y_dim, x_dim] = size(nonface_image);
    for j=1:2
      printf('xdim: %d\n', x_dim);
      printf('ydim: %d\n', y_dim);
      square_size = randi(min(y_dim,x_dim) - 1);
      printf('square_size: %d\n', square_size);
      x0 = randi(x_dim - square_size);
      y0 = randi(y_dim - square_size);
      printf('x0: %d\n', x0);
      printf('y0: %d\n', y0);
      
      subim = nonface_image(y0:y0+square_size,x0:x0+square_size);
      im = imresize(subim, [window_size, window_size]);
      feat = apply_features(im, type_ones, type_twos, type_threes, type_fours, type_fives);
      nay_features = [nay_features; feat];
    end
  end

  yay = yay_features;
  nay = nay_features;
end
