clc
clear all
load LTSM11day
load ARIMA11day
load dubaomoi11day-proposed
x=[1:178];
V=[	4	6	9	12	12	6	3	10	9	5	8	45	18	14	20	23	10	35	60	47	108	167	77	82	87	82	76	296	100	147	153	208	89 ...
        132	178	156	129	527	155	270	40	512	199	325	193	245	193	301	216	211	236	195	413	200	213	289	293	251	423	490	356	358	470	280	272	252	207	334	214	788	415	396	371	545	675	394	1189	951	1051	1029	1044	1425	1798	1862	2008	2187	2744	2830	4049	4004	4710	4843	4335	5427	5537	7125	8688	7956	6260	5174	10774	6519	9765	7717	8938	7447	7445	16954	7295	7310	4315	12275	9904	9334	8043	8606	5025	9180	9716	9580	8652	9605	8800	10510	10657	13439 ...
        11352	10397	10811	12096	11575	17428	12103	12796	14224	12607	11434	13197	14922	9521	13137	12481	14208	12680	12420	13321	11932	12026	11172	10508	10585	10489	11521	9373	10040	8681	11692	11527	9472	8537	9706	10011	9362	4589	8758	11357	6957]';
% %nghiep
% MAPE1=mean((abs(dubao-V)./V)*100)
% MAE1=mean(abs(abs(dubao-V)))
% %LSTM
% YTrain=YTrain';
% MAPE2=mean((abs(YTrain-V(2:end,:))./V(2:end,:))*100)
% MAE2=mean(abs(abs(YTrain-V(2:end,:))))
% % De xuat
% MAPE3=mean((abs(F-V(3:end,:))./V(3:end,:))*100)
% MAE3=mean(abs(abs(F-V(3:end,:))))

    ts1 = timeseries(V,x(1:end-11,:));
ts1.Name = 'Daily Count';
ts1.TimeInfo.Units = 'days';
ts1.TimeInfo.StartDate = '17-April-2021';     
ts1.TimeInfo.Format = 'mmm dd, yy';       
plot(ts1,'m-','linewidth',2)
hold on

% ARIMA
ts2 = timeseries([V;DB],1:178);
ts2.Name = 'Daily Count';
ts2.TimeInfo.Units = 'days';
ts2.TimeInfo.StartDate = '17-April-2021';    
ts2.TimeInfo.Format = 'mmm dd, yy';           
plot(ts2,'r--','linewidth',2)
hold on
% LSTM

ts3 = timeseries(dubaomoi',1:length(dubaomoi));
ts3.Name = 'Daily Count';
ts3.TimeInfo.Units = 'days';
ts3.TimeInfo.StartDate = '18-April-2021';    
ts3.TimeInfo.Format = 'mmm dd, yy';           
plot(ts3,'b--','linewidth',2)
hold on
% De xuat
ts4 = timeseries(hg,1:length(hg));
ts4.Name = 'Daily Count';
ts4.TimeInfo.Units = 'days';
ts4.TimeInfo.StartDate = '19-April-2021';    
ts4.TimeInfo.Format = 'mmm dd, yy';           
plot(ts4,'y--','linewidth',2)

legend('Actual value','Tai and nghiep', 'LSTM', 'Proposed')
xlabel('Date')
ylabel('The number of patients')
hold off