function roots = FindRoots( func, a, b, nprobe, tol )
    %Since I need the initial interval values, I save them.
    ai = a; bi = b;
    step = (b - a)/(nprobe - 1);     
    x = (a : step : b);
    
    syms x
    %first derivative of the function
    dfunc = matlabFunction(diff(func(x))); 
    
    xf = a;         %initial value for newton method
    roots=[];       %For saving the roots
    interval = [];  %For saving other interval which may have a root
    flag = 0;       %For checking other interval if a root is found
    
    flag2 = 0;      %Firstly I search the roots for the half of the function
                    %then I search them for other half. This variable is
                    %for the determine this situation.

    while(1)
        %Applies the newton method
                       
        fxf = func(xf); dfxf = dfunc(xf);
        if (isnan(fxf))     %if the value is undefined
            fxf = 1;                    
        end
        
        xl = xf - round(fxf/dfxf); 
        fxl = func(xl);
        if (isnan(fxl))      %if the value is undefined
            fxl = 1;                    
        end
        
        %Finding root criteria
        if and(abs(fxl) < tol, abs(xl-xf) < tol * (1+abs(xl)))
            if ~ismember(xl,roots)          %If the root is not already found,
                roots = [roots; xl];        %Saves the root to vector  
            end
            flag = 1;
            if(isempty(interval))   %If there is not any interval left that we must check
                flag2=flag2+1;      %I can look the other half of the function
                flag = 0;
                a = ai; b = bi;     %I need the initial interval values.
                step = (b - a)/(nprobe - 1);
                x = (a : step : b);  
                syms x
                dfunc = matlabFunction(diff(func(x)));
                xf = a;
                if(flag2==2)        %If I check both two halfs, now I can stop checking.
                    break;
                end
            end
        else
            xf = xl;              %If a root is not found, continue to do steps
        end
        %If an iterate is reached for which there is no sufficient decrease
        if abs(func(xl)) >= 0.5*abs(func(xf))   
            for i=1:3           %Does three bisection steps, finds midpoint
                p = (a+b)/2;
                fp = func(p); fa = func(a); fb = func(b);
                if (isnan(fp))  %if the value is undefined
                    fp = 1;                    
                end
                
                %Checks the signs to be able to understand existance of the root
                if flag2==0     %Finds the roots which are in the first half of the function
                    if fa*fp < 0      
                        if fb*fp < 0
                            %To be able to check other interval, I saves it into a vector
                            interval = [a,b,p; interval];
                        end
                        b = p; fb = fp;
                    else
                        a = p; fa = fp;
                    end
                    %if the current interval gives a root, checks other interval
                    if flag == 1        
                        a = interval(3); b = interval(2);
                        fa = fp;
                        flag = 0; interval(1,:)=[];
                    end
                else   %Now, Finds other roots which are in the second half of the function
                    if fb*fp < 0      
                        if fa*fp < 0
                            %To be able to check other interval, I saves it into a vector
                            interval = [a,b,p; interval];
                        end
                        a = p; fa = fp;
                    else
                        b = p; fb = fp;
                    end
                    %if the current interval gives a root, checks other interval
                    if flag == 1        
                        a = interval(1); b = interval(3);
                        fb = fp;
                        flag = 0; interval(1,:)=[];
                    end                    
                end
            end
            step = (b - a)/(nprobe - 1);    %Updates function with the new interval 
            x = (a : step : b);  
            syms x
            dfunc = matlabFunction(diff(func(x)));
            xf = a;
        end
    end
end