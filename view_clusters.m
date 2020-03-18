% reprezentarea grafica a rezultatului algoritmului K-Means
function view_clusters(points, centroids)
  
  %nrCentroids - numarul de centroizi
  [nrCentroids, c] = size(centroids);
  
  % generam o matrice nrCentroids x nrCentroids cu 1 pe diagonala
  for i=1:nrCentroids
      cmap(i,i) = 1;
    endfor
  
  % nrPoints - numarul de puncte
  [nrPoints, c] = size(points);
  view(3);
  hold on;
    
  % verificam pentru fiecare punct carui grup ii apartine si ii retinem idexul
  % in index, pentru a stabili apoi cu ce culoare trebuie reprezentat
  for i=1:nrPoints
    distMin = realmax;
    index = 0;
    for j=1:nrCentroids
      dist = norm(points(i,:) - centroids(j,:), 2);
      if(dist < distMin)
        distMin = dist;
        index = j;
      endif
    endfor
    % reprezentam grafic fiecare punct cu culoarea corespunzatoare grupului
    % caruia ii apartine
    scatter3(points(i, 1), points(i, 2), points(i, 3), [], cmap(index, :), "fill");
  endfor
  hold off;
end

