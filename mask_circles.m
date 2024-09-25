function [A] = mask_circles(A, number, ~, mask_side)
% Based on https://matlab.fandom.com/wiki/FAQ#How_do_I_create_a_circle.3F

radius = [round(mask_side./4),  round(mask_side./2)]; %Should be smaller than mask_side./2
center = round(mask_side./2);

for i = 1:number
    randrad = randi(radius,1);
    [columnsInImage, rowsInImage] = meshgrid(1:mask_side, 1:mask_side);

    %Calculating circle points
    circlePixels = (rowsInImage - center).^2 + (columnsInImage - center).^2 <= randrad.^2;

    %Converting from logical to double and displaying
    A(:,:,i) = double(circlePixels);
end
A = not(logical(A));