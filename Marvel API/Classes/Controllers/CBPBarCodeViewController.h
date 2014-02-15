//
//  CBPBarCodeViewController.h
//  Marvel API
//
//  Created by Karl Monaghan on 14/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^successReturnBlock)(NSString *barcode);

@interface CBPBarCodeViewController : UIViewController
- (instancetype)initWithBlock:(successReturnBlock)finsihedBlock;
@end
