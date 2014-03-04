function cascade(features, labels, f, d, f_target)
  P = features(find(labels==1),:);
  N = features(find(labels==0),:);
  F_i = 1.0;
  D_i =- 1.0;
  i = 0;
  while F_i > F_target
    i = i + 1;
    n_i = 0;
    F_prev = F_i;

    [w_pos, w_neg, thetas, ps, errs] = adaboost(features, labels);
    sorted_errs = sort(errs);
    while F_i > f * F_prev
      n_i = n_i + 1;
      errs_to_use = sorted_errs(i:n_i);
      err_indices = find(errs==errs_to_use);
      pos_pos_predictions = p * w_pos(err_indices) * P(:,err_indices) > theta(err_indices);
      pos_neg_predictions = p * w_pos(err_indices) * P(:,err_indices) < theta(err_indices);
      neg_neg_predictions = p * w_neg(err_indices) * N(:,err_indices) > theta(err_indices);
      neg_pos_predidctions = p * w_neg(err_indices) * N(:,err_indices) < theta(err_indices);
      
      size(neg

      pos_neg_precitions = p * w_pos(err_indices) * features(i) > theta(err_indices);
      

      
    end
  end
end
