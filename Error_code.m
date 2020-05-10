% Experiment 1

clearvars
clc
close all
data = xlsread('Book1.xlsx');
t = data(:, 1);
x = data(:, 2);
T=numel(x); % data vector length
for Number_Of_Points_Removed = 1:round(T/3)
    for Trial = 1:3000       
        points = 1+randi(T-2,Number_Of_Points_Removed,1);
        Xm = x;
        Tm = t;
        Tm(points) = nan;
        Xm(points) = nan;
        X_r3 = fillgaps(Xm);
        X_r4 = fillmissing(Xm,'previous');
        Tm(points) = [];
        Xm(points) = [];
        X_r1 = interp1(Tm,Xm,t,'linear');
        X_r2 = interp1(Tm,Xm,t,'spline');
        Err1(Trial) = sqrt(sum((x-X_r1).^2)/ Number_Of_Points_Removed);
        Err2(Trial) = sqrt(sum((x-X_r2).^2)/ Number_Of_Points_Removed);
        Err3(Trial) = sqrt(sum((x-X_r3).^2)/ Number_Of_Points_Removed);
        Err4(Trial) = sqrt(sum((x-X_r4).^2)/ Number_Of_Points_Removed);
    end
    Number_Of_Points_Removed
    total_Err1(Number_Of_Points_Removed) = mean(Err1);
    total_Err2(Number_Of_Points_Removed) = mean(Err2);
    total_Err3(Number_Of_Points_Removed) = mean(Err3);
    total_Err4(Number_Of_Points_Removed) = mean(Err4);
end
plot(total_Err1)
hold on
plot(total_Err2)
plot(total_Err3)
plot(total_Err4)
title('Error due to random number of missing data from random starting point')
legend('Linear interpolation','Spline interpolation','Gap filling','Fill missing')
xlabel('Number of missing points')
ylabel('RMS error')


% Experiment 2

for Number_Of_Points_Removed = 1:1:round(T/3)
    for Trial = 1:3000         
        start_points = 1+randi(T-2-Number_Of_Points_Removed,1,1);
        if(Number_Of_Points_Removed>1)
        points=start_points:1:Number_Of_Points_Removed+start_points-1;
        else
        points=start_points;
        end
        Xm = x;
        Tm = t;
        Tm(points) = nan;
        Xm(points) = nan;
        X_r3 = fillgaps(Xm);
        X_r4 = fillmissing(Xm,'previous');
        Tm(points) = [];
        Xm(points) = [];
        X_r1 = interp1(Tm,Xm,t,'linear');
        X_r2 = interp1(Tm,Xm,t,'spline');
        Err1(Trial) = sqrt(sum((x-X_r1).^2)/ Number_Of_Points_Removed);
        Err2(Trial) = sqrt(sum((x-X_r2).^2)/ Number_Of_Points_Removed);
        Err3(Trial) = sqrt(sum((x-X_r3).^2)/ Number_Of_Points_Removed);
        Err4(Trial) = sqrt(sum((x-X_r4).^2)/ Number_Of_Points_Removed);
    end
    Number_Of_Points_Removed
    total_Err1(Number_Of_Points_Removed) = mean(Err1);
    total_Err2(Number_Of_Points_Removed) = mean(Err2);
    total_Err3(Number_Of_Points_Removed) = mean(Err3);
    total_Err4(Number_Of_Points_Removed) = mean(Err4);
end
figure()
plot(total_Err1)
hold on
plot(total_Err2)
plot(total_Err3)
plot(total_Err4)
title('Error due to consecutive number of missing data from random starting point')
legend('Linear interpolation','Spline interpolation','Gap filling','Fill missing')
xlabel('Number of missing points')
ylabel('RMS error')

%%

clearvars
clc
close all
data = xlsread('Book1.xlsx');
t = data(:, 1);
x = data(:, 2);
T=numel(x); % data vector length
for Number_Of_Points_Removed = 1:round(T/3)
    for Trial = 1:100       
        points = 1+randi(T-2,Number_Of_Points_Removed,1);
        Xm = x;
        Tm = t;
        Tm(points) = nan;
        Xm(points) = nan;
        X_r3 = fillgaps(Xm);
        X_r4 = fillmissing(Xm,'previous');
        Tm(points) = [];
        Xm(points) = [];
        X_r1 = interp1(Tm,Xm,t,'linear');
        X_r2 = interp1(Tm,Xm,t,'spline');
    end
end
plot(X_r1)
hold on
plot(X_r2)
plot(X_r3)
plot(X_r4)
title('Error due to random number of missing data from random starting point')
legend('Linear interpolation','Spline interpolation','Gap filling','Fill missing')
xlabel('Number of missing points')
ylabel('RMS error')

%%
clearvars
clc
close all
data = xlsread('Book1.xlsx');
t = data(:, 1);
x = data(:, 2);
T=numel(x); % data vector length
for Number_Of_Points_Removed = 1:1:round(T/3)
    for Trial = 1:100         
        start_points = 1+randi(T-2-Number_Of_Points_Removed,1,1);
        if(Number_Of_Points_Removed>1)
        points=start_points:1:Number_Of_Points_Removed+start_points-1;
        else
        points=start_points;
        end
        Xm = x;
        Tm = t;
        Tm(points) = nan;
        Xm(points) = nan;
        X_r3 = fillgaps(Xm);
        X_r4 = fillmissing(Xm,'previous');
        Tm(points) = [];
        Xm(points) = [];
        X_r1 = interp1(Tm,Xm,t,'linear');
        X_r2 = interp1(Tm,Xm,t,'spline');
    end
end
figure()
plot(X_r1)
hold on
plot(X_r2)
plot(X_r3)
plot(X_r4)
title('Error due to consecutive number of missing data from random starting point')
legend('Linear interpolation','Spline interpolation','Gap filling','Fill missing')
xlabel('Number of missing points')
ylabel('RMS error')
