function [F K] = FCM(Z,U)
    Z = Z';
    epsilon = 0.001;
    vl = 0;
    while(true)
        p = size(Z);
        n = p(1,1);
        N = p(1,2);
        q = size(U);
        c = q(1,1);
        for k = 1:n
            for i = 1:c
                numer = 0;
                denom = 0;
                for j = 1:N
                    numer = numer + (U(i,j).^2)*Z(k,j);
                    denom = denom + U(i,j).^2;
                end
                v(k,i)=numer/denom;
            end
        end
        for j=1:N
            for i=1:c
                d2(i,j)=0;
                for k=1:n
                    d2(i,j) = d2(i,j) + (v(k,i) - Z(k,j)).^2;
                end
            end
        end
        for j = 1:N
            m=0;
            for k = 1:c
                if d2(k,j) == 0
                    m = m+1;
                end
            end
            if m == 0
                for i =1:c
                    sum=0;
                    for k=1:c
                        sum = sum + d2(i,j)/d2(k,j);
                    end
                    Unew(i,j)=1/sum;
                end
            else
                for l=1:c
                    if d2(l,j) == 0
                        Unew(l,j) = 1/m;
                    else
                        Unew(l,j)=0;
                    end
                end
            end
        end
        Unew;
        standard=0;
        for i=1:c
            for j=1:N
                lech(i,j)=abs(Unew(i,j)-U(i,j));
                if lech(i,j) > standard
                    standard = lech(i,j);
                end
            end
        end
        if(standard < epsilon)
            break;
        end
        U = Unew;
        vl = vl + 1;
    end
    F = Unew;
    K = vl;
end