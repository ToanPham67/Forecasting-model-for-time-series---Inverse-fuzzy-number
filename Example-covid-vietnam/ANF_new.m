clc
clear all
%enrolment
%  V=[13055; 13563; 13867; 14696; 15460; 15311; 15603; 15861; 16807; 16919; 16388; 15433; 15497; 15145; 15163; 15984; 16859; 18150; 18970; 19328; 19337; 18876];
%Outpatient    
%  V=[6519; 5979; 6322; 5666; 5318; 5364; 5513; 5895; 6682; 6254; 5681; 6012; 5920; 5512; 6548; 5987; 5638; 5851; 5514; 5395; 5598; 5284; 4545; 4624];

% V=[10648.51; 10581.84; 10609.06; 10639.64; 10704.48; 10718.85; 10617.32; 10597.74; 10595.3; 10769.32; 10760.75; 10932.33; 10883.09; 11035.7; 11003.89; 11089.52; 10995.63; 11008.17; 10988.91; 10947.92; 10877.81; 10998.39; 11039.06; 11286.18; 11225.01; 11106.65; 11068.12];
% VN=[14	20	23	10	35	60	47	108	167	77	82	87	82	76	296	100	147	153	208	89 ...
        132	178	156	129	527	155	270	40	512	199	325	193	245	193	301	216	211	236	195	413	200	213	289	293	251	423	490	356	358	470	280	272	252	207	334	214	788	415	396	371	545	675	394	1189	951	1051	1029	1044	1425	1798	1862	2008	2187	2744	2830	4049	4004	4710	4843	4335	5427	5537	7125	8688	7956	6260	5174	10774	6519	9765	7717	8938	7447	7445	16954	7295	7310	4315	12275	9904	9334	8043	8606	5025	9180	9716	9580	8652	9605	8800	10510	10657	13439 ...
        11352	10397	10811	12096	11575	17428	12103	12796	14224	12607	11434	13197	14922	9521	13137	12481	14208	12680	12420	13321	11932	12026	11172	10508	10585	10489	11521	9373	10040	8681	11692	11527	9472	8537	9706	10011	9362	4589	8758	11357]';
VN=[	4	6	9	12	12	6	3	10	9	5	8	45	18	14	20	23	10	35	60	47	108	167	77	82	87	82	76	296	100	147	153	208	89 ...
        132	178	156	129	527	155	270	40	512	199	325	193	245	193	301	216	211	236	195	413	200	213	289	293	251	423	490	356	358	470	280	272	252	207	334	214	788	415	396	371	545	675	394	1189	951	1051	1029	1044	1425	1798	1862	2008	2187	2744	2830	4049	4004	4710	4843	4335	5427	5537	7125	8688	7956	6260	5174	10774	6519	9765	7717	8938	7447	7445	16954	7295	7310	4315	12275	9904	9334	8043	8606	5025	9180	9716	9580	8652	9605	8800	10510	10657	13439 ...
        11352	10397	10811	12096	11575	17428	12103	12796	14224	12607	11434	13197	14922	9521	13137	12481	14208	12680	12420	13321	11932	12026	11172	10508	10585	10489	11521	9373	10040	8681	11692	11527	9472	8537	9706	10011	9362	4589	8758	11357	6957]';

h=round(80*length(VN)/100);
V=VN(1:h,:);
test=VN(h+1:end,:);
T = ((V(2:end,:)-(V(1:end-1,:)))./V(1:end-1,:))*100;
% chuanhoa=chuanhoa';
difference=T(2:end,:)-T(1:end-1,:);
% k=9
%======Phan tich chum===
% [du s]=fcm(difference,k);
l=1;
zt=difference;
  d = pdist2(zt,zt,'euclidean');
d;%khoang cach d
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
f;
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
exilanh=0.01
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
%==========tinh mu=====================
d1=triu(d,1);
cn=(size(zt,1)*(size(zt,1)-1))/2;
mu=(sum(sum(d1)))/(cn);
tong=[];
%================tinh sigma============
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
datave=Zluu';
kq=ztmoi
% % for i=1:22
% %     plot(1:iter,Zluu(i,:),'-o')
% %     hold on 
% %     title('The convergent plot of the AC algorithm')
% % xlabel('The number of iteration')
% % ylabel('The values')
% % legend('cluster 1','cluster 2','cluster 3','cluster 4','cluster 5')
% % end
k=5;
[u,du]=kmeans(ztmoi,k);
%====du bao====
c=sort(du);
U1(1,:)=[c(1)-((c(2)-c(1))./2),(c(1)+c(2))./2];
Uk(k,:)=[(c(end-1)+c(end))/2, c(end)+(c(end)-c(end-1))/2];

for i=2:length(c)-1
    
    U(i,:)=[(c(i-1)+c(i))./2, (c(i)+c(i+1))./2];
end

Umoi=[U1;U(2:end,:);Uk(end,:)]

for i=1:length(difference)
    for j=1:k
        if Umoi(j,1)<difference(i,:)&& difference(i,:)<Umoi(j,2)
            F(i+1,1)=1.35/((0.0001/T(i+1))+ 1/(Umoi(j,2)+T(i+1)));

        end
    end
end
G=F';
for i=3:length(F)
    Fnew(i,1)=V(i,1).*(1+ (F(i,1)/100));
end
%% Tinh du bao

%  F=V(3:end)+ (V(3:end).*G/100)
% for j=1:k
% if Umoi(j,1)<difference(i,:)&& difference(end,:)<Umoi(j,2)
% %    Uh(i,:) = Umoi(j,2)
%     TL(i,1)=0.5/((0.0001/T(end))+ 1/(Umoi(j,2)+T(end)));
% %     tt(i)=(Umoi(j,2)+T(i))
% % %     rr(m)=Umoi(j,1)
% end
% end
dif=difference(end);
Fne = forecasting(V(end),dif,Umoi,T(end));
Fnew=[Fnew; Fne];
MAPE=mean((abs(Fnew(3:end,:)-V(3:end,:))./V(3:end,:))*100)

MSE=mean((Fnew(3:end,:)-V(3:end,:)).^2)

MAE=mean(abs(Fnew(3:end,:)-V(3:end,:)))
KQ=Fnew(3:end,:)';
thucte=V(3:end,:)';
SMAPE=mean((abs(KQ-thucte)/(abs(KQ)+abs(thucte)/2))*100)

% % figure
% % % datetick('x','mmm-yy','keeplimits')
% % x=[1:24 ];
% % plot(x,V','Color','red','LineStyle','--','linewidth',3)
% % hold on
% % plot([3:24],Fnew([3:24],1)','Color','blue','LineStyle','-.','linewidth',2)
% % xlabel('Month')
% % ylabel('Value')
% % legend('Actual value','Forecasting')
% 
