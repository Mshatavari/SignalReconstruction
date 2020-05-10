%% Interpolation method

clearvars;
clc;
data_0 = xlsread('Book1.xlsx');
org1 = data_0(:, 1);
org2 = data_0(:, 2);
data_1 = xlsread('dataset_31.xlsx');
R = rmmissing(data_1);
col1 = R(:, 1);
col2 = R(:, 2);
% col3 = data_1(:, 3);
% col4 = data_1(:, 4);
% col5 = data_1(:, 5);
% col6 = data_1(:, 6);
% plot(col1, col2, col3, col4, col5, col6);
% plot(col1, col2);
xq = 0:500:100000;
vq1 = interp1(col1,col2,xq,'linear');
figure;
subplot(3,1,1);
plot(org1,org2);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Original Signal')
subplot(3,1,2);
plot(org1,org2);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Signal with missing data')
subplot(3,1,3);
plot(col1,col2);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Signal with removed missing data')
subplot(3,1,4);
plot(col1,col2,'*r',xq,vq1,'-b');
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Reconstructed Signal')

%%
clearvars;
clc;
data_0 = xlsread('Book1.xlsx');
org1 = data_0(:, 1);
org2 = data_0(:, 2);
data_1 = xlsread('dataset_31.xlsx');
col1 = data_1(:, 1);
col2 = data_1(:, 2);
F = smoothdata(col2);
% F = smoothdata(col2,'gaussian',10);
figure;
subplot(3,1,1);
plot(org1,org2);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Original Signal')
subplot(3,1,2);
plot(col1,col2);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Signal with missing data')
subplot(3,1,3);
plot(col1,F,'r.-',col1,col2,'b.-') 
legend('Filled Missing Data','Original Data')
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Reconstructed signal')

%%
% Handling outliers
clearvars;
clc;
data_0 = xlsread('Book1.xlsx');
org1 = data_0(:, 1);
org2 = data_0(:, 2);
data_1 = xlsread('dataset_31.xlsx');
col1 = data_1(:, 1);
col2 = data_1(:, 2);
dat = iddata(col2,org2,0.2);
dat1 = misdata(dat);
figure;
subplot(3,1,1);
plot(col1,col2);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Original Signal')
subplot(3,1,2);
plot(dat,dat1)

%%
clearvars;
clc;
data_0 = xlsread('Book1.xlsx');
org1 = data_0(:, 1);
org2 = data_0(:, 2);
data_1 = xlsread('dataset_31.xlsx');
col1 = data_1(:, 1);
col2 = data_1(:, 2);
B = filloutliers(col2, 'spline', 'mean');
figure;
subplot(3,1,1);
plot(org1,org2);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Original Signal')
subplot(3,1,2);
plot(col1,col2);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Signal with missing data')
subplot(3,1,3);
plot(col1,B,'r.-',col1,col2,'b.-') 
legend('Filled Missing Data','Original Data')
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Reconstructed signal')