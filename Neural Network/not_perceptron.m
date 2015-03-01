function  y1  = not_perceptron( x1 )

input = [ 1 ; str2num(x1) ];
parameter = [ 2 ; -5  ];

%perform linear combination
    lcom = sum(input .* parameter);
%transfer function 

y  = 1 /  ( 1 + exp(-lcom ) );

if y > 0.5
   
    y1 = 1;
else
    y1 = 0;
end

%transfer function ends here

end

