function [evector, eval] = PowerMethod(A, v0)
%Function takes a matrix A and a initial vector(not transpose version)
 x1 = v0';  %Takes the transpose of the initial guess vector

for i = 1:5
    
    y1 = A*x1;
    [max1, index] = max(abs(y1)); %Finds max entry
    max1 = max1 * sign(y1(index));
    x1 = y1 / max1; %For simplification
    
end
eval = max1;    %eigenvalue
evector = x1;   %eigenvector
display(eval);

%[V,D] = eig(A);
%V1 = -1*V(:,1) / max(V(:,1));
%V2 = V(:,3) / max(V(:,3));

%display(V);
%display(V1);
%display(V2);
%display(D);

end




