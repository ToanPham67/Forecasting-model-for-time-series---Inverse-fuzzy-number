function [loop, vnew, voptml] = SNC(V,lamda)

 vtest = V;
    
  v0 = V;
    
  lamda = lamda;
    
  epxilanh = 0.001;
    
  loop = 0;
    
   while(true)
    
    d = squareform(pdist(vtest, 'euclide'));
        
      ds = (sum(sum(d))/(length(d)*length(d)-length(d)));
        
    for i=1:length(d)
        
        for j=1:length(d)
            
             if d(i,j) > ds
                
                  klamda(i,j)=exp(-d(i,j)/(ds/lamda));
                    
            else
                
          klamda(i,j)=0;
                    
        end
                
          end
            
     end
        
    KT = size(vtest);
        
     for l = 1:KT(1,2)
        
     for i = 1:length(d)
            
       numer = 0;
                
      denom = 0;
                
       for j = 1:length(d)
                
    numer = numer + vtest(j,l)*klamda(i,j);
                    
         denom = denom + klamda(i,j);
                    
   end
                
     vnew(i,l) = numer/denom;
                
      end
            
   end
        
   if (max(abs(vnew-vtest)) < epxilanh)
        
       break
            
  end
        
   vtest = vnew;
        
   loop = loop + 1;
        
   voptml(:,loop) = vnew;
        
  end
    
end
