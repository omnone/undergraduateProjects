function [] = erotima3(A, k)
    %Author: Konstantinos Bourantas, AM: 236145, Date: 18/1/2021
    %A=[0,1,0,1;1,0,1,0;0,1,0,1;1,0,1,0]

    %erotima1================================================
    G = [];

    %Ftiaxnoume enan polidiastato pinaka kai topothetoume stin triti tou diastasi stin thesi k to A^k
    for i = 1:k
        G(:, :, i) = A^i
    end

    %Metatrepoume ton polidiastato pinaka  G se tensor mesw tou MTT
    X = tensor(G)

    %To grafima pou antistoixei ston pinaka A
    % g = graph(A);
    % plot(g)

    %erotima2================================================
    i = 1; j = 1;
    %Athroizoume to plithos twn diadromwn metaksi twn komvwn i->j mikous mexri k
    sum(G(i, j, 1:k))

    %erotima3================================================
    %Kanoume collapse ton tensor X  sto mode 3(tube fibers) mesw tou MTT
    %se auti tin periptosi i sinartisi collapse athroizei ola ta stoixeia pou antistoixoun se kathe tube fiber tou kathe tensor:
    %px. gia komvous (1) kai (2) me k = 3 tote -> X(1,2,1)+X(1,2,2)+X(1,2,3)
    %etsi o telikos pinakas Y exei tis sinolikes diadromes metaksi kathe zeugous i,j gia mikos os k
    Y = collapse(X, 3)
end
