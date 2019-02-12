%% RAW DATA PM 2.5 IN PRINCE GEORGE PLAZA JAN 2018 TO JAN 2019

clear
close all
clc

%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\Pearl\Desktop\Edumacation\GEOB 402\Assn_1\PGPlaza running avg.xls
%    Worksheet: PGPlaza running avg
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2019/02/08 13:28:46

%% Import the data
[~, ~, raw] = xlsread('C:\Users\Pearl\Desktop\Edumacation\GEOB 402\Assn_1\PGPlaza running avg.xls','PGPlaza running avg','A5:C9182');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
stringVectors = string(raw(:,[1,3]));
stringVectors(ismissing(stringVectors)) = '';
raw = raw(:,2);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
PGAllAvg = table;

%% Allocate imported array to column variable names
PGAllAvg.Date = stringVectors(:,1);
PGAllAvg.Time = data(:,1);
PGAllAvg.PM25 = stringVectors(:,2);

%% Clear temporary variables
clearvars data raw stringVectors R;

%% Matrix formation
%day,month,year,hour,data
formatIn = 'mm/dd/yyyy';
RawMatrix=[];
index= 1;
for n = 1:9167
    allDate = datenum(PGAllAvg.Date(n),formatIn);
    isvalid = year(allDate) == 2018;
    if isvalid
        RawMatrix(index,1)=day(allDate);
        RawMatrix(index,2)=month(allDate);
        RawMatrix(index,3)=year(allDate);
        RawMatrix(index,4)=PGAllAvg.Time(n);
        RawMatrix(index,5)=PGAllAvg.PM25(n);
        index = index+1;
    end
end

%% split by season
winter = [];
spring =[];
summer=[];
fall=[];

for n = 1:length(RawMatrix)
    iswinter = RawMatrix(n,2) == 1 || RawMatrix(n,2) == 2 || RawMatrix(n,2) == 3;
    isspring = RawMatrix(n,2) == 4 || RawMatrix(n,2) == 5 || RawMatrix(n,2) == 6;
    if iswinter
        winter(n,:)=RawMatrix(n,:);
    end
 end

index = 1;
for n = 1:length(RawMatrix)
    isspring = RawMatrix(n,2) == 4 || RawMatrix(n,2) == 5 || RawMatrix(n,2) == 6;
    if isspring
        spring(index,:)=RawMatrix(n,:);
        index = index + 1;
    end
end

index = 1;
for n = 1:length(RawMatrix)
    issummer = RawMatrix(n,2) == 7 || RawMatrix(n,2) == 8 || RawMatrix(n,2) == 9;
    if issummer
        summer(index,:)=RawMatrix(n,:);
        index = index + 1;
    end
end

index = 1;
for n = 1:length(RawMatrix)
    isfall = RawMatrix(n,2) == 10 || RawMatrix(n,2) == 11 || RawMatrix(n,2) == 12;
    if isfall
        fall(index,:)=RawMatrix(n,:);
        index = index + 1;
    end
end

%% Split by hour
winterhrs = [];
springhrs =[];
summerhrs=[];
fallhrs=[];

%WINTER
index = 1;
for n = 1:length(winter)-24
    if isnan(winter(n,4))
        winterhrs(index,1) = winter(n,5);
        winterhrs(index,2) = winter(n+1,5);
        winterhrs(index,3) = winter(n+2,5);
        winterhrs(index,4) = winter(n+3,5);
        winterhrs(index,5) = winter(n+4,5);
        winterhrs(index,6) = winter(n+5,5);
        winterhrs(index,7) = winter(n+6,5);
        winterhrs(index,8) = winter(n+7,5);
        winterhrs(index,9) = winter(n+8,5);
        winterhrs(index,10) = winter(n+9,5);
        winterhrs(index,11) = winter(n+10,5);
        winterhrs(index,12) = winter(n+11,5);
        winterhrs(index,13) = winter(n+12,5);
        winterhrs(index,14) = winter(n+13,5);
        winterhrs(index,15) = winter(n+14,5);
        winterhrs(index,16) = winter(n+15,5);
        winterhrs(index,17) = winter(n+16,5);
        winterhrs(index,18) = winter(n+17,5);
        winterhrs(index,19) = winter(n+18,5);
        winterhrs(index,20) = winter(n+19,5);
        winterhrs(index,21) = winter(n+20,5);
        winterhrs(index,22) = winter(n+21,5);
        winterhrs(index,23) = winter(n+22,5);
        winterhrs(index,24) = winter(n+23,5);
        index = index + 1;
    end
end

%SPRING
index = 1;
for n = 1:length(spring)-24
    if isnan(spring(n,4))
        springhrs(index,1) = spring(n,5);
        springhrs(index,2) = spring(n+1,5);
        springhrs(index,3) = spring(n+2,5);
        springhrs(index,4) = spring(n+3,5);
        springhrs(index,5) = spring(n+4,5);
        springhrs(index,6) = spring(n+5,5);
        springhrs(index,7) = spring(n+6,5);
        springhrs(index,8) = spring(n+7,5);
        springhrs(index,9) = spring(n+8,5);
        springhrs(index,10) = spring(n+9,5);
        springhrs(index,11) = spring(n+10,5);
        springhrs(index,12) = spring(n+11,5);
        springhrs(index,13) = spring(n+12,5);
        springhrs(index,14) = spring(n+13,5);
        springhrs(index,15) = spring(n+14,5);
        springhrs(index,16) = spring(n+15,5);
        springhrs(index,17) = spring(n+16,5);
        springhrs(index,18) = spring(n+17,5);
        springhrs(index,19) = spring(n+18,5);
        springhrs(index,20) = spring(n+19,5);
        springhrs(index,21) = spring(n+20,5);
        springhrs(index,22) = spring(n+21,5);
        springhrs(index,23) = spring(n+22,5);
        springhrs(index,24) = spring(n+23,5);
        index = index + 1;
    end
end


%SUMMER
index = 1;
for n = 1:length(summer)-24
    if isnan(summer(n,4))
        summerhrs(index,1) = summer(n,5);
        summerhrs(index,2) = summer(n+1,5);
        summerhrs(index,3) = summer(n+2,5);
        summerhrs(index,4) = summer(n+3,5);
        summerhrs(index,5) = summer(n+4,5);
        summerhrs(index,6) = summer(n+5,5);
        summerhrs(index,7) = summer(n+6,5);
        summerhrs(index,8) = summer(n+7,5);
        summerhrs(index,9) = summer(n+8,5);
        summerhrs(index,10) = summer(n+9,5);
        summerhrs(index,11) = summer(n+10,5);
        summerhrs(index,12) = summer(n+11,5);
        summerhrs(index,13) = summer(n+12,5);
        summerhrs(index,14) = summer(n+13,5);
        summerhrs(index,15) = summer(n+14,5);
        summerhrs(index,16) = summer(n+15,5);
        summerhrs(index,17) = summer(n+16,5);
        summerhrs(index,18) = summer(n+17,5);
        summerhrs(index,19) = summer(n+18,5);
        summerhrs(index,20) = summer(n+19,5);
        summerhrs(index,21) = summer(n+20,5);
        summerhrs(index,22) = summer(n+21,5);
        summerhrs(index,23) = summer(n+22,5);
        summerhrs(index,24) = summer(n+23,5);
        index = index + 1;
    end
end

%SUMMER
index = 1;
for n = 1:length(fall)-24
    if isnan(fall(n,4))
        fallhrs(index,1) = fall(n,5);
        fallhrs(index,2) = fall(n+1,5);
        fallhrs(index,3) = fall(n+2,5);
        fallhrs(index,4) = fall(n+3,5);
        fallhrs(index,5) = fall(n+4,5);
        fallhrs(index,6) = fall(n+5,5);
        fallhrs(index,7) = fall(n+6,5);
        fallhrs(index,8) = fall(n+7,5);
        fallhrs(index,9) = fall(n+8,5);
        fallhrs(index,10) = fall(n+9,5);
        fallhrs(index,11) = fall(n+10,5);
        fallhrs(index,12) = fall(n+11,5);
        fallhrs(index,13) = fall(n+12,5);
        fallhrs(index,14) = fall(n+13,5);
        fallhrs(index,15) = fall(n+14,5);
        fallhrs(index,16) = fall(n+15,5);
        fallhrs(index,17) = fall(n+16,5);
        fallhrs(index,18) = fall(n+17,5);
        fallhrs(index,19) = fall(n+18,5);
        fallhrs(index,20) = fall(n+19,5);
        fallhrs(index,21) = fall(n+20,5);
        fallhrs(index,22) = fall(n+21,5);
        fallhrs(index,23) = fall(n+22,5);
        fallhrs(index,24) = fall(n+23,5);
        index = index + 1;
    end
end

%RAW TIMESERIES
alldatetime =strings();
i =1;
for n = 1:9167-24
    allDate = datenum(PGAllAvg.Date(n),formatIn);
    isvalid = year(allDate) == 2018;
    if isnan(PGAllAvg.Time(n)) && isvalid
    alldatetime(i,1) = PGAllAvg.Date(n) + (" 00:00");
    alldatetime(i + 1,1) = PGAllAvg.Date(n+1) + (" 01:00");
    alldatetime(i + 2,1) = PGAllAvg.Date(n+2) + (" 02:00");
    alldatetime(i + 3,1) = PGAllAvg.Date(n+3) + (" 03:00");
    alldatetime(i + 4,1) = PGAllAvg.Date(n+4) + (" 04:00");
    alldatetime(i + 5,1) = PGAllAvg.Date(n+5) + (" 05:00");
    alldatetime(i + 6,1) = PGAllAvg.Date(n+6) + (" 06:00");
    alldatetime(i + 7,1) = PGAllAvg.Date(n+7) + (" 07:00");
    alldatetime(i + 8,1) = PGAllAvg.Date(n+8) + (" 08:00");
    alldatetime(i + 9,1) = PGAllAvg.Date(n+9) + (" 09:00");
    alldatetime(i + 10,1) = PGAllAvg.Date(n+10) + (" 10:00");
    alldatetime(i + 11,1) = PGAllAvg.Date(n+11) + (" 11:00");
    alldatetime(i + 12,1) = PGAllAvg.Date(n+12) + (" 12:00");
    alldatetime(i+ 13,1) = PGAllAvg.Date(n+13) + (" 13:00");
    alldatetime(i + 14,1) = PGAllAvg.Date(n+14) + (" 14:00");
    alldatetime(i + 15,1) = PGAllAvg.Date(n+15) + (" 15:00");
    alldatetime(i + 16,1) = PGAllAvg.Date(n+16) + (" 16:00");
    alldatetime(i + 17,1) = PGAllAvg.Date(n+17) + (" 17:00");
    alldatetime(i + 18,1) = PGAllAvg.Date(n+18) + (" 18:00");
    alldatetime(i + 19,1) = PGAllAvg.Date(n+19) + (" 19:00");
    alldatetime(i + 20,1) = PGAllAvg.Date(n+20) + (" 20:00");
    alldatetime(i + 21,1) = PGAllAvg.Date(n+21) + (" 21:00");
    alldatetime(i + 22,1) = PGAllAvg.Date(n+22) + (" 22:00");
    alldatetime(i + 23,1) = PGAllAvg.Date(n+23) + (" 23:00");
    i = i + 24;
    end
end
%% Boxplots

hoursvec=(0:23);
dummy=(0:25);
standard=[28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28];
for i=1:24
    standard(i) = 28;
end


figure
boxplot(winterhrs,hoursvec);
title({'Winter 24-hr Running Average(Jan,Feb,Mar)','PM 2.5 concentrations per hour'});
xlabel('Hours');
ylabel({'Running Average PM 2.5',' Concentration ({\mu}g m^{-3})'});
hold on
plot(dummy,standard,'-k');
grid on
grid minor

figure
boxplot(springhrs,hoursvec);
title({'Spring 24-hr Running Average(Apr,May,Jun)','PM 2.5 concentrations per hour'});
xlabel('Hours');
ylabel({'Running Average PM 2.5',' Concentration ({\mu}g m^{-3})'});
hold on
plot(dummy,standard,'-k');
grid on
grid minor

figure
boxplot(summerhrs,hoursvec);
title({'Summer 24-hr Running Average(Jul,Aug,Sep)','PM 2.5 concentrations per hour'});
xlabel('Hours');
ylabel({'Running Average PM 2.5',' Concentration ({\mu}g m^{-3})'});
hold on
plot(dummy,standard,'-k');
grid on
grid minor
hold off

figure
boxplot(fallhrs,hoursvec);
title({'Fall 24-hr Running Average(Oct,Nov,Dec)','PM 2.5 concentrations per hour'});
xlabel('Hours');
ylabel({'Running Average PM 2.5',' Concentration ({\mu}g m^{-3})'});
hold on
plot(dummy,standard,'-k');
grid on
grid minor


figure
formatIn = 'MM/dd/yyyy hh:mm';
x_axis_dates=datetime(alldatetime);
plot(x_axis_dates,RawMatrix(:,5));
title({'24 Hour Running Avg Timeseries of',' PM 2.5 concentrations in 2018'});
xlabel('Date');
ylabel('PM 2.5 Concentration ({\mu}g m^{-3})');
datetick('x','mmm');
grid on
grid minor

% HISTOGRAM EXCEEDANCES
pmdata= RawMatrix(:,5);
m1 = pmdata <= 28;
m2 = pmdata > 28;
edges = datetime([x_axis_dates(1),x_axis_dates(722),x_axis_dates(1394),...
    x_axis_dates(3*720 -22),x_axis_dates(4*720 - 22),x_axis_dates(5*720 + 2),x_axis_dates(6*720 + 2),...
    x_axis_dates(7*720  + 26),x_axis_dates(8*720  + 50),x_axis_dates(9*720  + 50),x_axis_dates(10*720  + 74),...
    x_axis_dates(11*720  + 74),x_axis_dates(end-22)]);
h = histogram(x_axis_dates(m2),'NumBins',12,'BinEdges',edges);
h;
xlabel({'Months'}); 
ylabel('Count per bin')
title('Frequency of PM2.5 exceedances in 2018');
legend('> CWS (28 {\mu}g m^{-3})');
xticks(edges + 15);
xtickformat('MMM')
x = h.BinEdges + 15 ;
y = h.Values ;
text(x(1:end-1),y,num2str(y'),'HorizontalAlignment','center', 'VerticalAlignment','bottom'); 
box off