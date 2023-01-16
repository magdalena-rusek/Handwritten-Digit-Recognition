% funkcja uczy sieæ jednowarstwow¹ na podanym ci¹gu ucz¹cym
% (P,T) przez zadan¹ liczbê epok(n)
% * w jednym kroku uczenia funkcja pokazuje sieci jeden
% przyk³ad po czym oblicza poprawki i uaktualnia wagi
% parametry:
% Wbefore - macierz wag przed uczeniem
% P - ci¹g ucz¹cy - przyk³ady - wejœcia
% T - ci¹g ucz¹cy - ¿¹dane wyjœcia
% n - liczba epok
% wynik:
% Wafter – macierz wag po uczeniu

function [Wafter,MSE,CE] = train(Wbefore, P, T, n)
  exampleSize = size(P,2); % liczba przykladow
  netOutSize = size(T, 1); # liczba wyjsc sieci
  % UCZENIE SIECI
  W = Wbefore;
  learnCoeff = 0.1; % wspolczynnik uczenia
  MSE=0;
  CE=0;
  for krok = 1:n
    los = randperm(exampleSize); % losuj numer przyk³adu
    exampleNum = los(1);
    X = P(:, exampleNum);
    Y = run(W, X);
    D = T(:, exampleNum) - Y; % oblicz b³êdy na wyjœciach
    X = [-1; X]; % + bias
    dW = learnCoeff * X * D'; % poprawki wag
    W = W + dW; % dodaj poprawki do wag
    MSE = MSE + D'*D; % b³¹d œredniokwadratowy
    if (any(abs(D)>0.5)) % liczba b³êdnych klasyfikacji
      CE = CE + 1;
      %figure(4);
      %title('CE=f(iteracja procesu uczenia)');
      %ylabel('CE - procent b³êdnych klasyfikacji');
      %xlabel('iteracja procesu uczenia');
      %plot(krok,CE,'r.');hold on;
    end

    %figure(3);
    %title('MSE=f(iteracja procesu uczenia)');
    %ylabel('MSE - b³¹d œredniokwadratowy');
    %xlabel('iteracja procesu uczenia');
    %plot(krok,D'*D,'r.');hold on;
  end

  % normalizacja b³êdów
  MSE = 0.5 * MSE/exampleSize/netOutSize;
  CE = CE/exampleSize * 100;
  Wafter = W;
end

% Uczenie sieci polega na wielokrotnym „pokazywaniu” jej
% kolejnych przyk³adów z ci¹gu ucz¹cego. Podczas ka¿dego
% takiego pokazu wyznaczana jest odpowiedŸ sieci, po czym
% jest ona porównywana z ¿¹dan¹ odpowiedzi¹ dla danego przyk³adu,
% zawart¹ w ci¹gu ucz¹cym. Na podstawie obliczonej ró¿nicy,
% czyli b³êdu pope³nionego przez sieæ, ustala siê nastêpnie
% poprawki wszystkich wag sieci, zgodnie z przyjêtym algorytmem
% uczenia. Poprawki te dodaje siê do wag po to, aby w
% nastêpnych krokach, gdy sieci zostanie przedstawiony ten sam
% przyk³ad, jej odpowiedŸ by³a bli¿sza ¿¹danej odpowiedzi z
% ci¹gu ucz¹cego
