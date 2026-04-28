target_returns = linspace(min(mu), max(mu), 50);

risk = zeros(length(target_returns),1);
ret  = zeros(length(target_returns),1);

for i = 1:length(target_returns)
    
    cvx_begin quiet
        variable w(n)
        minimize( quad_form(w, Sigma) )
        
        subject to
            sum(w) == 1
            w >= 0
            mu' * w >= target_returns(i)
    cvx_end
    
    risk(i) = sqrt(w' * Sigma * w);
    ret(i)  = mu' * w;
end

