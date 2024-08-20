clc
clear all
% filename = 'Quarterly-train.csv'; % Replace with the actual path and name of your Excel file
% % 
% % % Read the data from the Excel file
% data = csvread(filename, 0, 0);% 
% save('Quarterly-train.mat',data);
% load Yearlytraining
% data=Yearly;
%lahi
data=[1025; 512; 1005; 852; 440; 502; 775; 465; 795; 970; 742; 635; 994;];
%Taifex
% data=[7552; 7560; 7487; 7462; 7515; 7365; 7360; 7330; 7291; 7320; 7300; 7219; 7220; 7285; 7274; 7225; 6955; 6949; 6790; 6835; 6695; 6728; 6566; 6409
% 6430; 6200; 6403.2; ];
% Enrolment
% data=[13055; 13563; 13867; 14696; 15460; 15311; 15603; 15861; 16807; 16919; 16388; 15433; 15497; 15145; 15163; 15984;];
%NUSE
%data=[10648.51; 10581.84; 10609.06; 10639.64; 10704.48; 10718.85; 10617.32; 10597.74; 10595.3; 10769.32; 10760.75; 10932.33; 10883.09; 11035.7; 11003.89; 11089.52; 10995.63; 11008.17; 10988.91; 10947.92; 10877.81; 10998.39; 11039.06; 11286.18;];
% testdata=[];
%  for h=1:645 % size(data,2)
%      ztmoi=[];
     Fn=[];
%      da=data(h,:);
%      NA=isnan(da)';
V = data;
T = ((V(2:end,:)-(V(1:end-1,:)))./V(1:end-1,:))*100;
difference=T(2:end,:)-T(1:end-1,:);
%  k=9
%======Phan tich chum===
% [Umoi, s]=fcm(difference,k);
% l=1;
% tong=[];
% zt=difference;
% d = pdist2(zt,zt,'euclidean');
% d1=triu(d,1);
% cn=(size(zt,1)*(size(zt,1)-1))/2;
% mu=(sum(sum(d1)))/(cn);
% for i=1:size(zt,1)
%    for j=1:size(zt,1)
%      tong(i,j)=(d(i,j)-mu).^2;
%     end
% end
% tt=triu(tong,1);
% sigma=((sum(sum(tt)))/cn)^0.5;
% f=[];
% alp=ones(size(zt,1),size(zt,1));
% for i=1:size(zt,1)
% for j=1:size(zt,1)
%     if d(i,j)>mu*alp(i,j)
%        f(i,j)=0;
%     else
%        f(i,j)=exp(-d(i,j)/(sigma/l)); 
%     end
% end
% end
% for i=1:size(zt,1)
% tu=0;
% mau=0;
% for j=1:size(zt,1)
%     tu=tu+zt(j,:)*f(i,j);
%     mau=mau+f(i,j);
% end
% ztmoi(i,:)=tu./mau;
% end
% % ztmoi;
% iter=0;
% exilanh=0.001;
% while max(max(abs(ztmoi-zt)))>exilanh 
%     
%     zt=ztmoi;
%    iter=iter+1;
% %     
% d=[];
% % for i=1:size(zt,1)
% % for j=1:size(zt,1)
% % %    d(i,j)=(max(OLIDmain(zt(i,1:2),zt(j,1:2)),OLIDmain(zt(j,1:2),zt(i,1:2)))+max(OLIDmain(zt(i,3:4),zt(j,3:4)),OLIDmain(zt(j,3:4),zt(i,3:4))));
% %  d(i,j)=hausdorff(zt(i,:),zt(j,:));
% % %  d(i,j)=cityblock(zt(i,:),zt(j,:));
% % end
% % end
%  d = pdist2(zt,zt,'euclidean');
% d;
% d1=triu(d,1);
% cn=(size(zt,1)*(size(zt,1)-1))/2;
% mu=(sum(sum(d1)))/(cn);
% tong=[];
% for i=1:size(zt,1)
%     for j=1:size(zt,1)
%       tong(i,j)=(d(i,j)-mu).^2;
%     end
% end
% tt=triu(tong,1);
% sigma=((sum(sum(tt)))/cn)^0.5;
% alp=alpha1(alp,f);
% f=[];
% for i=1:size(zt,1)
% for j=1:size(zt,1)
%      if d(i,j)>mu*alp(i,j)
%        f(i,j)=0;  
%      else
%         f(i,j)=exp(-d(i,j)/(sigma/l)); 
%     end
% end
% end
% f;
% for i=1:size(zt,1)
%     tu=0;
%     mau=0;
%     for j=1:size(zt,1)
%         tu=tu+zt(j,:)*f(i,j);
%         mau=mau+f(i,j);
%     end
%   ztmoi(i,:)=tu/mau;
% end
% % ztmoi;
% % Zluu=[Zluu ztmoi];
% end
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
 k=2;
 [u,du]=kmeans(difference,k);
%====du bao====
c=sort(du);
U1(1,:)=[c(1)-((c(2)-c(1))./2),(c(1)+c(2))./2];
Uk(k,:)=[(c(end-1)+c(end))/2, c(end)+(c(end)-c(end-1))/2];

% for i=2:length(c)-1
%     U(i,:)=[(c(i-1)+c(i))./2, (c(i)+c(i+1))./2];
% end

Umoi=[U1;Uk(end,:)]; %U(2:end,:);

% for m=1:length(T)
for i=1:length(difference)
    for j=1:k
    if Umoi(j,1)<difference(i,:)&& difference(i,:)<Umoi(j,2)
        Tong(i)=0.005/((0.0001/T(i))+ 1/(Umoi(j,1)+T(i)));
%     else 
%         Tong(i)=0;
    end
    end
end
G=Tong';
c=length(V)-length(G);
F=V(c+1:end)+ (V(c+1:end).*G./100);
%  G=[];
Tong=[];
%===gia tri moi===
for j=1:k
    if Umoi(j,1)<difference(end,:) && difference(end,:)<Umoi(j,2)
        TL=0.005/((0.0001/T(end))+ 1/(Umoi(j,1)+T(end)));
    else 
        TL=0;
    end
end
Vnew=V(end)+(V(end).*TL/100);
 Fn=[F(end) ; Vnew];
    for t=1:3
        [Fn1, Tnew]=forecasting(Fn(end-1),Umoi,Fn(end),T(end));
        T=[T; Tnew];
        Fn=[Fn;Fn1];
    end 
%     Fn=Fn';
%     testdata=[testdata; Fn];
%  end
% save('testdata.mat','testdata')
% load testdata
% % load Yearlytest
%lahi
test=[ 759; 883; 599; 499; 590]';

%TAIFEX_TEST
% test=[6697.5; 6722.3; 6859.4; 6769.6; 6709.75; 6726.5; 6774.55; 6762; 6952.75; 6906; 6842]';

%ENRONMENT TEST
% test=[16859; 18150; 18970; 19328; 19337; 18876]';
%NYSE
%test=[11225.01; 11106.65; 11068.12;11134.79; 11224.7; 11192.59; 11160.17; 11225.32; 11244.89; 11257.43]';
KQDB=Fn';
thucte=test;
SMAPE=mean((abs(KQDB-thucte)/((KQDB+thucte)/2))*100)
% %  ESMAPE=mean(SMAPE)
% MAPE=mean((abs(test-Vn)./test)*100)
% 
% %MSE=mean((F(1:end,:)-V(3:end,:)).^2)
% 
% MAE=mean(abs(abs(test-Vn)))
% % MAPE=mean((abs(V(3:end,:)-F)./V(3:end,:))*100)
%  figure
%  x=[1:length(V)];
%  y=[3:length(V)+length(Vn)]
% % % y=[1:25 ];
% plot(x,V','Color','red','LineStyle','-','linewidth',3)
% hold on
% plot(y,hg','Color','blue','LineStyle','--','linewidth',2)
% xlabel('Date')
% ylabel('Value')
% legend('Actual value','Forecasting')

