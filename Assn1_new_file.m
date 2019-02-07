

%% Matrix formation
%day,month,year,hour,data
formatIn = 'mm/dd/yyyy';
RawMatrix=[];
index= 1;
for n = 1:9528
    allDate = datenum(pgdata2.Date(n),formatIn);
    isvalid = (year(allDate) == 2018 || year(allDate) ==2019);
    if isvalid
        RawMatrix(index,1)=day(allDate);
        RawMatrix(index,2)=month(allDate);
        RawMatrix(index,3)=year(allDate);
        RawMatrix(index,4)=pgdata2.Time(n);
        RawMatrix(index,5)=pgdata2.PM25(n);
        index = index+1;
    end
end



    