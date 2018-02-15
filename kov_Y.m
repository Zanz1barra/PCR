% переменные 
kol_komp = 5;
COVY = cov(Y);
sizeY = size(COVY);
sizeY(1);
[eigvec, eigvall] = eig(COVY);
eigvall = diag(eigvall);
%поиск главных компонент 
%построение графика значений главных значений 
otc = sizeY(1)-10:1:sizeY(1);
%plot(otc, eigvall(sizeY(1)-10:sizeY(1)));
% построение проекций на главные компоненты  
eigvec2 = eigvec(1:1,:) % подматрица выбранных компонент sizeY(1)-kol_komp:sizeY(1)
%eigvec2 = eigvec;
PY = eigvec2*Y';
% восстановление сигнала по главных компонентам 
Y_vost = eigvec2'*PY;
Y_vost = Y_vost';
% проверка правильности восстановления сигнала 
 e = (Y-Y_vost).^2;
sume = sqrt(sum((sum(e)')))
sumY = sqrt(sum((sum(Y.^2)')))
srede = sume/(11000*512)
sredY = sumY/(11000*512)
otnos_e = srede / sredY
% вывод отдельных отведений сигнала
otved = 200;
ISHY = Y(otved:otved, :);
REZY = Y_vost(otved:otved, :);
subplot(2,1,1)
plot(ISHY)
subplot(2,1,2)
plot(REZY)
% определение дисперсии, приходящейся на компоненту
dispRY(1:512) = 0;
for i=1:512
    RY = Y_vost(i:i, :);
    dispRY(i) = var(RY);
end
dispRY;
sumdispRY = sum(dispRY)