//
//  Lab2ViewController.m
//  Lab2
//
//  Created by Craig Hinrichs on 7/12/11.
//  Copyright 2011 Authentic-Battle-Damage.com. All rights reserved.
//

#import "Lab2ViewController.h"

@implementation Lab2ViewController
@synthesize guessResultLabel;
@synthesize guessNumberTextField;
@synthesize lastGuessLabel;
@synthesize playAgainButton;
@synthesize guessCounterLabel;

- (void)dealloc
{
    [guessNumberTextField release];
    [guessResultLabel release];
    [guessCounterLabel release];
    [playAgainButton release];
    [lastGuessLabel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self resetBoard];
}


- (void) resetBoard {
    randNumber = arc4random() % 100;
    guessCounter =0;
    [guessResultLabel setText:@"Guess"];
    [guessCounterLabel setText:@"Guess Count: 0"];
    [lastGuessLabel setHidden:YES];
    [lastGuessLabel setText:@""];
    [playAgainButton setHidden:YES];
    
     
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [guessNumberTextField resignFirstResponder];
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [guessNumberTextField resignFirstResponder];
    return YES;
}

- (void)viewDidUnload
{
    [self setGuessNumberTextField:nil];
    [self setGuessResultLabel:nil];
    [self setGuessCounterLabel:nil];
    [self setPlayAgainButton:nil];
    [self setLastGuessLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)guessButtonAction:(id)sender {
   
    guessCounter++;
    
    int guessValue = [[guessNumberTextField text] intValue];
    [guessCounterLabel setText: [NSString stringWithFormat:@"Guess Count: %d",guessCounter]];
    [guessResultLabel setTextColor:[UIColor blackColor]];
    [guessResultLabel setText:@"Guess"];
    if(guessValue < 1 || guessValue > 100) {
        [guessResultLabel setTextColor:[UIColor redColor]];
        [guessResultLabel setText:@"Please enter a number between 1 and 100"];
    } else if(guessValue == randNumber) {
        [guessResultLabel setText:@"Got It - Play again!"];
        [playAgainButton setHidden:NO];
         

    } else if(guessValue > randNumber) {
         [guessResultLabel setText:@"Too High"];
    }else if(guessValue < randNumber) {
        [guessResultLabel setText:@"Too Low"];
    }
    [lastGuessLabel setText:[NSString stringWithFormat:@"Last Guess: %i",guessValue]];
    if(guessCounter==1) {
        [lastGuessLabel setHidden:NO];
    }
    [guessNumberTextField setText:@""];
    [guessNumberTextField resignFirstResponder];
}

- (IBAction)playAgainAction:(id)sender {
    [self resetBoard];
}
@end
