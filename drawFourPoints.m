
function Y = drawFourPoints( X, fourpoints, thick )
if( nargin < 3 )
 thick = 1;
end

Y = X;
if( size(fourpoints,1) > 0 )
    boxColor = [[0,255,0]; [255,0,255]; [255,0,255]; [0,255,255]; [255,255,0]; ];
    M=int32(fourpoints);

    if( thick >= 0 )
     t = (thick-1)/2;
     t0 = -int32(ceil(t));
     t1 = int32(floor(t));
    else
     t0 = 0;
     t1 = 0;
    end

    for k=5:-1:1
     shapeInserter = vision.ShapeInserter('Shape','Lines','BorderColor','Custom','Antialiasing',true,'CustomBorderColor',boxColor(k,:));
     N = horzcat(M(:,(k-1)*8+1:(k-1)*8+8),M(:,(k-1)*8+1:(k-1)*8+2));
     for i=t0:t1
      NN = N;
      NN(:,[1,3,5,7,9]) = N(:,[1,3,5,7,9]) + i;
      Y = step(shapeInserter, Y, NN);

      NN = N;
      NN(:,[2,4,6,8,10]) = N(:,[2,4,6,8,10]) + i;
      Y = step(shapeInserter, Y, NN);
     end
    end
end
