function node_r = postorder_traversal(node)

 node_r = [ node ];
if size(node.children,1) == 0
 return;
end
for i = 1:size(node.children)
      node_r = [ node_r postorder_traversal(node.children(i))];
end
