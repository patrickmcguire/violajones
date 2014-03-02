function [faces, nonfaces] = slurp_images()
  face_files = dir('./faces/*')(3:end);
  nonface_files = dir('./nonface/*.png');

  faces = [];
  nonfaces = [];

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
      im = imresize(im, [128, 128]);
      faces = [faces im];
    catch
      face_files(i).name
    end
  end

  for i=1:numel(nonface_files)
    nonface_file=strcat('./nonfaces/',nonface_files(i).name);
    nonfaces = [nonfaces imread(nonfaces)];
  end
end
