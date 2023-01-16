clc; clear; close all;

images = loadMNISTImages('train-images-idx3-ubyte');
labels = loadMNISTLabels('train-labels-idx1-ubyte');

r1=randperm(60000); % losujemy nr przykladu
P=images(:,r1(1)); % macierz wylosowanego przykladu
Tlabels=labels(r1(1)) %etykieta wylosowanego przykladu

%wyswietl wylosowany przyklad:
s = reshape(images(:,r1(1)), 28,28);
imshow(s);
%l=im2bw(s,0.4); imshow(l);

T=replace(Tlabels,1); %zamiana etykiety(cyfry) na macierz
T=T';

disp('Siec przed uczeniem:')
Wbefore = init(784, 10);
Ybefore = run(Wbefore, P)
disp('Rozpoznana cyfra przed uczeniem to:')
[w,k]=max(Ybefore);
if k==1
  disp('0')
elseif k==2
  disp('1')
elseif k==3
  disp('2')
elseif k==4
  disp('3')
elseif k==5
  disp('4')
elseif k==6
  disp('5')
elseif k==7
  disp('6')
elseif k==8
  disp('7')
elseif k==9
  disp('8')
elseif k==10
  disp('9')
end

disp('Naciœnij ENTER by uczyæ..')
pause()
disp('Uczy..')
Wafter = train(Wbefore, P, T, 25);

disp('Siec po uczeniu:')
Yafter = run(Wafter, P)
disp('Rozpoznana cyfra po uczeniu to:')

[w,k]=max(Yafter);
if k==1
  disp('0')
elseif k==2
  disp('1')
elseif k==3
  disp('2')
elseif k==4
  disp('3')
elseif k==5
  disp('4')
elseif k==6
  disp('5')
elseif k==7
  disp('6')
elseif k==8
  disp('7')
elseif k==9
  disp('8')
elseif k==10
  disp('9')
end

disp('Sprawdz..ENTER')
pause()

%------------------SPRAWDZ---------------------------

imagestest = loadMNISTImages('t10k-images-idx3-ubyte');
labelstest = loadMNISTLabels('t10k-labels-idx1-ubyte');

image=[images,imagestest];
label=[labels;labelstest];
%losujemy nr przykladu:
r2=randperm(70000);

p=50;
%etykieta wylosowanego przykladu:
%macierz wylosowanego przykladu:
Px=image(:,r2(1:p));
Tlabelsx=label(r2(1:p));

Tx=replace(Tlabelsx,p);
Tx=Tx';

disp('Siec przed uczeniem:');
Wbefore = init(784, 10);
Ybefore1 = run(Wbefore, Px(:,1));
Ybefore2 = run(Wbefore, Px(:,2));
Ybefore3 = run(Wbefore, Px(:,3));
Ybefore4 = run(Wbefore, Px(:,4));
Ybefore5 = run(Wbefore, Px(:,5));
Ybefore=[Ybefore1,Ybefore2,Ybefore3,Ybefore4,Ybefore5];
check(Wbefore, Px, Tx);

%disp('Ucz:');
for m=1:2:50
  [Wafter,MSE,CE] = train(Wbefore, Px, Tx, m);
  figure(1);
  title('MSE=f(liczbakrokow)');
  ylabel('MSE - b³¹d œredniokwadratowy');
  xlabel('liczbakrokow');
  plot(m,MSE,'r.-','LineWidth',3,'MarkerSize',15);hold on;
  figure(2);
  title('CE=f(liczbakrokow)');
  ylabel('CE - procent b³êdnych klasyfikacji');
  xlabel('liczbakrokow');
  plot(m,CE,'b.-','LineWidth',3,'MarkerSize',15);hold on;
end

disp('Siec po uczeniu:');
Yafter1 = run(Wafter, Px(:,1));
Yafter2 = run(Wafter, Px(:,2));
Yafter3 = run(Wafter, Px(:,3));
Yafter4 = run(Wafter, Px(:,4));
Yafter5 = run(Wafter, Px(:,5));
Yafter=[Yafter1,Yafter2,Yafter3,Yafter4,Yafter5];
check(Wafter, Px, Tx);
