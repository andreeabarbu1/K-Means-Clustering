% citeste numarul de clustere si punctele din fisierele de intrare
function [NC points] = read_input_data(file_params, file_points)
	
  NC = 0;
  points = [];
  % retine in NC numarul de clustere
	NC = load(file_params);
  % retine in matricea points valorile punctelor, citire se face incepand cu 
  % linia 6 a fisierului cu file_points  
	points = dlmread(file_points, ' ', 5, 0);

end

