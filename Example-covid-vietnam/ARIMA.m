
%% Du bao 80%
% ARIMA_Close = arima(2,1,0);
% [ARIMA_Close1,~,Loglikehood] = estimate(ARIMA_Close,P)
% rng(1); % For reproducibility
% residual = infer(ARIMA_Close1,P);
% prediction = P + residual;
% figure
% plot([1:97],P);
% hold on
% plot([1:97],prediction);
% title('Corona virus');
% ylabel('Patients');
% xlabel('Timeline');
% legend('Original','ARIMA(1,1,1)','Location','best');
% grid on
% hold off
%% Du bao ARIMA
clc
clear all
%cam
% P=[49	35	25	40	64	44	26	38	15	24	34	31	23	21	34	24	0	113	39	62	39	41	20	0	180	36	37	0	0	175	35	29	55	0	96	179	86	145	62	0	37	69	143	0	63	163	0	113	576	477	434	0	181	178	344	262	291	618	624	...
%         431	303	446	655	511	616	580	508	698	880	761	388	730	841	938	672	650	558	538	520	506	480	472	446	358	335	350	360	345	393	415	460	488	560	556	568	660	649	599	588	579	690	616	750	729	886	538	631	589	678	729	426	655	638	468	542	495	693	625 ...
%         799	471	659	735	678	587	655	699	745	839	883	723	1130	999	966	948	993	896	935	981	954	988	933	981	911	830	915	996	889	836	845	790	825	812	811	825	860	819	778	685	766	765	668	658	671	560	577	583	591	588	522	556	508	499	486	455	423	598	...
%         588	593	556	593	533	519	493	496	410	466	428	423	411	401	438	408	439	455	416	491	422	461	528	511	596	589	660	658	662	629	657	653	693	698	648	612	622	628	637	638	822	816	830	839	866	881	978	232]';
  %VN
P=[14	20	23	10	35	60	47	108	167	77	82	87	82	76	296	100	147	153	208	89 ...
        132	178	156	129	527	155	270	40	512	199	325	193	245	193	301	216	211	236	195	413	200	213	289	293	251	423 ...
        490	356	358	470	280	272	252	207	334	214	788	415	396	371	545	675	394	1189	951	1051	1029	1044 ...
        1425	1798	1862	2008	2187	2744	2830	4049	4004	4710	4843	4335	5427	... 
        5537	7125	8688	7956	6260	5174	10774	6519	9765	7717	8938	7447	7445	... 
        16954	7295	7310	4315	12275	9904	9334	8043	8606	5025	9180	9716	9580	8652	9605	8800	10510	10657	13439 ...
        11352	10397	10811	12096	11575	17428	12103	12796	14224	12607	11434]';
%         %13197	14922	9521	13137	12481	14208	12680	12420	13321	11932	12026	11172	10508	10585	10489	11521	9373	10040	8681	11692	11527	9472	8537	9706	10011	9362	4589	8758	11357]';
% thucte=[14	20	23	10	35	60	47	108	167	77	82	87	82	76	296	100	147	153	208	89 ...
%         132	178	156	129	527	155	270	40	512	199	325	193	245	193	301	216	211	236	195	413	200	213	289	293	251	423 ...
%         490	356	358	470	280	272	252	207	334	214	788	415	396	371	545	675	394	1189	951	1051	1029	1044 ...
%         1425	1798	1862	2008	2187	2744	2830	4049	4004	4710	4843	4335	5427	... 
%         5537	7125	8688	7956	6260	5174	10774	6519	9765	7717	8938	7447	7445	... 
%         16954	7295	7310	4315	12275	9904	9334	8043	8606	5025	9180	9716	9580	8652	9605	8800	10510	10657	13439 ...
%         11352	10397	10811	12096	11575	17428	12103	12796	14224	12607	11434 ...
%         13197	14922	9521	13137	12481	14208	12680	12420	13321	11932	12026	11172	10508	10585	10489	11521	9373	10040	8681	11692	11527	9472	8537	9706	10011	9362	4589	8758	11357]';

    %death
% P=[2	1	1	1	0	1	1	1	0	0	0	1	1	0	2	2	0	0	2	0	0	2	1	1	0	2	0	0	1	2	2	3	0	1	2	2	0	2	2	2	1	0	3	0	2	4	7	5	2	6	2	7	6	7	6	69	18	0	29	80	0	36	0	0	0	0	154	0	106	392	139	145	0	0	765	256	393	296	234	147	360	388	342	326	275	349	337	367	331	298	380	390	0	737	389	348	335	318	386	352	344	315	0	804	270	308	347	281	311	316	434	335	275	273	261	381	276	250	239	212	220	233	215	240	236	236	203	180	184	174	178	162	203	136]';
    % load training97GA
kiemtra = P(1:104);
thucte=P(105:end);
%kiemtra = P(1:(round(length(P)*0.80)));

%  kiemtra = P((round(length(P)*0.80)+1):end);
ARIMA_Close = arima(2,1,1);
[ARIMA_Close1,~,Loglikehood] = estimate(ARIMA_Close,kiemtra)
rng(1); % For reproducibility
ARIMA_CloseFinalForecast1 = forecast(ARIMA_Close1,30,'Y0',kiemtra)
DB=[ARIMA_CloseFinalForecast1]
% thucte=c(98:121,:)';
% load datacorona
% X=c;
%% goc
ts1 = timeseries(kiemtra,1:length(kiemtra));
ts1.Name = 'Daily Count';
ts1.TimeInfo.Units = 'days';
ts1.TimeInfo.StartDate = '1-May-2021';     
ts1.TimeInfo.Format = 'mmm dd, yy';       
% ts1.Time = ts1.Time - ts1.Time(1);        
plot(ts1,'b-','linewidth',2)
% legend('Origin data')
hold on
%% 
R=[kiemtra;DB];
ts2 = timeseries(R,1:length(R));
ts2.Name = 'Daily Count';
ts2.TimeInfo.Units = 'days';
ts2.TimeInfo.StartDate = '1-May-2021';    
ts2.TimeInfo.Format = 'mmm dd, yy';       
% ts2.Time = ts1.Time - ts1.Time(1);       
plot(ts2,'r--','linewidth',2)
legend('Actual value','Forecast value')
xlabel('Date')
ylabel('The number of patients')
hold off


DB=[13035.84	13476.09	9413.32	13048.73	12527.69	12791.43	12842.98	12408.08	12994.52	11507.50	11635.35	11298.35	10528.83	10677.70	10491.01	11305.09	9412.91	9685.85	8910.80	11330.81	11305.16	9413.02	8651.05	9436.65	9650.28	9412.66	4758.59	9030.95	11310.90	7349.99]';
thucte=[13197	14922	9521	13137	12481	14208	12680	12420	13321	11932	12026	11172	10508	10585	10489	11521	9373	10040	8681	11692	11527	9472	8537	9706	10011	9362	4589	8758	11357	6957]';  
MAE = mean(abs(DB-thucte))
%      MAPE = mean((abs(DB-kiemtra)./kiemtra)*100)
%     MSE = mean((KQDB-thucte).^2)
    
 SMAPE=sum((abs(DB'-thucte')/(abs(DB'+thucte')/2))*100)
% mau=0;
% for i=2:length(DB)
%     MA=abs(DB(:,i)-thucte(:,i-1));
%     mau=mau+sum(MA);
% end
% mau;
% MASE=sum(abs(KQDB-thucte))/(mau*(length(KQDB)/(length(KQDB)-1)))









% 
% 
% 
% Name = "Arima(0,1,0)";
% AIC = aic;
% BIC = bic;
% W=2;
% for i = 1:2
%     for j = 1:2
%         for k=1:2
%             ARIMA_CloseE(W-1) = arima(i,j,k);
%             [~,~,LoglikehoodE] = estimate(ARIMA_CloseE(W-1),StockData_TimeTable_2016.Close,'display','off');
%             [aicE,bicE] = aicbic(LoglikehoodE,2,250);
%             a=convertCharsToStrings(strcat('Arima(',num2str(i),',',num2str(j),',',num2str(k),')'));
%             Name(W) = a;
%             AIC(W) = aicE;
%             BIC(W) = bicE;
%             W=W+1;
%         end
%     end
% end
% TableComparison = table;
% TableComparison = table(Name',AIC',BIC')
% 
% 
% TableComparison.Properties.VariableNames = {'NameModel','AIC','BIC'};
% %find the lowest AIC and BIC
% AICWin = AIC(1);
% recordAIC = i;
% %Lowest AIC
% for i=1:length(TableComparison.AIC)
%     if TableComparison.AIC(i)>AICWin
%         recordAIC=i;
%     end
% end
% BICWin = BIC(1);
% recordBIC = i;
% %Lowest BIC
% for i=1:length(TableComparison.BIC)
%     if TableComparison.BIC(i)>BICWin
%         recordBIC=i;
%     end
% end
% %The lowest AIC and BIC is model ARIMA(1,2,1)
% %Hence we use ARIMA(1,2,1) for forecastinh
% ARIMA_CloseFinal = arima(1,2,1);
% [ARIMA_CloseFinal,~,LoglikehoodE] = estimate(ARIMA_CloseFinal,StockData_TimeTable_2016.Close,'display','off');
% rng(1); % For reproducibility
% %View the predictive value
% residual = infer(ARIMA_CloseFinal,StockData_TimeTable_2016.Close);
% prediction = StockData_TimeTable_2016.Close + residual;
% figure
% plot(StockData_TimeTable_2016.Date,StockData_TimeTable_2016.Close);
% hold on
% plot(StockData_TimeTable_2016.Date,prediction);
% title('Air Asia Berhad Stock Price in Year 2016');
% ylabel('SGD');
% xlabel('Timeline');
% legend('Original','ARIMA(1,2,1)','Location','best');
% grid on
% hold off