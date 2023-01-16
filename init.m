% funkcja tworzy sieæ jednowarstwow¹ i wype³nia jej macierze
% wag wartoœciami losowymi z zakresu od -0.1 do 0.1
% parametry:
% S - liczba wejœæ do sieci (wejœæ warstwy 1)
% K - liczba neuronów w warstwie
% wynik:
% W - macierz wag sieci

function [W] = init(S, K)
  W = rand(S+1, K)*0.2 - 0.1;
end
