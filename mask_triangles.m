function [A] = mask_triangles(A, number, dimension, mask_side)

for i = 1:number
    sides = 3;
    x_tri = randi([1 mask_side],1,sides*dimension); 
    
    %calculate the area of the random triangle
    area_tri = 0.5.*norm(x_tri(1)* (x_tri(5)-x_tri(6)) + x_tri(2)*(x_tri(6)-x_tri(4)) + x_tri(3)*(x_tri(4)-x_tri(5)));
    %As the points triangle points are random, we don't want triangles with small areas:
   
    %lim = 50; % (12, 20)
    lim = 45; % (10, 18)
    while area_tri < lim
        x_tri = randi([1 mask_side],1,6);
        area_tri = 0.5.*norm(x_tri(1)* (x_tri(5)-x_tri(6)) + x_tri(2)*(x_tri(6)-x_tri(4)) + x_tri(3)*(x_tri(4)-x_tri(5)));
    end
    A2 = poly2mask(x_tri(1,1:3), x_tri(1,4:6), mask_side, mask_side);
    A(:,:,i) = not(A2);
end
