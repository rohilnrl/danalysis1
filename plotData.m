function plotData(X, y, i1, i2)
  
  figure; hold on;
  
  % Find indices of positive and negative examples
  pos = find(y == 1);
  neg = find(y == 0);
  
  % Plot examples
  plot(X(pos, i1), X(pos, i2), 'k+','LineWidth', 2, 'MarkerSize', 7);
  plot(X(neg, i1), X(neg, i2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
  
  %==================================%
  
  hold off;
end