function feature_vector = apply_features(integral_image, type_ones, type_twos, type_threes, type_fours, type_fives)
  window_size = 24;
  feature_vector = [];

  for i=1:size(integral_image,1)-window_size
    for j=1:size(integral_image,2)-window_size
      inner_vec = [];
      for i_one=1:size(type_ones,2)
        vec = type_ones(:,i_one);
        inner_vec = [inner_vec apply_type_one(integral_image(i:i+23,j:j+23), vec)];
      end

      for i_two=1:size(type_twos,2)
        vec = type_twos(:,i_two);
        inner_vec = [inner_vec apply_type_two(integral_image(i:i+23,j:j+23), vec)];
      end

      for i_three=1:size(type_threes,2)
        vec = type_threes(:,i_three);
        inner_vec = [inner_vec apply_type_three(integral_image(i:i+23,j:j+23), vec)];
      end

      for i_four=1:size(type_fours,2)
        vec = type_fours(:,i_four);
        inner_vec = [inner_vec apply_type_four(integral_image(i:i+23,j:j+23), vec)];
      end

      for i_five=1:size(type_fives,2)
        vec = type_fives(:,i_five);
        inner_vec = [inner_vec apply_type_five(integral_image(i:i+23,j:j+23), vec)];
      end
      feature_vector = [feature_vector; inner_vec];
    end
  end

end
