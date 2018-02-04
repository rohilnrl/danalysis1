function checkPrediction(theta, X)
  
  hypothesis = sigmoid(X * theta);
  
  if hypothesis >= 0.5
    fprintf('Attack\n')
  else
    fprintf('Normal\n')
  end
end
  