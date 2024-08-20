function [Fn, T]=forecasting(V,Umoi,Vsau,Tcu)
TL=[];
T = ((Vsau-V)./V)*100;
difference=T-Tcu;
for j=1:size(Umoi,1)
    if difference>Umoi(j,1)&& difference<Umoi(j,2)
    %    Uh(i,:) = Umoi(j,2)
        TL= 0.0005/((0.0001/T)+1/(Umoi(j,1)+T));
    else
        TL=0;
    end
end
Fn=V+(V*TL/100);
% end