% formeaza cei NC centroizi corespunzatori punctelor date, folosing K-Means
function centroids = clustering_pc(points, NC)
	centroids = [];
  %initializeaza random centroizi 
  centroidsRow = randperm(size(points)(1));
  centroids = points(centroidsRow(1:NC), :);
  
  %in numRows se retine numarul randurilor matricei points
  numRows = length(points(:,1));
  %in numCol se retine numarul coloanelor matricei points
  numCol = length(points(1,:));
  assig = ones(1, numRows);
  
  %numarul maxim de iteratii
  iter = 200;
  
  %repet algoritmul pentru un numar maxim de iteratii
  for i = 1:iter
    clusterTotals = zeros(NC, numCol);
    clusterSize = zeros(NC, 1);
    % pentru fiecare punct caut cel mai apropiat centroid, assigTo va indica 
    % poztia centroidului corespunzator
    for j = 1:numRows
      minDist = realmax;
      assigTo = 0;
      for k = 1:NC
        % este folosita distanta Euclidiana
        dist = sqrt(sum((points(j, :) - centroids(k, :)) .^2));
        if dist < minDist
          minDist = dist;
          assigTo = k;
        endif
      endfor
      assig(j) = assigTo;
      clusterTotals(assigTo, :) += points(j, :);
      clusterSize(assigTo)++;
    endfor

    newCentroids = zeros(NC, numCol);
    for j = 1:NC
      newCentroids(j, :) = clusterTotals(j, :) / clusterSize(j);
    endfor
    
    diff = sum(sum(abs(newCentroids - centroids)));
    % Centrele sunt aceleasi, ceea ce inseamna ca am facut convergenta inainte
    % de numarul maxim de iteratii
    if diff < eps
      break;
    endif
    centroids = newCentroids;
  endfor
  assig = assig';
  
end
