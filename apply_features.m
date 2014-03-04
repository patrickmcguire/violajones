function feature_vector = apply_features(integral_image, type_ones, type_twos, type_threes, type_fours, type_fives)
  window_size = 24;
  window_offset = window_size - 1;
  step_size = window_size;
  total_size = size(type_ones,2) + size(type_twos,2) + size(type_threes,2) + size(type_fours,2) + size(type_fives,2);
  feature_vector = [];
  counter = 1;

  for i=1:step_size:size(integral_image,1)-window_offset
    for j=1:step_size:size(integral_image,2)-window_offset
      inner_vec = [];
      img = integral_image(i:i+window_offset,j:j+window_offset);

      for i_one=1:size(type_ones,1)
        vec = type_ones(i_one,:);
        inner_vec(counter) = apply_type_one(img, vec);
        counter = counter + 1;
      end

      for i_two=1:size(type_twos,1)
        vec = type_twos(i_two,:);
        inner_vec(counter) = apply_type_two(img, vec);
        counter = counter + 1;
      end

      for i_three=1:size(type_threes,1)
        vec = type_threes(i_three,:);
        inner_vec(counter) = apply_type_three(img, vec);
        counter = counter + 1;
      end

      for i_four=1:size(type_fours,1)
        vec = type_fours(i_four,:);
        inner_vec(counter) = apply_type_four(img, vec);
        counter = counter + 1;
      end

      for i_five=1:size(type_fives,1)
        vec = type_fives(i_five,:);
        inner_vec(counter) = apply_type_five(img, vec);
        counter = counter + 1;
      end
      feature_vector = [feature_vector; inner_vec];
    end
  end
end
