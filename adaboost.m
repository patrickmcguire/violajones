function a = adaboost(images, labels)
  m = size(find(labels==0));
  l = size(find(labels==1));
  weights = ones(m+l) * [1 / (2*m); 1/(2*l)];
end
