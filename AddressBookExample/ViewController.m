//
//  ViewController.m
//  AddressBookExample
//
//  Created by Alper KARATAŞ on 24/08/16.
//  Copyright © 2016 Alper KARATAŞ. All rights reserved.
//

#import "ViewController.h"
#import "CreateContact.h"
#import "FetchingContacts.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[CreateContact run];
    [FetchingContacts run];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
