function out = y_calculator(traindata, w, b)
    [m, ~] = size(traindata);
    out = zeros(m, 1);
    for i = 1:m
        out(i, 1) = sign(transpose(w)*transpose(traindata(i, :)) + b);
        if out(i, 1) == 0
            out(i, 1) = -1;
        end
    end
end