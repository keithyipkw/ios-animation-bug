//
//  DetailViewController.h
//  animation
//
//  Created by Keith Yip on 3/4/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

