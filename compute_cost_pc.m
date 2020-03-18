% suma costurilor tuturor clustelor
function cost = compute_cost_pc(points, centroids)
	cost = 0;
  % retinem in nrCentroids numarul de centroizi, respectiv in nrPoints - numarul
  % de puncte
  [nrCentroids, c] = size(centroids);
  [nrPoints, c] = size(points);
  
  % pentru fiecare punct calculam distanta minima fata de centroizi
  for i=1:nrPoints
    distMin = realmax;
    % pentru fiecare centroid calculam distanta, iar daca este mai mica decat 
    % distanta minima, distMin devine distanta actuala
    for j=1:nrCentroids
      dist = norm(points(i,:) - centroids(j,:), 2);
      if(dist < distMin)
        distMin = dist;
      end
    end
    
    % costul este suma distantelor de la centroid la fiecare din punctele ce 
    % apartin clusterului respectiv
    cost = cost + distMin;
end

