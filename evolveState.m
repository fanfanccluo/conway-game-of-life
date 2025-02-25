function evolveState(m,n)
% this function simulates the evolve of each cell according to the
% following rules:
% 1.Each live cell with exactly two or three live neighbors survives; all
% other live cells die
% 2.Each dead cell with exactly three live neighbors comes to life; all
% other live cells remain dead

[R,C] = inputLiveCells(m,n);
 mats = zeros(m,n);
 g_e = 1;% number of generation
 
for i = 1:length(R)
    mats(R(i),C(i)) = 1;
end
Life_cell{g_e} = mats;

while true
   g_e = g_e+1;
   last_g = Life_cell{g_e-1};
   next_g = zeros(m,n);
  for ind_r = 1:m
      
      for ind_c = 1:n
          
          det_r = any(ind_r == R); %determine if it's live row
          det_c = any(ind_c == C); %determine if it's live column
          
          if (det_r&&det_c) %when the cell is live
              
              if ind_r == 1 %the first row
                  
                  if ind_c == 1 %the first column
                      sum_1 = last_g(ind_r+1,ind_c) + last_g(ind_r,ind_c+1) + last_g(ind_r+1,ind_c+1);
                      det_1 = ((sum_1==2)||(sum_1==3));
                      
                      if det_1
                          next_g(ind_r,ind_c)=1;
                          R(1) = ind_r;
                          C(1) = ind_c;
                      else
                          next_g(ind_r,ind_c)=0;
                      end
                      
                  elseif ind_c == n %the last column
                      sum_3 = last_g(ind_r,ind_c-1) + last_g(ind_r+1,ind_c-1) + last_g(ind_r+1,ind_c);
                      det_3 = ((sum_3==2)||(sum_3==3));
                      
                      if det_3
                          next_g(ind_r,ind_c)=1;
                          R(3) = ind_r;
                          C(3) = ind_c;
                      else
                          next_g(ind_r,ind_c)=0;
                      end
                      
                  else
                      
                      sum_2 = last_g(ind_r,ind_c-1) + last_g(ind_r+1,ind_c+1) + last_g(ind_r+1,ind_c) + last_g(ind_r+1,ind_c+1) + last_g(ind_r,ind_c-1);
                      det_2 = ((sum_2==2)||(sum_2==3));
                      if det_2 
                         next_g(ind_r,ind_c)=1;
                         R(2) = ind_r;
                         C(2) = ind_c;
                      else
                         next_g(ind_r,ind_c)=0; 
                      end
                      
                  end
                  
              elseif ind_r == m %the last row
                  
                  if ind_c == 1 %the first column
                      sum_4 = last_g(ind_r-1,ind_c) + last_g(ind_r-1,ind_c+1) + last_g(ind_r,ind_c+1);
                      det_4 = ((sum_4==2)||(sum_4==3));
                      
                      if det_4
                          next_g(ind_r,ind_c)=1;
                          R(4) = ind_r;
                          C(4) = ind_c;
                      else
                          next_g(ind_r,ind_c)=0;
                      end
                      
                  elseif ind_c == n %the last column
                         sum_5 = last_g(ind_r,ind_c-1) + last_g(ind_r-1,ind_c-1) + last_g(ind_r-1,ind_c);
                         det_5 = ((sum_5==2)||(sum_5==3));
                         
                         if det_5
                             next_g(ind_r,ind_c)=1;
                             R(5) = ind_r;
                             C(5) = ind_c;
                         else
                             next_g(ind_r,ind_c)=0;
                         end
                         
                  else %other columns
                      
                      sum_6 = last_g(ind_r,ind_c-1) + last_g(ind_r-1,ind_c-1) + last_g(ind_r-1,ind_c) + last_g(ind_r-1,ind_c+1) + last_g(ind_r,ind_c+1);
                      det_6 = ((sum_6==2)||(sum_6==3));
                      if det_6
                          next_g(ind_r,ind_c)=1;
                          R(6) = ind_r;
                          C(6) = ind_c;
                      else
                          next_g(ind_r,ind_c)=0;
                      end
                  end
                  
                  
                  
                                 
              else  % other rows (rows in the middle) 
                  
                  if ind_c == 1 % the first column
                     sum_7 = last_g(ind_r+1,ind_c) + last_g(ind_r+1,ind_c+1) + last_g(ind_r,ind_c+1) + last_g(ind_r-1,ind_c+1) + last_g(ind_r-1,ind_c);
                     det_7 = ((sum_7==2)||(sum_7==3));
                     
                     if det_7
                         next_g(ind_r,ind_c)=1;
                         R(7) = ind_r;
                         C(7) = ind_c;
                     else
                         next_g(ind_r,ind_c)=0;
                     end
                     
                  elseif ind_c == n % the last column
                      sum_8 = last_g(ind_r-1,ind_c) + last_g(ind_r-1,ind_c-1) + last_g(ind_r,ind_c-1) + last_g(ind_r+1,ind_c-1) + last_g(ind_r+1,ind_c);
                      det_8 = ((sum_8==2)||(sum_8==3));
                      
                      if det_8
                          next_g(ind_r,ind_c)=1;
                          R(8) = ind_r;
                          C(8) = ind_c;
                      else
                          next_g(ind_r,ind_c)=0;
                      end
                     
                  
                  else
                      sum_9 = last_g(ind_r-1,ind_c-1) + last_g(ind_r-1,ind_c) + last_g(ind_r-1,ind_c+1)...
                            + last_g(ind_r,ind_c-1) + last_g(ind_r,ind_c+1)...
                            + last_g(ind_r+1,ind_c-1) + last_g(ind_r+1,ind_c) + last_g(ind_r+1,ind_c+1);
                        det_9 = ((sum_9==2)||(sum_9==3))
                        
                        if det_9
                            next_g(ind_r,ind_c)=1;
                            R(9) = ind_r;
                            C(9) = ind_c;
                        else
                            next_g(ind_r,ind_c)=0;
                        end
                      
                  end
                  
              end
              
              
          else%when the cell is dead
              
              if ind_r == 1 %the first row
                  
                  if ind_c == 1 %the first column
                      sum_10 = last_g(ind_r+1,ind_c) + last_g(ind_r,ind_c+1) + last_g(ind_r+1,ind_c+1);
                      det_10 = (sum_10==3);
                      
                      if det_10
                          next_g(ind_r,ind_c)=1;
                          R(10) = ind_r;
                          C(10) = ind_c;
                      else
                          next_g(ind_r,ind_c)=0;
                      end
                      
                  elseif ind_c == n %the last column
                      sum_11 = last_g(ind_r,ind_c-1) + last_g(ind_r+1,ind_c-1) + last_g(ind_r+1,ind_c);
                      det_11 = (sum_11==3);
                      
                      if det_11
                          next_g(ind_r,ind_c)=1;
                          R(11) = ind_r;
                          C(11) = ind_c;
                      else
                          next_g(ind_r,ind_c)=0;
                      end
                      
                  else
                      
                      sum_12 = last_g(ind_r,ind_c-1) + last_g(ind_r+1,ind_c+1) + last_g(ind_r+1,ind_c) + last_g(ind_r+1,ind_c+1) + last_g(ind_r,ind_c-1);
                      det_12 = (sum_12==3);
                      if det_12 
                         next_g(ind_r,ind_c)=1;
                         R(12) = ind_r;
                         C(12) = ind_c;
                      else
                         next_g(ind_r,ind_c)=0; 
                      end
                      
                  end
                  
              elseif ind_r == m %the last row
                  
                  if ind_c == 1 %the first column
                      sum_13 = last_g(ind_r-1,ind_c) + last_g(ind_r-1,ind_c+1) + last_g(ind_r,ind_c+1);
                      det_13 = (sum_13==3);
                      
                      if det_13
                          next_g(ind_r,ind_c)=1;
                          R(13) = ind_r;
                          C(13) = ind_c;
                      else
                          next_g(ind_r,ind_c)=0;
                      end
                      
                  elseif ind_c == n %the last column
                         sum_14 = last_g(ind_r,ind_c-1) + last_g(ind_r-1,ind_c-1) + last_g(ind_r-1,ind_c);
                         det_14 = (sum_14==3);
                         
                         if det_14
                             next_g(ind_r,ind_c)=1;
                             R(14) = ind_r;
                             C(14) = ind_c;
                         else
                             next_g(ind_r,ind_c)=0;
                         end
                         
                  else %other columns
                      
                      sum_15 = last_g(ind_r,ind_c-1) + last_g(ind_r-1,ind_c-1) + last_g(ind_r-1,ind_c) + last_g(ind_r-1,ind_c+1) + last_g(ind_r,ind_c+1);
                      det_15 = (sum_15==3);
                      if det_15
                          next_g(ind_r,ind_c)=1;
                          R(15) = ind_r;
                          C(15) = ind_c;
                      else
                          next_g(ind_r,ind_c)=0;
                      end
                  end
                  
                  
                  
                                 
              else  % other rows (rows in the middle) 
                  
                  if ind_c == 1 % the first column
                     sum_16 = last_g(ind_r+1,ind_c) + last_g(ind_r+1,ind_c+1) + last_g(ind_r,ind_c+1) + last_g(ind_r-1,ind_c+1) + last_g(ind_r-1,ind_c);
                     det_16 = (sum_16==3);
                     
                     if det_16
                         next_g(ind_r,ind_c)=1;
                         R(16) = ind_r;
                         C(16) = ind_c;
                     else
                         next_g(ind_r,ind_c)=0;
                     end
                     
                  elseif ind_c == n % the last column
                      sum_17 = last_g(ind_r-1,ind_c) + last_g(ind_r-1,ind_c-1) + last_g(ind_r,ind_c-1) + last_g(ind_r+1,ind_c-1) + last_g(ind_r+1,ind_c);
                      det_17 = (sum_17==3);
                      
                      if det_17
                          next_g(ind_r,ind_c)=1;
                          R(17) = ind_r;
                          C(17) = ind_c;
                      else
                          next_g(ind_r,ind_c)=0;
                      end
                     
                  
                  else
                      sum_18 = last_g(ind_r-1,ind_c-1) + last_g(ind_r-1,ind_c) + last_g(ind_r-1,ind_c+1)...
                            + last_g(ind_r,ind_c-1) + last_g(ind_r,ind_c+1)...
                            + last_g(ind_r+1,ind_c-1) + last_g(ind_r+1,ind_c) + last_g(ind_r+1,ind_c+1);
                        det_18 = (sum_18==3);
                        
                        if det_18
                            next_g(ind_r,ind_c)=1;
                            R(18) = ind_r;
                            C(18) = ind_c;
                        else
                            next_g(ind_r,ind_c)=0;
                        end
                      
                  end
                  
              end 
              
              
              
          end
        
          
      end
      
      
  end

Life_cell{g_e} = next_g;
R = R(R~=0);
C = C(C~=0);
drawLivecells(R,C,m,n);evol
end

end