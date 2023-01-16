% funkcja symuluje dzia�anie sieci jednowarstwowej
% parametry:
% W - macierz wag sieci
% X - wektor wej�� do sieci, sygna� podany na wej�cie (sieci)
% wynik:
% Y - wektor wyj�� sieci
function [Y] = run(W, X)
  beta = 1;
  X = [-1; X];
  U = W' * X;
  Y = 1./(1+exp(-beta*U));
end
