filename = 'durer';
myVars = {'X','caption'};
S(1) = load(filename,myVars{:});

filename = 'mandrill';
myVars = {'X','caption'};
S(2) = load(filename,myVars{:});

colormap(gray);
%image(S(1).X);
%image(S(2).X);

[U1,S1,V1]=svd(S(1).X);
[U2,S2,V2]=svd(S(2).X);

for i=1:6
    r = 2^i;
    % Stores the all singular values
    temp1 = S1;
    temp2 = S2;
    
    % Discards the not required diagonal values
    temp1(r+1:end,:)=0;
    temp1(:,r+1:end)=0;
    
    temp2(r+1:end,:)=0;
    temp2(:,r+1:end)=0;
    
    % Using the selected singular values, compute truncated SVD
    tsvd1 = U1*temp1*V1';
    tsvd2 = U2*temp2*V2';
    
    figure(1);
    subplot(3,2,i);
    colormap(gray);
    image(tsvd1);
    
    figure(2);
    subplot(3,2,i);
    colormap(gray);
    image(tsvd2);   
    
end