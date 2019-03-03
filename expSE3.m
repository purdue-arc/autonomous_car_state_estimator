
function  exp_uw = expSE3(u,w)

%SE3 is the translation&rotation space, (R|U;0 1)


%u is the translation


theta = sqrt(w' * w);

I = eye(3);



if(theta < 1e-9)
    
    
    
    
    return
end

 A = (sin(theta))/(theta);
 
 B = (1 - cos(theta))/(theta*theta);
 
 C = (1 - A)/(theta*theta);
 
 W_x = hat(w); % Skew Symmetric matrix from hat operator
 
 
  R_next = I + A*W_x + B*W_x*W_x;
  
  V_next = I + B*W_x + C*W_x*W_x;

  
  exp_uw = [R_next, (V_next)*u; 0 0 0 1];
  
 

end

