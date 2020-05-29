function dot_prod = kernel_calculator(x_i, x_j, type, r)
    if type == 0 %Linear
        dot_prod = transpose(x_i)*x_j;
    end
    
    if type == 1 %Polynomial
        dot_prod = (transpose(x_i)*x_j + 1)^r;
    end
    
    if type == 2 %RBF
        dot_prod = exp(sum((x_i - x_j).^2, 'all')*-1*r);
    end
end