//
//  ViewController.m
//  QuizApp2
//
//  Created by 藤田 優介 on 2016/01/24.
//  Copyright © 2016年 YusukeF Inc. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

NSInteger quizNo;
NSString *quizText;
NSInteger quizAnswer;
NSInteger quizResult;
NSInteger lastQuizNo;
NSInteger explainFlag;
BOOL answerFlag;


@interface ViewController ()
@property (strong,nonatomic) AVAudioPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setParts];
    quizNo = 1 ;
    lastQuizNo = 6; // 最終問題　+ 1をセット
    explainFlag = 1;
    [self quiz];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setParts{
    _resetButton.hidden = YES;
    if (explainFlag == 1) {
        _explainText.text = @"○か×を回答してください。";
    }
}


- (void)quiz{
    switch (quizNo) {
            // answerFlag = 1 ○が正解
            // answerFlag = 0 ×が正解
            
            
        case 1:
            quizText = @"問１\n最近話題の駄菓子がテーマの漫画・アニメ作品と言えば『だがしかし』である。";
            _textView.text = quizText;
            answerFlag = 1;
            break;
            
        case 2:
            quizText = @"問2\n機会費用とは事業や行為に投下した資金・労力のうち、事業や行為の撤退・縮小・中止によっても戻ってこない投下資金または労力を言う。";
            _textView.text = quizText;
            answerFlag = 0;
            break;
            
        case 3:
            quizText = @"問3\nサッカーにて一人の選手が３得点あげるとハットトリックと呼ばれるが、ダーツではブルに３本とも命中した場合にハットトリックと呼ばれる。";
            _textView.text = quizText;
            answerFlag = 1;
            break;
            
        case 4:
            quizText = @"問4\n 生きている間は有名な人で会っても広辞苑に載ることがない。";
            _textView.text = quizText;
            answerFlag = 1;
            break;
            
        case 5:
            quizText = @"問5\n技術的特異点（シンギュラリティ）とは、テクノロジーが急速に変化し、それにより甚大な影響がもたらされ、人間の生活が後戻りできないほどに変容してしまうような、来るべき未来のことである。";
            _textView.text = quizText;
            answerFlag = 1;
            break;
            
        default:
            break;
    }
    
}


- (void)answer2:(id)sender
{
    if (quizAnswer == answerFlag) {
        _textAnswer.text = [NSString stringWithFormat:@"問%01ldは正解です。",(long)quizNo];
        quizResult ++;
        quizNo++;
        NSString *corectSound = @"info-girl1-omedetou1";
        [self playSound:corectSound];
        [self quiz];
    } else {
        _textAnswer.text = [NSString stringWithFormat:@"問%01ldは不正解です。",(long)quizNo];
        quizNo++;
        NSString *wrongSound = @"info-girl1-zannen1";
        [self playSound:wrongSound];
        [self quiz];
    }
    
    if (quizNo == lastQuizNo) {
        [self result];
    }
    
}

- (void)result{
    _textResult.text = [NSString stringWithFormat:@"正解率は%.0f％です",(double)(quizResult/5.0f)*100];
    quizNo = 1;
    quizResult = 0;
    
    //ボタンを隠す
    _batuButton.hidden = YES;
    _maruButton.hidden = YES;
    _resetButton.hidden = NO;
    
    //文言の編集
    _explainText.text = @"リセットボタンを押下してください";
}

- (IBAction)corectAnswer:(id)sender {
    //丸が押された際の制御
    quizAnswer = 1;
    [self answer2:sender];
}

- (IBAction)wrongAnswer:(id)sender {
    //バツが押された際の制御
    quizAnswer = 0;
    [self answer2:sender];
}

- (IBAction)resetButton:(id)sender {
    //結果・集計を元に戻す
    quizNo = 0;
    quizResult = 0;
    
    //ボタンを再表示
    _batuButton.hidden = NO;
    _maruButton.hidden = NO;
    _resetButton.hidden = YES;
    
    //文言を元に戻す
    _explainText.text = @"";
    _textAnswer.text = @"答え";
    _textResult.text = @"結果";
    quizNo++;
    [self quiz];
}

- (void)playSound:(NSString*)scaleName{
    
    //音楽ファイルのファイルパス
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:scaleName ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    //era
    NSError *error = nil;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (error != nil) {
        return;
    }
    [self.player play];
    
}



@end
