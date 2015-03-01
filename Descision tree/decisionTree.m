function decisionTree()
global node_id;
node_id = 1;
B = dataset('file','fruits_decisionTree.csv','delimiter',',');
dataValues = B(2:size(B),2:size(B,2)) ;  
target = dataset2cell(B(1:size(B),1));
feature = dataset2cell(B(1:size(B),2:4));
feature = [ target feature ];
root = NodeEntropy1(feature,target,1);
root.total = 0;
node = root;
op = [];
op = postorder_traversal(node);

c = containers.Map('KeyType','char','ValueType','char'); 
t = 'Enter long or short for Length ';
temp = input(t,'s');
c('Length') = temp;
t = 'Enter sweet or sour for Sweetness ';
temp = input(t,'s');
c('Sweetness') = temp;
t = 'Enter orange , yellow  or green for Color ';
temp = input(t,'s');
c('Color') = temp;
check_test_case(node,c);
disp(['Extracted rules from Decision tree :']);
extract_line(node,'');
matr = [];
for i = 1:size(op,2)
   matr = [ matr op(i).total ];
end
treeplot(matr,'ro','b-');
coordinates = get(gca,'Children');
xCoordinates = get(coordinates(2) ,'XData');
yCoordinates = get(coordinates(2) ,'YData');

co_ordinates = [];

for i=1:size(op,2)
   
    
    co_ordinates = [ co_ordinates ; xCoordinates(i) yCoordinates(i) ];
    text(xCoordinates(i)-0.03,yCoordinates(i)+0.03,op(i).class);
    text(xCoordinates(i)-0.03,yCoordinates(i)+.03,op(i).class);
end

for i=1:size(op,2)
    parent = op(i).total;
    if parent > 0 
        x = (xCoordinates(i)-0.03 + co_ordinates(parent,1)) / 2.0;
        y = (yCoordinates(i)-0.03 + co_ordinates(parent,2)) / 2.0;
        if strcmp(op(i).edge,'value' ) == 1
         temp = '';
        else
         temp = strcat('(',op(i).edge, ')');
        end
        text(x,y,temp);
    end
end



%node = struct('attr','atr1','children',childrens);