% reprezentarea grafica a costului total in functie de numarul de clustere
function view_cost_vs_nc(file_points)
  centroids = [];
  cost = zeros(10);
  % citirea matricei de puncte
	points = dlmread(file_points, ' ', 5, 0);
  hold on;
  
  % pentru fiecare element al multimii {1..10} vor rezulta centroizi si apoi 
  % costul total pentru un numar anumit de clustere
  for i=1:10
    centroids = clustering_pc(points, i);
    cost(i) = compute_cost_pc(points, centroids);
  endfor
  
  plot(cost);
  % axa X va avea denumirea : 'Cluster count'
  xlabel('Cluster count');
  % asa Y va avea denumirea : 'Cost' 
  ylabel('Cost');
  
  hold off;
end

