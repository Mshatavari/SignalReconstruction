%% ----------Linear Interpolation----------

clearvars;
clc;
data_0 = xlsread('Book1.xlsx'); % Reads the data from an excel file and stores in data_0.
col1 = data_0(:, 1);
Xg = data_0(:, 2);
Xm = Xg;
Xm(30:35) = nan;
missing = Xm;
t = col1;
t(30:35) = [];
missing(30:35) = [];
linear_int = interp1(t,missing,col1,'linear');
figure;
subplot(3,1,1);
plot(col1,Xg);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Original Signal')
subplot(3,1,2);
plot(col1,Xm);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Signal with missing data')
subplot(3,1,3);
plot(col1,Xg,'-b',col1,linear_int,'-r');
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Reconstructed Signal using linear interpolation')


%% --------Spline Interpolation---------

clearvars;
clc;
data_0 = xlsread('Book1.xlsx'); % Reads the data from an excel file and stores in data_0.
col1 = data_0(:, 1);
Xg = data_0(:, 2);
Xm = Xg;
Xm(30:35) = nan;
missing = Xm;
t = col1;
t(30:35) = [];
missing(30:35) = [];
spline_int = interp1(t,missing,col1,'spline');
figure;
subplot(3,1,1);
plot(col1,Xg);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Original Signal')
subplot(3,1,2);
plot(col1,Xm);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Signal with missing data')
subplot(3,1,3);
plot(col1,Xg,'-b',col1,spline_int,'-r');
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Reconstructed Signal using cubic spline interpolation')


%% ---------Using Autoregressive model---------
clearvars;
clc;
data_0 = xlsread('Book1.xlsx'); % Reads the data from an excel file and stores in data_0.
col1 = data_0(:, 1);
Xg = data_0(:, 2);
Xm = Xg;
Xm(30:35) = nan;
auto_reg = fillgaps(Xm);
figure;
subplot(3,1,1);
plot(col1,Xg);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Original Signal')
subplot(3,1,2);
plot(col1,Xm);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Signal with missing data')
subplot(3,1,3);
plot(col1,auto_reg,'r-',col1,Xg,'b') 
legend('Filled Missing Data','Original Data')
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Reconstructed signal using autoregression')


%% ----------Last Observation Carried Forward-----------

clearvars;
clc;
data_0 = xlsread('Book1.xlsx'); % Reads the data from an excel file and stores in data_0.
col1 = data_0(:, 1);
Xg = data_0(:, 2);
Xm = Xg;
Xm(30:35) = nan;
LOCF = fillmissing(Xm,'previous'); 
figure;
subplot(3,1,1);
plot(col1,Xg);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Original Signal')
subplot(3,1,2);
plot(col1,Xm);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Signal with missing data')
subplot(3,1,3);
plot(col1,LOCF,'r-',col1,Xg,'b-') 
legend('Filled Missing Data','Original Data')
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Reconstructed signal using previous method')

%% ------------Multiple plots----------

clearvars;
clc;
data_0 = xlsread('Book1.xlsx'); % Reads the data from an excel file and stores in data_0.
col1 = data_0(:, 1);
Xg = data_0(:, 2);
Xm = Xg;
Xm(30:35) = nan;
missing = Xm;
t = col1;
t(30:35) = [];
missing(30:35) = [];
linear_int = interp1(t,missing,col1,'linear');
spline_int = interp1(t,missing,col1,'spline');
auto_reg = fillgaps(Xm);
LOCF = fillmissing(Xm,'previous'); 
plot(col1,Xg,'b');
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Comparison of the imputation techniques')
hold on
plot(col1,linear_int);
plot(col1,spline_int);
plot(col1,auto_reg) 
plot(col1,LOCF)
legend('original','linear_int' ,'spline_int','auto_reg','LOCF')
hold off

%% --------------Error plots-------------

clearvars;
clc;
data_0 = xlsread('Book1.xlsx'); % Reads the data from an excel file and stores in data_0.
 
E_sq_error_Xr_linear_int = zeros(1,100);
E_sq_error_Xr_spline_int = zeros(1,100);
E_sq_error_Xr_auto_reg = zeros(1,100);
E_sq_error_Xr_LOCF = zeros(1,100);
N=zeros(1,100);

for i=1:1:10
col1 = data_0(:, 1);
Xg = data_0(:, 2);
Xm = Xg;
Nan_length=randi(10);
N(i)=Nan_length;
T=size(Xg,1);
s_nan=randi(75);
e_nan=Nan_length+s_nan;
Xm(s_nan:e_nan) = nan;
missing = Xm;
t = col1;
t(s_nan:e_nan) = [];
missing(s_nan:e_nan) = [];
Xr_linear_int = interp1(t,missing,col1,'linear');
Xr_spline_int = interp1(t,missing,col1,'spline');
Xr_auto_reg = fillgaps(Xm);
Xr_LOCF = fillmissing(Xm,'previous'); 
error_1 = Xg - Xr_linear_int;
error_2 = Xg - Xr_spline_int;
error_3 = Xg - Xr_auto_reg;
error_4 = Xg - Xr_LOCF;
 
E_sq_error_Xr_linear_int(i) = sqrt(mean((Xg - Xr_linear_int).^2));
E_sq_error_Xr_spline_int(i) = sqrt(mean((Xg - Xr_spline_int).^2));
E_sq_error_Xr_auto_reg(i) = sqrt(mean((Xg - Xr_auto_reg).^2));
E_sq_error_Xr_LOCF(i) = sqrt(mean((Xg - Xr_LOCF).^2));
end

subplot(4,1,1)
plot(error_1);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Error due to linear interpolation')
subplot(4,1,2)
plot(error_2);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Error due to spline interpolation')
subplot(4,1,3)
plot(error_3);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Error due to autoregression')
subplot(4,1,4)
plot(error_4);
xlabel('Milliseconds since session start')
ylabel('RR-RR(rpm)')
title('Error due to LOCF')
 
figure()
plot(N,E_sq_error_Xr_linear_int,'r*','DisplayName','Error_Xr_linear_int');
hold on
plot(N,E_sq_error_Xr_spline_int,'g*','DisplayName','Error_Xr_spline_int');
plot(N,E_sq_error_Xr_auto_reg,'b*','DisplayName','Error_Xr_auto_reg');
plot(N,E_sq_error_Xr_LOCF,'m*','DisplayName','Error_Xr_LOCF');
legend
ylabel('Error');
xlabel('Number of NaN');
title('ECG Signal Reconstruction');


