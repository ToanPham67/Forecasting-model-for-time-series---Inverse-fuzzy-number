clc
clear all
% filename = 'Hourly-train.csv';  ESMAPE=(11.8261+7.9893+10.6260+19.025+7.324+8.125)/6
% data = csvread(filename);
load hourly-train.mat
testdata=[];
 for h=1:size(data,1)
     ztmoi=[];
    V=data(h,:);
    V= nonzeros(V);
% test=cana(h+1:end,:);
T = ((V(2:end,:)-(V(1:end-1,:)))./V(1:end-1,:))*100;
% chuanhoa=chuanhoa';
difference=T(2:end,:)-T(1:end-1,:);
% k=9
%======Phan tich chum===
% [du s]=fcm(difference,k);
Zluu=[];
l=1;
tong=[];
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
% ztmoi;
iter=0;
% Zluu=[];
exilanh=0.001;
while max(max(abs(ztmoi-zt)))>exilanh 
    
    zt=ztmoi;
   iter=iter+1;
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
% d;
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
% f;
for i=1:size(zt,1)
    tu=0;
    mau=0;
    for j=1:size(zt,1)
        tu=tu+zt(j,:)*f(i,j);
        mau=mau+f(i,j);
    end
  ztmoi(i,:)=tu/mau;
end
% ztmoi;
% Zluu=[Zluu ztmoi];
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
k=10;
[u,du]=kmeans(ztmoi,k);
%====du bao====
c=sort(du);
U1(1,:)=[c(1)-((c(2)-c(1))./2),(c(1)+c(2))./2];
Uk(k,:)=[(c(end-1)+c(end))/2, c(end)+(c(end)-c(end-1))/2];

for i=2:length(c)-1
    U(i,:)=[(c(i-1)+c(i))./2, (c(i)+c(i+1))./2];
end

Umoi=[U1;U(2:end,:);Uk(end,:)];

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
c=length(V)-length(G);
F=V(c+1:end)+ (V(c+1:end).*G./100);
 G=[];
 Tong=[];
TL=0;
%===gia tri moi===
for j=1:k
    if Umoi(j,1)<difference(end,:) && difference(end,:)<Umoi(j,2)
        %    Uh(i,:) = Umoi(j,2)
        TL=TL+.001/((0.0001/T(end))+ 1/(Umoi(j,2)+T(end)));
        %     tt(i)=(Umoi(j,2)+T(i))
        %     rr(m)=Umoi(j,1)
    end
end

Vnew=V(end)+ (V(end).*TL/100);
 Fn=[V(end) ; Vnew];
Tnew=T(end); 
T=[];
 Vn=[];
for t=1:48
     Vn=[Vn; Fn];
    T=[T; Tnew];
    [Fn, Tnew]=forecasting(Vn(end-1),Umoi,Vn(end),T(end));
   
end 
% 
Vn=Vn';
% dubao=[F',Vn'];
testdata=[testdata; Vn(:,[1:48])];
 end
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

