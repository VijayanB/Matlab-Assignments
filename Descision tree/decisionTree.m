function decisionTree()
B = dataset('file','fruits_decisionTree.csv','delimiter',',');
dataValues = B(2:size(B),2:size(B,2)) ;  
target = dataset2cell(B(1:size(B),1));
%target = target(2:size(target),1);
feature = dataset2cell(B(1:size(B),2:4));
feature = [ target feature ];

        root = NodeEntropy(feature,target);


%node = struct('attr','atr1','children',childrens);