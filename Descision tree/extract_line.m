function extract_line(node,parent_str)
if size(node.children) == 0
   disp([parent_str ' then  class = ' node.class]); 
else
     if strcmp(parent_str,'') == 1
         if_str ='if';
     else
         if_str = '';
     end
     text = strcat(parent_str,if_str,{'  '},node.class,{'  '},'==',{'  '});
    for i = 1:size(node.children,1)
      res = strcat(text,node.children(i).edge);
      if size(node.children(i).children,1) > 0
         res = strcat(res,{'  and  '}) ;
      end
      extract_line(node.children(i),res{:})
    end
 end

