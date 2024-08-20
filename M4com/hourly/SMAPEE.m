clc
clear all
load thucte
load testdata2
for i=1:size(testdata,1)
KQDB=testdata(i,:);
tt=thucte(i,:);
SMAPE(i,:)=mean((abs(KQDB-tt)/(abs(KQDB)+abs(tt)/2))*100);
end
ESMAPE=mean(SMAPE)