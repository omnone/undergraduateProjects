function [y] = spmv_bcrs(y, val, col_idx, row_blk, x)
    %Author: Konstantinos Bourantas, AM: 236145, Date: 16/1/2021

    %Apothikeuoume tis diastaseis tou pinaka val
    [rows, columns] = size(val);

    %O sinolikos arithmos apo mi midenika blocks antistoixei sto plithos twn stoixeiwn
    %tou dianismatos col_idx
    totalBlocks = size(col_idx, 2);
    %Ypologizoume tin diastasi nb kathe block
    nb = columns / totalBlocks;

    %Ypologizoume se posa meri tha spasoume to dianisma x
    %gia paradeigma an nb==2  kai size(x,1)== 1000 tote vecSize== 500
    %Ara thelontas na spasoume to x se dianismata me megethos 2 stoixeia
    vecSize = fix(size(x, 1) / nb)

    %Xorizoume to dianisma x se ipodianismata megethous iso me nb
    %Gia paradeigma an nb==2 kai size(x,1)== 1000 spame to dianisma se 500 ipodianismata
    %mesw tis mat2cell legontas tis oti theloume 500 ipodianismata megethous (2,1)
    x = mat2cell(x, fix(size(x, 1) / vecSize) * ones(1, vecSize), 1);

    blocksPerRowVec = [];

    %Ypologizoume posa blocks exei i kathe seira tou pinaka A
    for i = 1:size(row_blk, 2) - 1
        blocksPerRowVec(i) = row_blk(i + 1) - row_blk(i);
    end

    i = 1; blockPointer = 1;
    blockCounter = 0; row = 1;
    sum = 0;
    sumVec = [];

    %Gia kathe block tou pinaka val
    while blockPointer <= totalBlocks
        %Gia na ipologisoume to y=y+A*x ipologizoume arxika to A*x os eksis:
        %An gia paradeigma:
        % A =
        %   1     2     0     1
        %   3     4     3     4
        %   0     0     5     6
        %   1     0     0     0
        %
        % x = [1;2;3;4]
        %Kai metatrepsoume ton pinaka A se morfi BCRS me blocks 2*2 tote
        %  val =
        %    1     2     0     1     0     0     5     6
        %    3     4     3     4     1     0     0     0
        %
        % Kai ipologizoume to imiathroisma pou antistoixei se kathe grammi apo blocks
        %px. gia tin proti grammi apo blocks exoume
        %[1 2 ;3 4]*[1;2]+[0 1 ;3 4]*[3;4]

        sum = sum + val(1:nb, i:i + nb -1) * x{col_idx(blockPointer)};

        %Auksanoume to i oste na vrethoume sto epomeno block tou pinaka val
        i = i + nb;

        %i metavliti blockPointer apothikeuei se pio block vriskomaste
        blockPointer = blockPointer +1;
        %i metavliti blockCounter apothikeui posa blocks exoume dei gia kathe row
        blockCounter = blockCounter +1;

        %ean ftasame sto teleutaio block enos row pigenoume sto epomeno row
        if blockCounter == blocksPerRowVec(row)
            %auksanoume ton metriti row oste na pame stin epomeni grammi
            row = row +1;
            %Midenizoume ton metriti twn  blocks pou exoume dei gia to sigkekrimeno row
            blockCounter = 0;
            %apothikeuoume to imiathroisma tou proigoumenou row
            sumVec = [sumVec; sum];
            %midenizoume to imiathroisma gia to sigkekrimeno row
            sum = 0;
        end

    end

    %ipologizoume to telika apotelesma
    y = y +sumVec;

end
