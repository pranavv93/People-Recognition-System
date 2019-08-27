

function [F,mask] = start(img)

%img = imread('face2.jpg');

detector = buildDetector();
[bbox bbimg faces bbfaces] = detectFaceParts(detector,img,2);


mask = (bbfaces{size(bbfaces,1)});


%#pranav v

%left eye

new=bbfaces{1};

sz1=size(new,1);
sz2=size(new,2);


for i=1:sz1
    for j=1:sz2
        if (new(i,j,1) == 255 && new(i,j,2) == 0 && new(i,j,3) == 0)
            le = [i j];
            a=le(1)+2;
            b=le(2)+2;
            cl=0;
            
            while (not((new(a,b,1)== 255)&&(new(a,b,2)== 0)&&(new(a,b,3)== 0)))
                cl=cl+1;
                b=b+1;
               
            end
            
            a=le(1)+2;
            b=le(2)+2;
            rw=0;
            
            while (not((new(a,b,1)== 255)&&(new(a,b,2)== 0)&&(new(a,b,3)== 0)))
                rw=rw+1;
                a=a+1;
               
            end
            
            midleye=[le(1)+1+rw/2 le(2)+1+cl/2];
            
            figure;
            imshow(new);
            hold on;
            plot(midleye(2), midleye(1), 'g+', 'MarkerSize', 8, 'LineWidth', 3);
            
            
            
            %reye
            
            for i=1:sz1
                for j=1:sz2
                    if (new(i,j,1) == 255 & new(i,j,2) == 0 & new(i,j,3) == 255)
                    re = [i j];
                    a=re(1)+2;
                    b=re(2)+2;
                    cl=0;
            
                    while (not((new(a,b,1)== 255)&&(new(a,b,2)== 0)&&(new(a,b,3)== 255)))
                        cl=cl+1;
                        b=b+1;
               
                    end
            
                    a=re(1)+2;
                    b=re(2)+cl-1;
                    rw1=0;
            
                    while (not((new(a,b,1)== 255)&&(new(a,b,2)== 0)&&(new(a,b,3)== 255)))
                        rw1=rw1+1;
                        a=a+1;
               
                    end
            
                    midreye=[re(1)+1+rw1/2 re(2)+1+cl/2];
            
 
                    hold on;
                    plot(midreye(2), midreye(1), 'g+', 'MarkerSize', 8, 'LineWidth', 3);
            
                    %mouth
                    for i=1:sz1
                        for j=1:sz2
                            if (new(i,j,1) == 0 && new(i,j,2) == 255 && new(i,j,3) == 255)
                                re_mt = [i j];
                                a=re_mt(1)+2;
                                b=re_mt(2)+2;
                                cl_mt=0;
                                rw1_mt=0;
            
                                while (not((new(a,b,1)== 0)&&(new(a,b,2)== 255)&&(new(a,b,3)== 255)))
                                    rw1_mt=rw1_mt+1;
                                    a=a+1;
                                    
                             
               
                                end
            
                                a=re_mt(1)+rw1_mt-1;
                                b=re_mt(2)+2;
                                
            
                                while (not((new(a,b,1)== 0)&&(new(a,b,2)== 255)&&(new(a,b,3)== 255)))
                                     cl_mt=cl_mt+1;
                                     b=b+1;
                                    
               
                                end
            
                                mouth=[re_mt(1)+1+rw1_mt/2 re_mt(2)+1+cl_mt/2];
            
 
                                hold on;
                                plot(mouth(2),mouth(1), 'g+', 'MarkerSize', 8, 'LineWidth', 3);
            
                                %nose
                                for i=1:sz1
                                    for j=1:sz2
                                        if (new(i,j,1) == 255 & new(i,j,2) == 255 & new(i,j,3) == 0)
                                            re_ns = [i j];
                                            a=re_ns(1)+2;
                                            b=re_ns(2)+2;
                                            cl_ns=0;
            
                                            while (not((new(a,b,1)== 255)&&(new(a,b,2)== 255)&&(new(a,b,3)== 0)))
                                            
                                                        cl_ns=cl_ns+1;
                                                        b=b+1;
                                                   
               
                                            end
            
                                            a=re_ns(1)+2;
                                            b=re_ns(2)+2;
                                            rw1_ns=0;
            
                                            while (not((new(a,b,1)== 255)&&(new(a,b,2)== 255)&&(new(a,b,3)== 0)))
                                                rw1_ns=rw1_ns+1;
                                                a=a+1;
               
                                            end
            
                                            nose=[re_ns(1)+1+rw1_ns/2 re_ns(2)+1+cl_ns/2];
            
 
                                            hold on;
                                            plot(nose(2),nose(1), 'g+', 'MarkerSize', 8, 'LineWidth', 3);
                                            
                                            
                                            temp=midleye(2);
                                            midleye(2)=midleye(1);
                                            midleye(1)=temp;
                                            
                                            temp=midreye(2);
                                            midreye(2)=midreye(1);
                                            midreye(1)=temp;
                                            
                                            temp=mouth(2);
                                            mouth(2)=mouth(1);
                                            mouth(1)=temp;
                                            
                                            temp=nose(2);
                                            nose(2)=nose(1);
                                            nose(1)=temp;
                                            
                                            
                                            F=[midleye; midreye; mouth; nose];
            
                                            return;
            
                                        end
                                    end
    
                                end
            
                            end
                        end
    
                    end
                    
                    %nose
                    
            
            
            
       

            
                    end
                end
    
            end
            
            
            
            
        end
    end
    
end


