clc
clear all
% VN=[14	3	6	5	6	11	11	9	15	9	1	12	9	19	25	14	9	4	6	9	12	12	6	3	10	9	5	8	45	18	14	20	23	10	35	60	47	108	167	77	82	87	82	76	...
%     296	100	147	153	208	89	132	178	156	129	527	155	270	40	512	199	325	193	245	193	301	216	211	236	195	413	200	213	289	293	251	423	490	356	358	470	280	272	252	207	334	214	788	415 ...
%     396	371	545	675	394	1189	951	1051	1029	1044	1425	1798	1862	2008	2187	2744	2830	4049	4004	4710	4843	4335	5427	5537	7125	...
%     8688	7956	6260	5174	10774	6519	9765	7717	8938	7447	0	16954	7295	7310	4315	12275	9904	9334	8043	8606	5025	9180	9716	...
%     9580	8652	9605	8800	10510	10657	13439	11352	10397	10811	12096	11575	17428	12103	12796	14224	12607	11434	13197	14922	9521	13137	12481	...
%     14208	12680	12420	13321	11932	12026	11172	10508	10585	10489	11521	9373	10040	8681	11692	11527	9472	8537	9706	10011	9362	4589	8758	11357	6957]';
% V=[433	292	349	395	484	367	338	336	533	387	233	484	689	568	490	529	489	496	486	693	973	634	949	526	479	415	686	687	678	557	700	467	609	684	585	703	993	672	847	1043	1240	979	1111	1014	857	1017	1106	1031	1331	1041	1226	862	954	1051	1113	1178	1240	1385	1198	1082	1293	1385	1624	1301	1447	1607	1209	1268	1853	2657	1611	1671	1681	1282	1591	1522	1574	1462	1752	1639	1693	1655	1882	1906	1761	1868	1492	1525	1748	2381	1904	2040	1560	1519	1679	1922	1815	1882	2473	2277	1893	1687	1693	1942	2098	2307	2345	2081	1821	1673	1902	2266	2197	2090	2037	1877	2447	2306	2719	3003	3308	2858	2743	2775	3075	3622	3269	3128	3444	2880	3046	3307	3861	3737	3806	3636	3141	3507	3963	3635	3891	4168	3989	4176	4071	4465	4634	4823	4494	3874	3509	4002	4284	4174	4317	4007	3992	3622	4056	4538	4850	4094	4294	4497	3267	3906	4127	4411	4301	... 
%         4301	4105	3373	3602	4267	4432	4369	4070	3732	3222	3520	4029	3565	2897	3143	2696	2618	2973	3356	4065	3778	4262	3880	2853	3779	3770	4173	5444	5272	4106	3535	3807	4265	4798	4792	4998	4360	4442	4192	5534	4917	5828	5418	6267	4617	5092	5533	8369	5803	6027	6089	5754	5292	6058	6033	6310	6388	6189	5489	6120	6725	7354	6689	7751	6982	6848	6347	7514	7199	7259	6740	6528	5854	7903	8002	8074	8072	7203	6877	6753	7445	8854	9321	10617	10046	9640	8692	10047	11278	11557	12818	14224	11287	9086	10365	12568	11703	13632	12191	11788	9994	13094	11948	13695	13802	14518	12001	10994	10379	11984	11434	11749	12156	10827	8242	8700	8776	8435	9869	8844	6765	6462	10029	9687	9039	10614	8054	7300	10180	9775	7533	8493	8232	6208	5560	6680	5712	6808	7264	6971	5767	5826	6894	6389	5633	5144	6412	4607	4714	5589	5414	6825	6570	6279	5656	4396	5744	5297	5227	6107	4982	4461	4083	5008	4682	5937	6142	5325	4345	6731	3712	4549	4860	5504	5265	4723	4127	4829	5702	5656	6177	5363	5041	4585 ...
%         4952	5549	5720	6243	5436	4544	4402	5944	4656	5241	5833	5500	4512	4394	4730	4369	5285	5647	6327	6130	3922	4891	5021	4608	3448	2633	2385	3080	4295	4185	4871	5797	5746	5296	5280	5907	5060	5034	6278	5862	6565	6115	5662	4824	5246	5353	6486	6594	5832	6993	6294	7725	8892	8083	7465	9868	8189	8161	9944	12624	12990	12906	13737	14536	13668	15308	20574	18872	21095	21342	20694	20467	21807	24836	25830	27913	27233	29745	31189	34379	38391	38124	35094	36197	40427	47899	54517	56757	54000	51952	44721	34257	38325	33772	49509	49071	45416	38679	28228	45203	47791	43479	41168	37284	30738	22404	33900	35867	35764	39532	31753	26415	20709	32081	30625	24709	30788	28598	20813	17384	20741	15768	22053	20004	16744	12408	9604	19106	18671	16899	12618	10050	7427	5436	10534	10337	0	16752	6727	5403	4413	7201	6731	5990	5376	5001	3779	2577	4128	3948	3145	3835	3385	2234	1932	3263	2720	2881	2557	2137	1760	1390	2057	1954	1690	1624]';
% cana=[500	505	587	610	359	367	431	1472	581	624	726	465	535	1418	797	954	1167	1042	835	801	1855	1288	1099	1325	1450	1246	1411	2243	1669	1816	1821	2121	1801	1609	2908	2379	1859	2474	2531	2118	1600	1732	3420	2549	2271	2566	2027	1791	3269	2327	2698	2838	2649	2212	2046	4173	2718	2667	3012	3546	2358	2284	3595	4736	3311	3121	4536	3406	3152	6549	4499	3278	6177	4768	3361	3244	8139	4467	4516	4792	5003	4913	4667	6887	5286	5124	5728	5954	5621	5357	7921	5672	6397	6203	6460	6233	6272	7933	6197	6353	6705	6683	5900	5812	8560	6181	6538	7040	6700	6360	5806	7850	...
%     6272	6949	5698	400	1722	9798	10739	8876	7597	7115	714	4618	12056	14364	7341	7927	8173	9195	8398	6894	8879	6077	7180	7479	6899	6268	5866	6639	5201	5538	6234	5773	4949	4366	5921	4096	4301	4811	4825	3888	3829	4665	2945	3286	4099	3995	3254	3057	3924	2641	3247	3189	3446	3011	2020	1962	4158	2738	3397	3140	2577	2309	3997	2808	2934	3139	3216	2557	2216	3796	2705	2773	3042	3237	2402	2206	4483	2934	3085	3268	3575	2995	2628	4030	3016	3458	3694	4358	3377	3027	5153	3688	4039	5232	5223	4432	4052	6614	4971	5795	5818	4091	7241	4020	10553	7401 ...
%     7485	8247	9155	7213	7461	11196	7390	9175	9613	9314	7216	7645	10645	7300	6482	10769	8594	7105	6613	9279	7066	8112	9522	8148	7426	6888	8644	6710	7845	7797	7687	6634	6379	7516	5381	6576	6359	6170	5060	4714	5320	3833	5049	4702	4505	3540	3268	2889	3385	2576	2954	3104	2370	2084	2699	1614	2270	2186	2070	1389	1348	1643	1083	1616	1376	1396	1188	985	1246	855	1111	1091	995	820	596	978	534	726	733	628	434	389	1125	443	637	84	893	297	236	903	289	580	568	757	226	167	740	304	378	416	414	317	282	648	322	528	378	590	329	265	1075	559	796	904	935	368	273	223	2366	985	1532	1574	555	583	3226	1338	1971	2126	2464	858	... 
%     706	4438	1876	2522	2871	2972	887	833	6036	2387	3152	3508	3797	1269	1017	7418	2926	4022	4000	4268	1428	1381	1070	10376	3728	4267	4645	1757	1413	9682	3998	4475	4666	5094	1725	1673	9192	3742	4077	4605	4571	948	875	11692	3467	4328	3471	5643	1486	1199	8799]';
%   cana=[22	98	52	14	27	24	11	14	29	23	6	15	24	12	40	23	17	14	19	19	34	33	24	31	23	31	26	33	43	37	25	39	34	72	56	51	52	54	25	47	69	56	79	57	58	52	74	62	101	74	74	70	47	63	104	90	88	99	76	52	103	89	111	85	95	88	87	104	96	123	127	120	106	80	121	113	132	121	115	126	62	112	104	178	120	1	9	161	274	207	120	120	12	50	168	222	163	172	175	156	130	82	151	170	145	153	144	144	147	116	155	196	165	190	136	107	169	156	131	120	155	126	72	110	105	125	126	104	90	56	70	91	85	94	74	71	29	24	100	45	72	70	46	41	47	44	48	55	47	48	25	26	31	58	50	34	21	20	38	35	28	38	32	28	26	33	25	37	30	28	30	25	44	20	26	32	36	18	23	21	32	42	45	19	15	22	41	34	32	34	36	33	24	43	45	52	56	46	42	37	41	50	65	40	55	39	34	60	55	66	52	53	23	22	65	66	46	39	41	29	24	82	35	58	64	41	27	14	64	36	52	44	54	28	23	38	64	40	47	32	29	24	49	23	45	37	39	17	8	49	34	41	33	15	19	10	24	24	47	12	22	22	13	44	22	19	19	13	9	2	28	31	29	2	30	4	4	21	12	8	19	10	3	3	14	10	12	11	12	2	2	11	4	4	9	15	6	3	4	8	11	14	11	5	1	1	8	12	18	12	2	0	15	4	6	7	6	3	-1	9	13	51	15	15	-3	0	27	22	15	11	15	7	1	20	19	28	25	17	5	3	1	54	40	28	39	4	7	46	28	39	20	48	5	7	48	56	49	42	38	10	4	63	55	67	41	59	18	7	53]';
%  cana=[49	35	25	40	64	44	26	38	15	24	34	31	23	21	34	24	0	113	39	62	39	41	20	0	180	36	37	0	0	175	35	29	55	0	96	179	86	145	62	0	37	69	143	0	63	163	0	113	576	477	434	0	181	178	344	262	291	618	624	...
%         431	303	446	655	511	616	580	508	698	880	761	388	730	841	938	672	650	558	538	520	506	480	472	446	358	335	350	360	345	393	415	460	488	560	556	568	660	649	599	588	579	690	616	750	729	886	538	631	589	678	729	426	655	638	468	542	495	693	625 ...
%         799	471	659	735	678	587	655	699	745	839	883	723	1130	999	966	948	993	896	935	981	954	988	933	981	911	830	915	996	889	836	845	790	825	812	811	825	860	819	778	685	766	765	668	658	671	560	577	583	591	588	522	556	508	499	486	455	423	598	...
%         588	593	556	593	533	519	493	496	410	466	428	423	411	401	438	408	439	455	416	491	422	461	528	511	596	589	660	658	662	629	657	653	693	698	648	612	622	628	637	638	822	816	830	839	866	881	978	232]';
  %VN
V=[	4	6	9	12	12	6	3	10	9	5	8	45	18	14	20	23	10	35	60	47	108	167	77	82	87	82	76	296	100	147	153	208	89 ...
        132	178	156	129	527	155	270	40	512	199	325	193	245	193	301	216	211	236	195	413	200	213	289	293	251	423	490	356	358	470	280	272	252	207	334	214	788	415	396	371	545	675	394	1189	951	1051	1029	1044	1425	1798	1862	2008	2187	2744	2830	4049	4004	4710	4843	4335	5427	5537	7125	8688	7956	6260	5174	10774	6519	9765	7717	8938	7447	7445	16954	7295	7310	4315	12275	9904	9334	8043	8606	5025	9180	9716	9580	8652	9605	8800	10510	10657	13439 ...
        11352	10397	10811	12096	11575	17428	12103	12796	14224	12607	11434	13197	14922	9521	13137	12481	14208	12680	12420	13321	11932	12026	11172	10508	10585	10489	11521	9373	10040	8681	11692	11527	9472	8537	9706	10011	9362	4589	8758	11357	6957]';

%   h=round(80*length(cana)/100);
% V=cana(1:h,:);
% 
% 
% test=cana(h+1:end,:);
T = ((V(2:end,:)-(V(1:end-1,:)))./V(1:end-1,:))*100;
% chuanhoa=chuanhoa';
difference=T(2:end,:)-T(1:end-1,:);
% k=9
%======Phan tich chum===
% [du s]=fcm(difference,k);
Zluu=[];
l=1;
zt=difference;
d = pdist2(zt,zt,'euclidean');
d1=triu(d,1);
cn=(size(zt,1)*(size(zt,1)-1))/2;
mu=(sum(sum(d1)))/(cn);
for i=1:size(zt,1)
   for j=1:size(zt,1)
     tong(i,j)=(d(i,j)-mu).^2;
    end
end
tt=triu(tong,1);
sigma=((sum(sum(tt)))/cn)^0.5;
f=[];
alp=ones(size(zt,1),size(zt,1));
for i=1:size(zt,1)
for j=1:size(zt,1)
    if d(i,j)>mu*alp(i,j)
       f(i,j)=0;
    else
       f(i,j)=exp(-d(i,j)/(sigma/l)); 
    end
end
end
for i=1:size(zt,1)
tu=0;
mau=0;
for j=1:size(zt,1)
    tu=tu+zt(j,:)*f(i,j);
    mau=mau+f(i,j);
end
ztmoi(i,:)=tu./mau;
end
ztmoi;
iter=0;
Zluu=[];
exilanh=0.001;
while max(max(abs(ztmoi-zt)))>exilanh 
    
    zt=ztmoi;
   iter=iter+1
%     
d=[];
% for i=1:size(zt,1)
% for j=1:size(zt,1)
% %    d(i,j)=(max(OLIDmain(zt(i,1:2),zt(j,1:2)),OLIDmain(zt(j,1:2),zt(i,1:2)))+max(OLIDmain(zt(i,3:4),zt(j,3:4)),OLIDmain(zt(j,3:4),zt(i,3:4))));
%  d(i,j)=hausdorff(zt(i,:),zt(j,:));
% %  d(i,j)=cityblock(zt(i,:),zt(j,:));
% end
% end
 d = pdist2(zt,zt,'euclidean');
d;
d1=triu(d,1);
cn=(size(zt,1)*(size(zt,1)-1))/2;
mu=(sum(sum(d1)))/(cn);
tong=[];
for i=1:size(zt,1)
    for j=1:size(zt,1)
      tong(i,j)=(d(i,j)-mu).^2;
    end
end
tt=triu(tong,1);
sigma=((sum(sum(tt)))/cn)^0.5;
alp=alpha1(alp,f);
f=[];
for i=1:size(zt,1)
for j=1:size(zt,1)
     if d(i,j)>mu*alp(i,j)
       f(i,j)=0;  
     else
        f(i,j)=exp(-d(i,j)/(sigma/l)); 
    end
end
end
f;
for i=1:size(zt,1)
    tu=0;
    mau=0;
    for j=1:size(zt,1)
        tu=tu+zt(j,:)*f(i,j);
        mau=mau+f(i,j);
    end
  ztmoi(i,:)=tu/mau;
end
ztmoi;
Zluu=[Zluu ztmoi];
end
% for i=1:length(ztmoi)
%     plot(1:iter,Zluu(i,:),'-o')
%     hold on 
%     title('The convergent plot of the AC algorithm')
% xlabel('The number of iteration')
% ylabel('The values')
% %legend('cluster 1','cluster 2','cluster 3','cluster 4','cluster 5')
% end
%==main===
% ztmoi=difference;
k=11;
[u,du]=kmeans(ztmoi,k);
%====du bao====
c=sort(du);
U1(1,:)=[c(1)-((c(2)-c(1))./2),(c(1)+c(2))./2];
Uk(k,:)=[(c(end-1)+c(end))/2, c(end)+(c(end)-c(end-1))/2];

for i=2:length(c)-1
    U(i,:)=[(c(i-1)+c(i))./2, (c(i)+c(i+1))./2];
end

Umoi=[U1;U(2:end,:);Uk(end,:)]

% for m=1:length(T)
for i=1:length(difference)
    for j=1:k
if Umoi(j,1)<difference(i,:)&& difference(i,:)<Umoi(j,2)
%    Uh(i,:) = Umoi(j,20)
    Tong(i)=0.001/((0.0001/T(i))+ 1/(Umoi(j,2)+T(i)));
%     tt(i)=(Umoi(j,2)+T(i))
%     rr(m)=Umoi(j,1)
end
    end
end
% end
% one=ones(1,length(Tong))';
G=Tong';
F=V(3:end)+ (V(3:end).*G./100);
%===gia tri moi===
for j=1:k
    if Umoi(j,1)<difference(end,:) && difference(end,:)<Umoi(j,2)
        %    Uh(i,:) = Umoi(j,2)
        TL=.05/((0.0001/T(end))+ 1/(Umoi(j,2)+T(end)));
        %     tt(i)=(Umoi(j,2)+T(i))
        %     rr(m)=Umoi(j,1)
    end
end
Vnew=V(end)+ (V(end)*TL/100);
Fn=[V(end) ; Vnew];
Tnew=T(end); 
T=[];
 Vn=[];
for t=1:10
    Vn=[Vn; Fn];
    T=[T; Tnew];
    [Fn, Tnew]=forecasting(Vn(end-1),Umoi,Vn(end),T(end))
    
end 

Vn;
 hg=[F;Vn];
% MAPE=mean((abs(test-Vn)./test)*100)
% 
% %MSE=mean((F(1:end,:)-V(3:end,:)).^2)
% 
% MAE=mean(abs(abs(test-Vn)))
% % MAPE=mean((abs(V(3:end,:)-F)./V(3:end,:))*100)
 figure
 x=[1:length(V)];
 y=[3:length(V)+length(Vn)]
% % y=[1:25 ];
plot(x,V','Color','red','LineStyle','-','linewidth',3)
hold on
plot(y,hg','Color','blue','LineStyle','--','linewidth',2)
xlabel('Date')
ylabel('Value')
legend('Actual value','Forecasting')

