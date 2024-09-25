   mask_half = round(mask_side(i)./2);
    matrix_side = imageSizeX-limit;
    range = [round(mask_side(i)./2), round(matrix_side-mask_half)];

    %matrix initialization
    matrix = ones(matrix_side,matrix_side);
    matrix2 =  ones(matrix_side,matrix_side);
    unnorm_targets = ones(matrix_side,matrix_side);

    %% putting shapes in space
count = 0;
    for kk = 1:number
        r = randi(range(1,:),1,dimension);
        A3 = not(logical(A(:,:,kk))); %formato = 1, vazio = 0
        aux_matrix = matrix(r(1,1)-mask_half+1:r(1,1)+mask_half, r(1,2)-mask_half+1:r(1,2)+mask_half);
        %pega uma posição em matrix

        a = sum(sum(not(A3).*aux_matrix));
        b = sum(sum(aux_matrix)) - sum(sum(A3));
        dif = a-b;

        figure;
        subplot(1,3,1)
        imagesc(aux_matrix)
        subplot(1,3,2)
        imagesc(A3)
        subplot(1,3,3)
        imagesc(not(A3).*aux_matrix)

        if dif == 0
            aux_matrix = matrix(r(1,1)-mask_half+1:r(1,1)+mask_half, r(1,2)-mask_half+1:r(1,2)+mask_half);
            matrix(r(1,1)-mask_half+1:r(1,1)+mask_half, r(1,2)-mask_half+1:r(1,2)+mask_half) = double(aux_matrix).*double(A(:,:,kk));

            disp('Success')

            amplitude %attribute values to the targets
            %see attached file


        elseif dif ~= 0
            i_try = 0;
            while dif ~= 0
                r = randi(range(1,:),1,dimension);
                aux_matrix = matrix(r(1,1)-mask_half+1:r(1,1)+mask_half, r(1,2)-mask_half+1:r(1,2)+mask_half);
                %   dif = sum(sum(A3.*aux_matrix)) - ( sum(sum(aux_matrix)) - sum(sum(not(A3))) );
                a = sum(sum(not(A3).*aux_matrix));
                b = sum(sum(aux_matrix)) - sum(sum(A3));
                dif = a-b;
                i_try = i_try+1;
        
                if dif==0
                aux_matrix = matrix(r(1,1)-mask_half+1:r(1,1)+mask_half, r(1,2)-mask_half+1:r(1,2)+mask_half);
                matrix(r(1,1)-mask_half+1:r(1,1)+mask_half, r(1,2)-mask_half+1:r(1,2)+mask_half) = double(aux_matrix).*double(A(:,:,kk));
                disp('Success after some tries')
                disp(i_try)

                amplitude %attribute values to the targets
                %see attached file

                elseif(i_try == 199)
                disp('Failed, target lost')
                count = count + 1; %numero de alvos perdidos
                    break;
                end
            end


        end
        % figure; imagesc(matrix); colorbar; title('matrix')
        % figure; imagesc(matrix2); colorbar; title('matrix2')


        %pause
        close all
    end