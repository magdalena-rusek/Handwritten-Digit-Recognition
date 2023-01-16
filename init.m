% funkcja tworzy sie� jednowarstwow� i wype�nia jej macierze
% wag warto�ciami losowymi z zakresu od -0.1 do 0.1
% parametry:
% S - liczba wej�� do sieci (wej�� warstwy 1)
% K - liczba neuron�w w warstwie
% wynik:
% W - macierz wag sieci

function [W] = init(S, K)
  W = rand(S+1, K)*0.2 - 0.1;
end
