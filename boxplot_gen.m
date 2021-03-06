%% RAW DATA PM 2.5 IN PRINCE GEORGE PLAZA JAN 2018 TO JAN 2019

clear
close all
clc

%% IMPORT DATA

%% Import the data
[~, ~, raw] = xlsread('C:\Users\Pearl\Desktop\Education\GEOB 402\Assn 1\PGPlaza_all_data.xls','PGPlaza_all_data','A5:C9180');
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
PGPlazaalldata = table;

%% Allocate imported array to column variable names
PGPlazaalldata.Date = stringVectors(:,1);
PGPlazaalldata.Time = data(:,1);
PGPlazaalldata.PM25 = stringVectors(:,2);

%% Clear temporary variables
clearvars data raw stringVectors R;

%day,month,year,hour,data
RawMatrix=zeros(height(PGPlazaalldata),5);
formatIn = 'mm/dd/yyyy';
for i = 1:8760
    allDate = datenum(PGPlazaalldata.Date(i),formatIn);
    RawMatrix(i,1)=day(allDate);
    RawMatrix(i,2)=month(allDate);
    RawMatrix(i,3)=year(allDate);
    RawMatrix(i,4)=PGPlazaalldata.Time(i);
    RawMatrix(i,5)=PGPlazaalldata.PM25(i);
end


    