function[x,n]= s_esxponencial(a, ni, nf)
    n=[ni,nf];
    x=[(a^n)>=0];
    x=x.*(a^n);
end