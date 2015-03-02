function logistic_batch()
x = [ 'dataset1.csv'; 'dataset2.csv'];
for xr = 1:2    
B =  dataset('file',x(xr,:),'delimiter',',');
dataValues = B(1:size(B),1:size(B,2)) ;  
target = dataset2cell(B(1:size(B),4));
feature = dataset2cell(B(1:size(B),1:3));
d = size(B,2);

 
cw = [];
lr = [0.001 0.01 0.1 0.5];
witer = [ ];

    for l = 1:size(lr,2)
        epoch = 100;
        conv = 0;
        error = [];
        xmin=-0.01;
xmax=0.01;
n=d-1;
       w=xmin+rand(1,n)*(xmax-xmin);

while (conv == 0 && epoch > 0)
    
    epoch = epoch - 1;
    cw = zeros(1,d-1);
    st_w = w;
    err = 0;
    for i = 1:size(B,2)
          
           ds = cell2mat(feature(i+1,:));
           r = cell2mat(target(i+1,:));
           o = dot(ds,w);
           y = (1/(1+exp(-o)));
           err = err + r * log(y) + (1- r) * log(1 - y);
           cw = cw + ((r - y) * ds );
          
    end
     w = w + lr(1,l) * cw;
    witer = [ witer w' ];
    err = - (err / 100) ;
    error = [ error err ];
    if st_w == w
       conv = 1;
       
    end 

end
    num = 1:100;
     y = error(:);
    if xr == 1
      %  if l
        subplot(4,2,l),plot(num,error(:),'r-');
        
    hold on;
    else
       
        subplot(4,2,(l+4)   ),plot(num,y,'b--');
    end
axis([0,100,min(error(:)),max(error(:))]);
indexmin = find(min(y) == y);
xmin = num(indexmin);
ymin = y(indexmin);
strmin = ['Minimum = ',num2str(ymin(1))];
text(xmin(1),ymin(1),strmin,'HorizontalAlignment','left');
len = strcat('y = ',x(xr,:));
legend(len);
xlabel(strcat('Iterations ( learning rate = ', num2str(lr(1,l)),' )'));
ylabel('Error Function');
    end
hold off;
end