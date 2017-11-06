function y= projection( I,s )
if(s=='h')
    y=sum(I');
end
if(s=='v')
    y=sum(I);
end
end

