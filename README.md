# BAC_segmentation

案以下順序執行程式  
1.標籤移除 remove_label.m >remove_label_image.jpg  
2.胸肌移除 remove_pectoral_muscle.m >remove__pectoral_muscle.jpg  
3.影像整理 roi.m >clear_remove_img.jpg  
4.前後黑色區域移除 cropped.m >croped_img.jpg  
5.固定尺寸 resize.m >resize_img.jpg  
6.高斯模糊 blur.m >blur_img.jpg  
7.線段強化 line_strength.m >line_strength_img.jpg  
8.影像整理 roi.m >clear_line_strength_img.jpg  
9.影像二值化 ostu.m >threshold_line_strength_img.jpg  
10.區域劃分 split.m >  split_img_1.jpg  
                      split_img_2.jpg  
                      split_img_3.jpg  
                      split_img_4.jpg  
                      split_img_5.jpg  
                      split_img_6.jpg  
11.區域生長 region_grow.m >  
region_grow_img_1.jpg  
region_grow_img_2.jpg  
region_grow_img_3.jpg  
region_grow_img_4.jpg  
region_grow_img_5.jpg  
region_grow_img_6.jpg  
12.區域接合 join.m >region_grow_img.jpg  
