//
//  TempretureConverterViewController.m
//  TempretureConverter
//
//  Created by Ankit Nitin Shah on 1/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

#import "TempretureConverterViewController.h"

@interface TempretureConverterViewController ()

    @property (weak, nonatomic) IBOutlet UITextField *fahrenhietTextField;
    @property (weak, nonatomic) IBOutlet UITextField *celsiusTextField;
    - (IBAction)convertAction:(id)sender;
    @property (nonatomic) BOOL isCelsiusEditedLast;
    - (IBAction)beginEditingCelcius:(id)sender;
    - (IBAction)beginEditingFahrenheit:(id)sender;
- (IBAction)endEditing:(id)sender;

@end

@implementation TempretureConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertAction:(id)sender {
    [self.view endEditing:true];
    if(!self.isCelsiusEditedLast
       && self.fahrenhietTextField.text != NULL
       && self.fahrenhietTextField.text.length > 0){
        
        float fahrenhietValue = [self.fahrenhietTextField.text floatValue];
        float celsiusValue = ((fahrenhietValue - 32) *5.0) / 9.0;
        self.celsiusTextField.text =  [NSString stringWithFormat:@"%1.2f",celsiusValue];
        
    }else if(self.isCelsiusEditedLast
             && self.celsiusTextField.text != NULL
             && self.celsiusTextField.text.length > 0){
        
        float celsiusValue = [self.celsiusTextField.text floatValue];
        float fahrenheitValue = ((celsiusValue* 9.0)/5.0) + 32;
        self.fahrenhietTextField.text =  [NSString stringWithFormat:@"%1.2f",fahrenheitValue];
        
    }
    
}
- (IBAction)beginEditingCelcius:(id)sender {
    self.isCelsiusEditedLast = true;
}

- (IBAction)beginEditingFahrenheit:(id)sender {
    self.isCelsiusEditedLast = false;
}

- (IBAction)endEditing:(id)sender {
    [self.view endEditing:true];
}

@end
