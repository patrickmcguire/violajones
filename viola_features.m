function [type_ones, type_twos, type_threes, type_fours, type_fives] = viola_features()
  type_ones = [];
  type_twos = [];
  type_threes = [];
  type_fours = [];
  type_fives = [];

  window_size = 24;
  % base window of size 24
  for i=1:window_size
    for j=1:window_size
      for height=0:window_size-i
        for width=0:window_size-j
          if 0 ~= height && 0 ~= width
            % first do type 1
            if mod(width,2) == 0
              type_ones = [type_ones [i; j; height; width]];
            end

            if mod(height,2) == 0
              type_twos = [type_twos [i; j; height; width]];
            end

            if mod(width,3) == 0
              type_threes = [type_threes [i; j; height; width]];
            end

            if mod(height,3) == 0
              type_fours = [type_fours [i; j; height; width]];
            end
  
            if ((mod(width,2)) == 0 && (mod(height,2) == 0))
              type_fives = [type_fives [i; j; height; width]];
            end
          end
        end
      end
    end
  end
end
