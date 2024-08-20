% clc
% clear all
% load Yearlytest
% load Yearlytestdata
% for i=1:length(testdata)
% KQDB=testdata(i,:);
% thucte=Yearlytest(i,:);
% SMAPE(i,:)=mean((abs(KQDB-thucte)/(abs(KQDB)+abs(thucte)/2))*100);
% end
% ESMAPE=mean(SMAPE)

clc
clear all
load testdata
load Quart756
for i=1:size(testdata,1)-1
KQDB=testdata(i,:);
thucte=Quart756(i,:);
SMAPE(i,:)=mean((abs(KQDB-thucte)/(abs(KQDB)+abs(thucte)/2))*100);
end
ESMAPE=mean(SMAPE)
