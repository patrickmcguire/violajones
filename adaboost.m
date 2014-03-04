function [w, thetas, ps, errs] = adaboost(features, labels)
  num_pos = size(find(labels==1))(1);
  num_neg = size(find(labels==0))(1);

  pos_features = features(find(labels==1),:);
  neg_features = features(find(labels==0),:);

  maxes = max(features);
  mins = min(features);

  w_pos = ones(size(features,2), 1) / num_neg;
  w_neg = ones(size(features,2), 1) / num_pos;

  num_iter=2;
  for t=1:num_iter
    printf('t = %d\n', t);
    fflush(stdout); % stop pretending to print
    w_pos = w_pos / (sum(w_pos) + sum(w_neg));
    w_neg = w_neg / (sum(w_pos) + sum(w_neg));
    thetas = zeros(size(features,2),1);
    ps = zeros(size(features,2),1);
    errs = zeros(size(features,2),1);
    for i=1:size(features,2)
      % pos
      printf('i = %d\n', i);
      fflush(stdout); % stop pretending to print
      pos_min_func = @(theta) abs(((w_pos(i) * pos_features(i) > theta) - 1) + (w_neg(i) < theta));
      % neg
      neg_min_func = @(theta) abs(((-w_pos(i) * neg_features(i) > theta) - 1) + (-w_neg(i) < theta));
      pos_theta_val = fminbnd(pos_min_func,mins(i),maxes(i));
      neg_theta_val = fminbnd(neg_min_func,mins(i),maxes(i));

      theta = 0;
      err = 0;
      if pos_min_func(pos_theta_val) < neg_min_func(neg_theta_val)
        theta = pos_theta_val;
        p = 1;
        err = pos_min_func(pos_theta_val);
      else
        theta = neg_theta_val;
        p = -1;
        err = neg_min_func(neg_theta_val);
      end
      thetas(i) = theta;
      ps(i) = p;
      errs(i) = err;
    end

    err_t = min(errs);
    best_weak = find(errs==err_t)(1);
    theta = thetas(best_weak);
    p = ps(best_weak);

    printf('err_t = %d\n', err_t);
    printf('best_weak = %d\n', best_weak);
    printf('theta = %d\n', theta);
    printf('p = %d\n', p);
    fflush(stdout); % stop pretending to print

    b_t = (err_t) / (1 - err_t);
    pos_pred = pos_features * p > theta;
    neg_pred = neg_features * p > theta;
    
    pos_right_wrong = (pos_pred == 1);
    neg_right_wrong = (neg_pred == 0);

    w_pos_wrong = find(pos_right_wrong==0);
    w_pos(w_pos_wrong) = w_pos(w_pos_wrong) * b_t;

    w_neg_wrong = find(pos_right_wrong==0);
    w_neg(w_neg_wrong) = w_neg(w_neg_wrong) * b_t;
  end
end
