function node = NodeEntropy1(feature,target,num)
global node_id;
node = 0;
target = target(2:size(target),1);
if size(feature,2) == 1 %we reached the final node
   unique_tar = unique(feature(2:end,1));
   if size(unique_tar,1) == 1
        node = struct('id',node_id,'total',0,'class',unique_tar(1,1),'edge','value','children',[]);
        node_id = node_id + 1;
   else
       %find the maximum count
        max1 = 0;
       inde = 0;
       tie = [];
       set = feature(2:end,1);
       for c=1:size(unique_tar)
         ind = find(strcmp(unique_tar(c),set));
         if size(ind) > max1
             max1  = size(ind,1);
             inde = c;
             tie = [ c ];
         elseif size(ind) == max1
             tie = [ tie ; ind ];
         end
       end
       if size(tie) > 1           %reject when two or more class has same count
           valr = 'reject';
       else
           valr = unique_tar(tie(1));
       end
       
       
       
       
       node = struct('id',node_id,'total',0,'class',valr,'edge','value','children',[]);
        node_id = node_id + 1;
   end
   return;
end
header2 = feature(1,2:end);
%feature = feature(2:size(feature),:);
total_instance = size(target);
sum = find_entropy(target);
if sum == 0
    node = struct('id',node_id,'total',0,'class',target(1,1),'edge','value','children',[]);
     node_id = node_id + 1;
    return;
end
gain = zeros(size(feature,2)-1,1);
for j = 2:size(feature,2)
    S_v = 0;
     uniquefeature = unique(feature(2:end,j));
     for k  = 1:size(uniquefeature)
        target_i = find(strcmp(feature(2:end,j),uniquefeature(k)));
        entropy = feature(2:end,1);
        entropy = entropy(target_i);
        entr_val = find_entropy(entropy);
        pr_s = size(find(strcmp(feature(2:end,j),uniquefeature(k))),1);
        S_v =  S_v + ( ( pr_s / (total_instance(1)) )*   entr_val );
     end
     gain(j-1) = sum - S_v;
end
[val,index] = max(gain);
res = feature(1:end,index+1);
children = [];
u_res = unique(res(2:end,:));
root_node = struct('id',node_id,'total',0,'class',header2(index),'edge','value','children',children);
 node_id = node_id + 1;
value = '';
for k = 1:size(u_res)
  ind = find(strcmp(res,u_res(k)));
  ind = [ 1 ; ind ];
  S = feature(ind,:);
  value = u_res(k);
  S(:,index+1) = [];
  num = num+1
  node = NodeEntropy1(S(:,:),S(:,1),num);
  node.edge = value;
%  root_node.children
  
  root_node.children = [ root_node.children ; node ];
end
node = root_node;
for i= 1:size(node.children,1)
    node.children(i).total=node.id;
end
% attr = header(1,index);
% pointers = [];
% uniquefeature = unique(feature(:,attr+1));
% for z = 1:size(uniquefeature)
%    pointers = [ pointers : z uniquefeature(z) ];
% end
% 
%myTree = struct('feature',attr,'leftNode','null','rightNode','null');