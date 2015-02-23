function res = check_test_case(root,c)
res = 1;
if size(root.children,1)== 0
          disp(['prediction is  ' root.class]); 
          res = 0;
          return;
else
      attr = c(root.class);
      for j=1:size(root.children,1)
        if (strcmp(root.children(j).edge,attr) == 1)
            res = check_test_case(root.children(j),c);
            break;            
        end
      end
end
end