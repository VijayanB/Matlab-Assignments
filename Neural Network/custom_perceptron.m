function y1 = custom_perceptron( x1 , x2 ,x3 )

h11 = or_perceptron(x1 , num2str(not_perceptron(x2)) );

h12 = or_perceptron( x1, x2 );

h2 = or_perceptron(num2str(h12),x3);

y1 = and_perceptron( num2str(and_perceptron(num2str(not_perceptron(x1)),num2str(h11))),num2str(h2));

end