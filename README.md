# BAC_segmentation

這是“應用區域生長方法於乳房X光攝影影像中乳腺動脈鈣化區域分割”的程式 

程式的目的:以"區域生長"和"線段強化"這兩個影像處理演算法分割出影像中的病灶區域  

按以下順序執行程式  
1.標籤移除 Remove/remove_label.m >remove_label_image.jpg  
2.胸肌移除 Remove/remove_pectoral_muscle.m >remove__pectoral_muscle.jpg  
3.前後黑色區域移除 crop/cropped.m >croped_img.jpg  
4.固定尺寸 crop/resize.m >resize_img.jpg  
5.高斯模糊 blur/blur.m >blur_img.jpg  
6.線段強化 linestrength/runFiltering.m >line_strength_img.jpg  
7.影像二值化 threshold/ostu.m >threshold_line_strength_img.jpg  
8.區域劃分 split/split.m >  
......split_img_1.jpg  
......split_img_2.jpg  
......split_img_3.jpg  
......split_img_4.jpg  
......split_img_5.jpg  
......split_img_6.jpg  
9.區域生長 regioning/demo.m >  
......region_grow_img_1.jpg  
......region_grow_img_2.jpg  
......region_grow_img_3.jpg  
......region_grow_img_4.jpg  
......region_grow_img_5.jpg  
......region_grow_img_6.jpg  
10.區域接合 join/join.m >region_grow_img.jpg  
