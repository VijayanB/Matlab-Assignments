function entropy = find_entropy(target)

uniquetarget = unique(target);
total_instance = size(target);
sum = 0;
for i = 1:size(uniquetarget)
     prob = size(find(strcmp(target,uniquetarget(i))),1) / total_instance(1);
     sum = sum + (-1) * prob * log2(prob);
end

entropy = sum;
