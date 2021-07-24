function [val, col_idx, row_blk] = sp_mx2bcrs(A, nb)
    %Author: Konstantinos Bourantas, AM: 236145, Date: 14/1/2021

    %Apothikeuoume tis diastaseis tou A
    [rows, columns] = size(A);

    %Elegxoume an to mitrwo A einai tetragoniko
    if rows ~= columns
        error("[-]Error: Input matrix A must be a square matrix.")
    end

    %Vriskoume mexri posa blocks mporoun na iparxoun se kathe grammi tou A
    maxBlocksPerRow = rows / nb;

    %Thetoume tis diastaseis twn blocks pou theloume na xorisoume to mitrwo A
    xblockDim = nb * ones(1, maxBlocksPerRow); %poses grammes theloume na exei to kathe ipomitrwo
    yblockDim = nb * ones(1, maxBlocksPerRow); %poses stiles theloume na exei to kathe ipomitrwo

    %I sinartisi mat2cell leitourgei os eksis:
    %Estw A kai xblockDim == [2 2 2 2] kai yblockDim==[2 2 2 2]
    %paragontai 4 ipomitrwa me megethos (2,2)

    %Apothikeuoume ta blocks pou prokiptoun apo to mitrwo A
    blocksMatrix = mat2cell(A, xblockDim, yblockDim);

    val = []; col_idx = []; row_blk = [];
    blockIdx = 1;
    %Apothikeuoume posa blocks antistoixoun se kathe grammi
    blocksPerRow = zeros(maxBlocksPerRow, 1);

    %Diatrexoume ola ta blocks tou A pou vriskontai sto mitrwo blocksMatrix
    for i = 1:size(blocksMatrix, 1)

        for j = 1:size(blocksMatrix, 2)

            %Ean to block periexei mi midenika stoixeia to apothikeuoume sti metavliti val
            if (nnz(blocksMatrix{i, j}) > 0)
                %Topothetoume to kathe block parallila me to allo (row wise)
                val = [val blocksMatrix{i, j}];

                %Apothikeuoume ti stili block pou vrisketai to sigkekrimeno block sto mitrwo A
                col_idx(blockIdx) = j;
                blockIdx = blockIdx + 1;

                blocksPerRow(i) = blocksPerRow(i) + 1;
            end

        end

    end

    %To proto block tis protis grammis ipoxrewtika vrisketai stin proti thesi
    %tou mitroou A
    row_blk(1) = 1;

    %Vriskoume se pio index vrisketai to proto block twn ipoloipwn grammwn sto mitrwo A
    for i = 2:size(blocksPerRow, 1) + 1
        row_blk(i) = row_blk(i - 1) + blocksPerRow(i - 1);
    end

end
