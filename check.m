% funkcja testuje sieæ jednowarstwow¹ na zadanym ci¹gu
% (ucz¹cym/sprawdzaj¹cym/testuj¹cym)
% parametry:
% W - macierz wag sieci
% P - ci¹g - przyk³ady - wejœcia
% T - ci¹g - przyk³ady - ¿¹dane wyjœcia
% wynik:
% Y - macierz odpowiedzi sieci na kolejne przyk³ady z P
% D - macierz b³êdów sieci dla kolejnych przyk³adów z P
% MSE - mean square error - b³¹d œredniokwadratowy sieci
% CE - classification error - procent b³êdnych klasyfikacji
% - jeœli sieæ nie rozwi¹zuje zadania klasyfikacji, to mo¿na
% to wyjœcie pomin¹æ
% - funkcja zak³ada unipolarn¹ funkcjê aktywacji, czyli
% ¿¹dane wyjœcia to 0 - 1

function [Y, D, MSE, CE] = check(W, P, T)
  exampleSize = size(P, 2); % liczba przykladow
  netOutSize = size(T, 1); # liczba wyjsc sieci

  Y = zeros(netOutSize, exampleSize);
  D = zeros( netOutSize, exampleSize);
  MSE = 0;
  CE = 0;
  for l = 1:exampleSize
    Xl = P(:,l);
    Yl = run(W, Xl);
    Dl = T(:,l) - Yl; % obliczenie b³êdu na wyjœciach
    Y(:,l) = Yl; % wpisanie bie¿¹cego wyjœcia sieci do Y
    D(:,l) = Dl; % wpisanie bie¿¹cego b³êdu sieci do D
    MSE = MSE + Dl'*Dl;
    if (any(abs(Dl)>0.5))
      CE = CE + 1;
    end
  end

  % normalizacja b³êdów
  MSE = 0.5 * MSE/exampleSize/netOutSize
  CE = CE/exampleSize * 100
end
