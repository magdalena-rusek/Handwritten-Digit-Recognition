% funkcja symuluje dzia³anie sieci jednowarstwowej
% parametry:
% W - macierz wag sieci
% X - wektor wejœæ do sieci, sygna³ podany na wejœcie (sieci)
% wynik:
% Y - wektor wyjœæ sieci
function [Y] = run(W, X)
  beta = 1;
  X = [-1; X];
  U = W' * X;
  Y = 1./(1+exp(-beta*U));
end
