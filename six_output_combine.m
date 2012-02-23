function [ results ] = six_output_combine( output )
%SIX_OUTPUT_COMBINE 

    results = zeros(size(output,2),1);
    for i = 1:size(output,2)
       max = output(1,i);
       index = 1;
       for j = 2:6
          if output(j,i) > max
             max = output(j,i);
             index = j; 
          end
       end
       results(i) = index;
    end

end

