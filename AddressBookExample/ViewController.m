//
//  ViewController.m
//  AddressBookExample
//
//  Created by Alper KARATAŞ on 24/08/16.
//  Copyright © 2016 Alper KARATAŞ. All rights reserved.
//

#import <Contacts/Contacts.h>
#import "ViewController.h"
#import "CreateContact.h"
#import "FetchingContacts.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Ask for Address Book Authorization
    if([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts]!=CNAuthorizationStatusAuthorized){
        [[CNContactStore new] requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if(error){
                NSLog(@"%@",error.localizedFailureReason);
            }else if(granted){
                [self run];
            }
            else{
                NSLog(@"You are not granted for the address book");
            }
        }];
    }
    else{
        [self run];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)run{
    //[CreateContact run];
    [FetchingContacts run];
}
@end
