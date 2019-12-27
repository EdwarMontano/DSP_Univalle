function[x,n]= s_rampa(D, ni, nf)
   n=[ni:nf]    
   x=[(n-D)>=0];
   x=x.*(n-D);    
end

%x=x.*(n-D); COMO SE EXPLICA ???