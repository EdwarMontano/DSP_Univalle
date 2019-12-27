function [ C ] = MatrizDCT(N)
% Calcula la Matriz C normalizada para calcular la DCT
% C es de tamaño NxN
    C=zeros(N,N); %Crea matriz NxN
    a=sqrt(2/N)*ones(1,N);a(1)=sqrt(1/N);
    for m=0:N-1
        for k=0:N-1
            ang=(m+0.5)*pi*k/(N);
            C(m+1,k+1)=a(k+1)*cos(ang);
        end
    end
end

