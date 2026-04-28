function w = weights_minvar(mu, Sigma)

n = size(Sigma,2) 

cvx_begin
    variable w(n)  
    minimize(quad_form(w, Sigma))
    
    subject to
        sum(w) == 1
        w >= 0
cvx_end
