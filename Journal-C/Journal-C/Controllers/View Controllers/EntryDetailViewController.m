//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Jordan Bryant on 9/28/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateViews];
}

- (void)updateViews {
    if (self.entry != nil) {
        self.titleTextField.text = self.entry.title;
        self.bodyTextView.text = self.entry.body;
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry == nil) {
        [[EntryController sharedInstance] addEntryWithTitle: self.titleTextField.text bodyText: self.bodyTextView.text];
    } else {
        [[EntryController sharedInstance] updateEntry: self.entry title: self.titleTextField.text bodyText: self.bodyTextView.text];
    }
    
    [self.navigationController popViewControllerAnimated:true];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}

@end
