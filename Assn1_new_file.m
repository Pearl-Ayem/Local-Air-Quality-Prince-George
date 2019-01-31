%% RAW DATA PM 2.5 IN PRINCE GEORGE PLAZA JAN 2018 TO JAN 2019

clear
close all
clc

%% Import the data
[~, ~, raw] = xlsread('C:\Users\Pearl\Desktop\Education\GEOB 402\pgdata_2.xls','pgdata_2','A5:C9540');
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
pgdata2 = table;

%% Allocate imported array to column variable names
pgdata2.Date = stringVectors(:,1);
pgdata2.Time = data(:,1);
pgdata2.PM25 = stringVectors(:,2);

%% Clear temporary variables
clearvars data raw stringVectors R;
%day,month,year,hour,data
formatIn = 'mm/dd/yyyy';
RawMatrix=[];
index= 1;
for n = 1:9528
    allDate = datenum(pgdata2.Date(n),formatIn);
    isvalid = year(allDate) == 2018;
    if isvalid
        RawMatrix(index,1)=day(allDate);
        RawMatrix(index,2)=month(allDate);
        RawMatrix(index,3)=year(allDate);
        RawMatrix(index,4)=pgdata2.Time(n);
        RawMatrix(index,5)=pgdata2.PM25(n);
        index = index+1;
    end
end


    