//
//  ViewController.h
//  QuizApp2
//
//  Created by 藤田 優介 on 2016/02/03.
//  Copyright © 2016年 yusuke.fujita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *textAnswer;
@property (weak, nonatomic) IBOutlet UILabel *textResult;
@property (weak, nonatomic) IBOutlet UIButton *maruButton;
@property (weak, nonatomic) IBOutlet UIButton *batuButton;
@property (weak, nonatomic) IBOutlet UILabel *explainText;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

- (IBAction)corectAnswer:(id)sender;
- (IBAction)wrongAnswer:(id)sender;
- (IBAction)resetButton:(id)sender;

@end

