% funkcja testuje sie� jednowarstwow� na zadanym ci�gu
% (ucz�cym/sprawdzaj�cym/testuj�cym)
% parametry:
% W - macierz wag sieci
% P - ci�g - przyk�ady - wej�cia
% T - ci�g - przyk�ady - ��dane wyj�cia
% wynik:
% Y - macierz odpowiedzi sieci na kolejne przyk�ady z P
% D - macierz b��d�w sieci dla kolejnych przyk�ad�w z P
% MSE - mean square error - b��d �redniokwadratowy sieci
% CE - classification error - procent b��dnych klasyfikacji
% - je�li sie� nie rozwi�zuje zadania klasyfikacji, to mo�na
% to wyj�cie pomin��
% - funkcja zak�ada unipolarn� funkcj� aktywacji, czyli
% ��dane wyj�cia to 0 - 1

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
    Dl = T(:,l) - Yl; % obliczenie b��du na wyj�ciach
    Y(:,l) = Yl; % wpisanie bie��cego wyj�cia sieci do Y
    D(:,l) = Dl; % wpisanie bie��cego b��du sieci do D
    MSE = MSE + Dl'*Dl;
    if (any(abs(Dl)>0.5))
      CE = CE + 1;
    end
  end

  % normalizacja b��d�w
  MSE = 0.5 * MSE/exampleSize/netOutSize
  CE = CE/exampleSize * 100
end
