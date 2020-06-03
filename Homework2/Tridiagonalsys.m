%
%  [ a(1)  v1(1)                                   ] [  X(1)  ]   [  b(1)  ]
%  [ v2(2)  a(2)  v1(2)                            ] [  X(2)  ]   [  b(2)  ]
%  [       v2(3)  a(3)  v1(3)                      ] [        ]   [        ]
%  [            ...   ...   ...                    ] [  ...   ] = [  ...   ]
%  [                    ...    ...    ...          ] [        ]   [        ]
%  [                        v2(n-1) a(n-1) v1(n-1) ] [ X(n-1) ]   [ b(n-1) ]
%  [                                 v2(n)  a(n)   ] [  X(n)  ]   [  b(n)  ]
%First value of the v1 and the last value of the v2 must be 0. Each vector must
%be given as an input.
%

function X = Tridiagonalsys(v1,a,v2,b)

for index = 2:length(a)
    a(index) = a(index) - (v1(index) / a(index-1)) * v2(index-1);
    b(index) = b(index) - (v1(index) / a(index-1)) * b(index-1);
end

X(length(a)) = b(length(a)) / a(length(a));

for index = length(a)-1 : -1 : 1 
    X(index) =  (b(index) - v2(index) * X(index+1)) / a(index);
end