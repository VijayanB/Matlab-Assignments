function y1 = xor_perceptron( x1 , x2 )

h11 = and_perceptron(x1 , x2 );

h12 = or_perceptron( x1, x2 );

h2 = not_perceptron(num2str(h11));

y1 = and_perceptron(num2str(h12),num2str(h2));

end