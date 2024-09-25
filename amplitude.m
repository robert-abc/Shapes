            A4 = double(A(:,:,kk));
          aux_matrix2 = matrix2(r(1,1)-mask_half+1:r(1,1)+mask_half, r(1,2)-mask_half+1:r(1,2)+mask_half);
          
          r2 = randi([1,2],1,1); %1 for positive values and 2 for negative values
  
            if r2 == 1
                draw_amplitude = randi([-max_target_val -min_target_val]);
                A4(A4==0) =  draw_amplitude;
                %  A4 = A4;
            elseif r2==2
                draw_amplitude = randi([min_target_val max_target_val]);
                A4(A4==0) =  draw_amplitude;
            end

            %pega um trecho de matrix2

            figure
            subplot(1,3,1)
            imagesc(double(aux_matrix))
            colorbar
            title('aux_matrix')
              axis square
            subplot(1,3,2)
            imagesc(A4)
            colorbar
            title('A4')
              axis square
            subplot(1,3,3)
            imagesc(double(aux_matrix).*A4)
            colorbar
            title('double(aux_matrix).*A4')
              axis square
       
              matrix2(r(1,1)-mask_half+1:r(1,1)+mask_half, r(1,2)-mask_half+1:r(1,2)+mask_half) = aux_matrix2.*A4;


