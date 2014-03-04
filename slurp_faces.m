function [faces] = slurp_faces()
  face_files = dir('./faces/*09.jpg');

  faces = [];

  for i=1:numel(face_files)
    try 
      % just so i know where we are
      filename = strcat('./faces/',face_files(i).name);
      im = imread(filename);
      try
        im = rgb2gray(im);
      catch
        % already in bw
        im = im;
      end
      im = imresize(im, [24, 24]);
      faces = [faces im];
    catch
      face_files(i).name
    end
  end
end
