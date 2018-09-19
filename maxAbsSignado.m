function [val] = maxAbsSignado(vec)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[v,index] = max(abs(vec));
val = vec(index);
end

