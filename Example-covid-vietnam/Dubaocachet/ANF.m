clc
clear all
% so nguoi chet hang ngay
% V=[2	1	1	1	0	1	1	1	0	0	0	1	1	0	2	2	0	0	2	0	0	2	1	1	0	2	0	0	1	2	2	3	0	1	2	2	0	2	2	2	1	0	3	0	2	4	7	5	2	6	2	7	6	7	6	69	18	0	29	80	0	36	0	0	0	0	154	0	106	392	139	145	0	0	765	256	393	296	234	147	360	388	342	326	275	349	337	367	331	298	380	390	0	737	389	348	335	318	386	352	344	315	0	804	270	308	347	281	311	316	434	335	275	273	261	381	276	250	239	212	220	233	215	240	236	236	203	180	184	174	178	162	203	136	164]';
cana=[	4	6	9	12	12	6	3	10	9	5	8	45	18	14	20	23	10	35	60	47	108	167	77	82	87	82	76	296	100	147	153	208	89 ...
        132	178	156	129	527	155	270	40	512	199	325	193	245	193	301	216	211	236	195	413	200	213	289	293	251	423	490	356	358	470	280	272	252	207	334	214	788	415	396	371	545	675	394	1189	951	1051	1029	1044	1425	1798	1862	2008	2187	2744	2830	4049	4004	4710	4843	4335	5427	5537	7125	8688	7956	6260	5174	10774	6519	9765	7717	8938	7447	7445	16954	7295	7310	4315	12275	9904	9334	8043	8606	5025	9180	9716	9580	8652	9605	8800	10510	10657	13439 ...
        11352	10397	10811	12096	11575	17428	12103	12796	14224	12607	11434	13197	14922	9521	13137	12481	14208	12680	12420	13321	11932	12026	11172	10508	10585	10489	11521	9373	10040	8681	11692	11527	9472	8537	9706	10011	9362	4589	8758	11357	6957]';

   h=round(80*length(cana)/100);
 V=cana(1:h,:); 
 test=cana(h+1:end,:);
T = ((V(2:end,:)-(V(1:end-1,:)))./V(1:end-1,:))*100;
T(isinf(T)|isnan(T)) = 0
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
k=6;
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
for i=2:length(difference)
    for j=1:k
if Umoi(j,1)<difference(i,:)&& difference(i,:)<Umoi(j,2)
%    Uh(i,:) = Umoi(j,20)
    Tong(i)=0.022/((0.0001/T(i))+ 1/(Umoi(j,2)+T(i)));
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
        TL=.022/((0.0001/T(end))+ 1/(Umoi(j,2)+T(end)));
        %     tt(i)=(Umoi(j,2)+T(i))
        %     rr(m)=Umoi(j,1)
    end
end
Vnew=V(end)+ (V(end)*TL/100);
Fn=[V(end);Vnew];
Tnew=T(end); 
T=[];
 Vn=[];
for t=1:32
    Vn=[Vn; Fn];
    T=[T; Tnew];
    [Fn, Tnew]=forecasting(Vn(end-1),Umoi,Vn(end),T(end))
end
Vn;
 hg=[F;Vn];
MAPE=mean((abs(test-Vn)./test)*100)
MSE=mean((F(1:end,:)-V(3:end,:)).^2)
MAE=mean(abs(abs(test-Vn)))
% % MAPE=mean((abs(V(3:end,:)-F)./V(3:end,:))*100)
 figure
 x=[1:length(V)];
 y=[3:length(V)+length(Vn)]
% % y=[1:25 ];
% plot(x,V','Color','red','LineStyle','-','linewidth',3)
% hold on
% plot(y,hg','Color','blue','LineStyle','--','linewidth',2)
% xlabel('Date')
% ylabel('No. deaths')
% legend('Actual value','Proposed algorithm ')
% % % ts1 = timeseries(V,x);
% % % ts1.Name = 'Daily Count';
% % % ts1.TimeInfo.Units = 'days';
% % % ts1.TimeInfo.StartDate = '21-May-2021';     
% % % ts1.TimeInfo.Format = 'mmm dd, yy';               
% % % plot(ts1,'b-','linewidth',2)
% % % hold on
% % % ts2 = timeseries(hg,y);
% % % ts2.Name = 'Daily Count';
% % % ts2.TimeInfo.Units = 'days';
% % % ts2.TimeInfo.StartDate = '21-May-2021';    
% % % ts2.TimeInfo.Format = 'mmm dd, yy';       
% % % plot(ts2,'r--','linewidth',2)
% % % xlabel('Date')
% % % ylabel('Number of Infected People')
% % % legend('Actual value','Proposed algorithm ')
% % % hold off
