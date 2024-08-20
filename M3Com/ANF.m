clc
clear all
% filename = 'M3C.csv';
% Yearly_test = csvread(filename,0,0);
load M3C.mat
data=M3C;
testdata=[];
 for h=1:645% 646: (646+755)
     ztmoi=[];
   % V=   data(h,:);
    V=data(~isnan(data(h,:)))';
   
%     V= nonzeros(V);
% test=cana(h+1:end,:);
T = ((V(2:end,:)-(V(1:end-1,:)))./V(1:end-1,:))*100;
% chuanhoa=chuanhoa';
difference=T(2:end,:)-T(1:end-1,:);
% k=9
%======Phan tich chum===
% [du s]=fcm(difference,k);
% Zluu=[];
l=5;
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
ztmoi;
iter=0;
% Zluu=[];
exilanh=0.001;
while max(max(abs(ztmoi-zt)))> 0.001
    
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
k=8;
[u,du]=kmeans(ztmoi,k);
%====du bao====
c=sort(du);
U1(1,:)=[c(1)-((c(2)-c(1))./2),(c(1)+c(2))./2];
Uk(k,:)=[(c(end-1)+c(end))/2, c(end)+(c(end)-c(end-1))/2];

for i=2:length(c)-1
    U(i,:)=[(c(i-1)+c(i))./2, (c(i)+c(i+1))./2];
end

Umoi=[U1;U(2:end,:);Uk(end,:)];
% Tong=0;
% for m=1:length(T)
for i=1:length(difference)
    for j=1:k
    if Umoi(j,1)<difference(i,:)&& difference(i,:)<Umoi(j,2)
    %    Uh(i,:) = Umoi(j,20)
        Tong(i)=0.5/((0.0001/T(i))+ 1/(Umoi(j,2)+T(i)));
    %     tt(i)=(Umoi(j,2)+T(i))
    %     rr(m)=Umoi(j,1)
    end
    end
end
Tong;
% end
% one=ones(1,length(Tong))';
G=Tong';
c=length(V)-length(G);
F=V(c+1:end)+ (V(c+1:end).*G./100);
 G=[];
% %===gia tri moi===
for j=1:k
    if Umoi(j,1)<difference(end,:) && difference(end,:)<Umoi(j,2)
        %    Uh(i,:) = Umoi(j,2)
        TL=0.5/((0.0001/T(end))+ 1/(Umoi(j,2)+T(end)));
        %     tt(i)=(Umoi(j,2)+T(i))
        %     rr(m)=Umoi(j,1)
    end
end
Vnew=V(end)+ (V(end).*TL/100);
%=================

    Fn=[F; Vnew];
    
    Vn=[];
    for t=1:6
        [Fn1, Tnew]=forecasting(Fn(end-1),Umoi,Fn(end),T(end));
        T=[T; Tnew];
        Vn=[Vn, Fn1];
    end 
% 
Vn=Vn';
% dubao=[F',Vn'];
testdata=[testdata; Vn(:,[end-5:end])];
 end
 
 load Quart756
for i=1:size(testdata,1)-1
KQDB=testdata(i,:);
thucte=Quart756(i,:);
SMAPE(i,:)=mean((abs(KQDB-thucte)/(abs(KQDB)+abs(thucte)/2))*100);
end
ESMAPE=mean(SMAPE)
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

