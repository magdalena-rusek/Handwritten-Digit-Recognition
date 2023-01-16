% funkcja uczy sie� jednowarstwow� na podanym ci�gu ucz�cym
% (P,T) przez zadan� liczb� epok(n)
% * w jednym kroku uczenia funkcja pokazuje sieci jeden
% przyk�ad po czym oblicza poprawki i uaktualnia wagi
% parametry:
% Wbefore - macierz wag przed uczeniem
% P - ci�g ucz�cy - przyk�ady - wej�cia
% T - ci�g ucz�cy - ��dane wyj�cia
% n - liczba epok
% wynik:
% Wafter � macierz wag po uczeniu

function [Wafter,MSE,CE] = train(Wbefore, P, T, n)
  exampleSize = size(P,2); % liczba przykladow
  netOutSize = size(T, 1); # liczba wyjsc sieci
  % UCZENIE SIECI
  W = Wbefore;
  learnCoeff = 0.1; % wspolczynnik uczenia
  MSE=0;
  CE=0;
  for krok = 1:n
    los = randperm(exampleSize); % losuj numer przyk�adu
    exampleNum = los(1);
    X = P(:, exampleNum);
    Y = run(W, X);
    D = T(:, exampleNum) - Y; % oblicz b��dy na wyj�ciach
    X = [-1; X]; % + bias
    dW = learnCoeff * X * D'; % poprawki wag
    W = W + dW; % dodaj poprawki do wag
    MSE = MSE + D'*D; % b��d �redniokwadratowy
    if (any(abs(D)>0.5)) % liczba b��dnych klasyfikacji
      CE = CE + 1;
      %figure(4);
      %title('CE=f(iteracja procesu uczenia)');
      %ylabel('CE - procent b��dnych klasyfikacji');
      %xlabel('iteracja procesu uczenia');
      %plot(krok,CE,'r.');hold on;
    end

    %figure(3);
    %title('MSE=f(iteracja procesu uczenia)');
    %ylabel('MSE - b��d �redniokwadratowy');
    %xlabel('iteracja procesu uczenia');
    %plot(krok,D'*D,'r.');hold on;
  end

  % normalizacja b��d�w
  MSE = 0.5 * MSE/exampleSize/netOutSize;
  CE = CE/exampleSize * 100;
  Wafter = W;
end

% Uczenie sieci polega na wielokrotnym �pokazywaniu� jej
% kolejnych przyk�ad�w z ci�gu ucz�cego. Podczas ka�dego
% takiego pokazu wyznaczana jest odpowied� sieci, po czym
% jest ona por�wnywana z ��dan� odpowiedzi� dla danego przyk�adu,
% zawart� w ci�gu ucz�cym. Na podstawie obliczonej r�nicy,
% czyli b��du pope�nionego przez sie�, ustala si� nast�pnie
% poprawki wszystkich wag sieci, zgodnie z przyj�tym algorytmem
% uczenia. Poprawki te dodaje si� do wag po to, aby w
% nast�pnych krokach, gdy sieci zostanie przedstawiony ten sam
% przyk�ad, jej odpowied� by�a bli�sza ��danej odpowiedzi z
% ci�gu ucz�cego
