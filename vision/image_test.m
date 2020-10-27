clear
clc

%Set up the webcam
vid=videoinput('winvideo',1,'MJPG_1280x720')

%Capture an image from the webcam
preview(vid)
pause(2.0)
frame=getsnapshot(vid)

%Convert image to greyscale
red=frame(:,:,1);
green=frame(:,:,2);
blue=frame(:,:,3);

%we can also use color1_only=color1-color2-color3 in other to increase the
%results. And then use color1_only in the convertion to greyscale

%Convert greyscale to black and white. Reducing threshould increases white
%pixels and reduces darker pixels
black_white_red=(red>120);
black_white_green=(green>120);
black_white_blue=(blue>120);

%Plot
figure(2)
imshow(frame)

figure(3)
subplot(3,1,1)
imshow(red)
subplot(3,1,2)
imshow(green)
subplot(3,1,3)
imshow(blue)

figure(4)
subplot(3,1,1)
imshow(black_white_red)
subplot(3,1,2)
imshow(black_white_green)
subplot(3,1,3)
imshow(black_white_blue)

%set black and white matrix
black_white=black_white_red %by default is the red matrix. Changing from red might increase results

%Label first row
Tally=1;
object_matrix(1,1)=1;
i=1; %row number
j=2; %column number

while (j<=1280)
    if (black_white(i,j-1)==black_white(i,j))
        object_matrix(i,j)=object_matrix(i,j-1);
    else
        object_matrix(i,j)=Tally+1;
        Tally=Tally+1;
    end
    j=j+1;
end

%Label first column
i=2;
j=1;
while (i<=720)
   if (black_white(i-1,j)==black_white(i,j))
       object_matrix(i,j)=object_matrix(i-1,j);
   else
       object_matrix(i,j)=Tally+1;
       Tally=Tally+1;
   end
   i=i+1; 
end

%Label all other pixels
i=2;
while (i<=720)
    j=2;
    while (j<=1280)
        labeled=0;
        %Rule 1
        if (black_white(i,j-1)==black_white(i,j))
            object_matrix(i,j)=object_matrix(i,j-1);
            labeled=1;
        end
        %Rule 2
        if (black_white(i,j-1)==black_white(i-1,j) && object_matrix(i,j-1)~=object_matrix(i-1,j))
            label=min([object_matrix(i-1,j) object_matrix(i,j-1)]);
            object_matrix(i,j)=label; %pixel in question
            object_matrix(i-1,j)=label; %pixel to the top
            object_matrix(i,j-1)=label; %pixel to the left
            labeled=1; %you have in fact labeled the pixel in question
        end
        %Rule 3
        if (black_white(i,j-1)~=black_white(i,j) && black_white(i-1,j)==black_white(i,j))
            object_matrix(i,j)=object_matrix(i-1,j);
            labeled=1;
        end
        if (labeled==0)
            object_matrix(i,j)=Tally+1;
            Tally=Tally+1;
        end
       j=j+1; 
    end
    i=i+1;
end

%Plot result
figure(5)
imshow(object_matrix==1) %pixels that represent object "1". Typing max(max(object_matrix)) tells us how many diferent object have been labeled 



