//
//  ViewController.m
//  autolayout-textview-ios-0616
//
//  Created by Matt Amerige on 6/27/16.
//  Copyright © 2016 Wubbyland. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (strong, nonnull) NSLayoutConstraint *textViewBottomAnchorConstraint;


@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self applyConstraints];
}

- (void)removeDefaultContraints
{
	self.view.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view removeConstraints:self.view.constraints];
	
	self.textView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.textView removeConstraints:self.textView.constraints];
	
	self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self.leftButton removeConstraints:self.leftButton.constraints];
	
	self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self.rightButton removeConstraints:self.rightButton.constraints];
}

- (void)applyConstraints
{
	[self removeDefaultContraints];
	
	[self applyUniversalConstraints];
}

- (void)applyUniversalConstraints
{
	// TextView Constraints
	[self.textView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20].active = YES;
	[self.textView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
	[self.textView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
	
	self.textViewBottomAnchorConstraint = [self.textView.bottomAnchor constraintEqualToAnchor:self.leftButton.topAnchor constant:-20];
	self.textViewBottomAnchorConstraint.active = YES;
	
	
	// Left Button Constraints
	[self.leftButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
	[self.leftButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active = YES;
	
	// Right Button Constraints
	[self.rightButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
	[self.rightButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active = YES;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
	if (self.traitCollection.horizontalSizeClass != previousTraitCollection.horizontalSizeClass ||
			self.traitCollection.verticalSizeClass != previousTraitCollection.verticalSizeClass) {
		
		if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
			self.textViewBottomAnchorConstraint.constant = -10;
		}
		else {
			self.textViewBottomAnchorConstraint.constant = -20;
		}
		
	}
}






@end
