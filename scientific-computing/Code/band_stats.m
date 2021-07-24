function P = band_stats(mxid, p)
    %Author: Konstantinos Bourantas, AM: 236145, Date: 22/1/2021
    [rows, columns] = size(mxid);

    rnnz = []; k = []; P = []; relErrors = [];

    if isstring(mxid)
        mxid = convertStringsToChars(mxid);
    end

    if isa(mxid, 'char')%An to mxid einai tupou string
        %Dokimazoume na vroume to mitroo me onoma to string pou periexei to mxid mesw tis ssget
        try
            A = ssget(mxid).A;
        catch %An to mitrwo me to sigkekrimeno onoma den vrethike emfanizoume sfalma
            error('Matrix "%s" not found.', mxid)

        end

    else
        %An to mxid exei arithmo grammwn kai stilwn megalitero apo 1 tote simainei einai ena mitrwo
        if or((rows > 1), (columns > 1))
            A = mxid;
        elseif isa(mxid, 'double')% An to mxid einai arithmos psaxnoume na vroume to mitrwo pou antistixei to sigkekrimeno id mesw tis ssget

            try
                A = ssget(mxid).A;
            catch %An to mitrwo me to sigkekrimeno onoma den vrethike emfanizoume sfalma
                error('Matrix "%d" not found.', mxid)
            end

        end

    end

    %Ean se auto to simeio prokipsei sfalma simenei oti to mitrwo A den arxikopoihthike sosta
    try
        [rows, columns] = size(A);
    catch
        error('Failed to load matrix A.')
    end

    %p = rows;

    %O arithmos twn mi midenikwn stoixeiwn tou A
    nnz_A = nnz(A);

    % Apothikeuoume oles tis diagonious tou mitrwou A os stiles ston pinaka diags
    % xrisimopoiontas tin sinartisi spdiags. I sinartisi spdiags epistrefei kai ena index gia kathe
    % diagonio kai to apothikeuei sto mitrwo diagsIndex gia paradeigma:
    %
    %A =
    %
    % 1     0     0     0
    % 1     1     0     0
    % 1     1     1     0
    % 1     1     1     1
    %diags =
    %
    % 1     1     1     1
    % 0     1     1     1
    % 0     0     1     1
    % 0     0     0     1
    %
    %Oi diagonioi pou vriskontai katw apo tin kiria diagonio exoun arnitika indexes
    %enw oi diagonioi panw apo tin kiria diagonio thetika. Episis i kiria diagonios exei index 0.
    % diagsIndex =
    %-3
    %-2
    %-1
    % 0
    %
    % Me auton ton tropo mporoume na gnorizoume pou vrisketai i kathe diagonios ston pinaka A p.x
    % I proti stili tou pinaka diags antistoixei to index -3 pou simenei oti einai i pio xamili ipodiagonios tou pinaka A
    [diags, diagsIndex] = spdiags(A);

    %Apothikeuoume tin diagonio tou pinaka A
    mainDiag = diag(A);

    %Arxikopoioume ena pinaka B me midenika kai idies diastaseis me ton pinaka A
    B = zeros(rows, columns);
    mainDiagIndex = -1;

    %O arithmos twn ipodiagwniwn
    downDiagsNum = 0;
    %O arithmos twn iperdiagoniwn
    upDiagsNum = 0;
    %downDiagIndex:To index tis protis ipodiagoniou ston pinaka diags
    downDiagIndexConst = -1;
    %upDiagIndex: To index tis protis iperdiagoniou ston pinaka diags
    upDiagIndexConst = -1;

    %Diatrexoume oles tis diagonious pou vriskontai os stiles ston pinaka diags
    for i = 1:size(diags, 2)

        % Ean to index isoutai me miden einai i kiria diagonios
        if diagsIndex(i) == 0
            mainDiagIndex = i;

        elseif diagsIndex(i) < 0% An index < 0 exoume ipodiagonio
            %Apothikeuoume to teleutaio arnitiko index pou simatodotei tin thesi tis protis
            %ipodiagoniou ston pinaka diagsIndex kai sinepws ston pinaka diags
            downDiagsNum = downDiagsNum + 1;
            downDiagIndexConst = i;

        else %An  index > 0 exoume iperdiagonio
            upDiagsNum = upDiagsNum +1;
            %Apothikeuoume to proto thetiko index pou simatodotei tin thesi tis protis
            %iperdiagoniou ston pinaka diagsIndex kai sinepws ston pinaka diags
            if (upDiagIndexConst == -1)
                upDiagIndexConst = i;
            end

        end

    end

    %Ftiaxnoume ena mitrwo bandMatrix to opio periexei mono stin kiria diagonio tou A
    bandMatrix = spdiags(mainDiag, 0, B);

    bandWidth = 0; dimCheck = 0;

    while bandWidth < 2 * p + 1
        k = [k bandWidth];
        dimCheck = dimCheck +1;

        %Se periptosi pou to P ksepernaei tis diastaseis tou A
        %epistrefoume ton pinaka bandMatrix me oles tis dinates diagonious
        if dimCheck <= size(bandMatrix, 2)
            diagsNum = fix(bandWidth / 2);
        end

        if bandWidth == 0
            bandWidth = 1;
        end

        upIndex = 1;
        upDiagIndex = upDiagIndexConst;

        %An exoume iperdiagonious
        if upDiagsNum > 0

            %Dietrekse oles tis iperdiagonious me vasi to zitoumeno bandwidth
            for i = 1:diagsNum

                %Vriskoume tin sigkekrimeni diagonio
                tempDiag = diags(1:rows, upDiagIndex);

                %Ean i diagonios periexei mi midenika stoixeia
                if nnz(tempDiag) > 0
                    %Apothikeuoume tin diagonio tempDiag sti thesi pou antistoixei sto index poy deixnei i metavliti
                    %upIndex kai tin apothikeuoume sto bandMatrix
                    bandMatrix = spdiags(tempDiag, upIndex, bandMatrix);
                end

                %Pigenoume stin amesws epomeni iperdiagonio
                upIndex = upIndex +1;
                upDiagIndex = upDiagIndex + 1;

                if (upDiagIndex > size(diags, 2))
                    break
                end

            end

        end

        downIndex = -1;
        downDiagIndex = downDiagIndexConst;

        %An exoume ipodiagonious
        if downDiagsNum > 0

            for i = 1:diagsNum
                %Vriskoume tin sigkekrimeni diagonio
                tempDiag = diags(1:rows, downDiagIndex);

                %Ean i diagonios periexei mi midenika stoixeia
                if nnz(tempDiag) > 0
                    %Apothikeuoume tin diagonio tempDiag sti thesi pou antistoixei sto index poy deixnei i metavliti
                    %downIndex kai tin apothikeuoume sto bandMatrix
                    bandMatrix = spdiags(tempDiag, downIndex, bandMatrix);
                end

                %Pigenoume stin amesws epomeni ipodiagonio
                downIndex = downIndex - 1;
                downDiagIndex = downDiagIndex - 1;

                if (downDiagIndex < 1)
                    break
                end

            end

        end

        %full(bandMatrix)

        %To plithos twn mi midenikwn stoixeiwn tou bandMatrix
        % se sxesi me to mitrwou A.
        rnnz = [rnnz; nnz(bandMatrix) / nnz_A];
        % To sxetika sfalma os pros tin norma Frobenius
        relErrors = [relErrors; norm(A - bandMatrix, 'fro') / norm(A, 'fro')];

        bandWidth = bandWidth + 2;
    end

    P = [rnnz relErrors];

end
