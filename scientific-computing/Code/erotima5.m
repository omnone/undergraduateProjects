%Author: Konstantinos Bourantas, AM: 236145, Date: 21/2/2021
%erotima 5.1------------------------------------------------------------------------------------
n = 500;
tol = 1e-6;

%Ektelesi tou protou peiramatos 5.1.1
A = spdiags([1:n]', [0], n, n);
xsol = ones(n, 1);
b = A * xsol;

[x, fl1, rr1, it1, rv1] = pcg(A, b, tol, 4 * n);

%Ektelesi tou deuterou peiramatos 5.1.2
A = spdiags([linspace(1, 2, n / 2)'; linspace(1000, 1001, n / 2)'], [0], n, n);
xsol = ones(n, 1);
b = A * xsol;

[x, fl2, rr2, it2, rv2] = pcg(A, b, tol, 4 * n);

%Ftiaxnoume tin grafiki anaparastasi twn dio peiramatwn simfwna me tin ekfonisi
semilogy(0:length(rv0) - 1, rv0 / norm(b), 'b-o'); hold on;
semilogy(0:length(rv2) - 1, rv2 / norm(b), 'r-x'); hold on;

yline(tol, 'r--');
legend('peirama1', 'peirama2')
xlabel('Iteration number')
ylabel('Relative residual')
