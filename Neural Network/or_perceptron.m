function  y1  = or_perceptron( x1 , x2 )

input = [ 1 ; str2num(x1) ; str2num(x2) ];
parameter = [ -1 ; 2 ;2 ];

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

