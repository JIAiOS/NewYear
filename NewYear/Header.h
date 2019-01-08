//
//  Header.h
//  NewYear
//
//  Created by 贾倍 on 2019/1/8.
//  Copyright © 2019 贾倍. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define kMainScreen_width  [[UIScreen mainScreen] bounds].size.width
#define kMainScreen_height [[UIScreen mainScreen] bounds].size.height
#define kMainScreen_Bounds [UIScreen mainScreen].bounds
#define FRAME(x,y,width,height) CGRectMake(x,y,width,height)
#define TabStatusH (kMainScreen_height == 812 ? 83 : 49)
#define StatusH (kMainScreen_height == 812 ? 44 : 20)
#define kDevice_Is_iPhineXx ([UIApplication sharedApplication].statusBarFrame.size.height) == 20 ? NO:YES

#endif /* Header_h */
