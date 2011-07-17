//
//  Lab2ViewController.h
//  Lab2
//
//  Created by Craig Hinrichs on 7/12/11.
//  Copyright 2011 Authentic-Battle-Damage.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lab2ViewController : UIViewController <UITextFieldDelegate> {
    
    UITextField *guessNumberTextField;
    UILabel *lastGuessLabel;
    UIButton *playAgainButton;
    UIButton *guessButton;
    UILabel *guessCounterLabel;
    UILabel *guessResultLabel;
    int randNumber;
    int guessCounter;
}
@property (nonatomic, retain) IBOutlet UILabel *guessResultLabel;
@property (nonatomic, retain) IBOutlet UITextField *guessNumberTextField;
@property (nonatomic, retain) IBOutlet UILabel *lastGuessLabel;
@property (nonatomic, retain) IBOutlet UIButton *playAgainButton;
@property (nonatomic, retain) IBOutlet UIButton *guessButton;
@property (nonatomic, retain) IBOutlet UILabel *guessCounterLabel;
- (IBAction)guessButtonAction:(id)sender;
- (IBAction)playAgainAction:(id)sender;
- (void) resetBoard;
@end
