clc; clear;

range = [0 1:60 61];
a = 0;

for k = range
  if k > 0 && k < 10
    a = imread(['VIDEO/VIDEO_00' num2str(k) '.jpg']);
  end
  if k >= 10
    a = imread(['VIDEO/VIDEO_0' num2str(k) '.jpg']);
   end
   
   %a = imread([string num2str(k) '.jpg'])
   imshow(a);
   
   pause(0.5);
 end
    