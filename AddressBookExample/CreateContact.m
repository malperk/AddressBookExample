//
//  CreateContact.m
//  AddressBookExample
//
//  Created by Alper KARATAŞ on 24/08/16.
//  Copyright © 2016 Alper KARATAŞ. All rights reserved.
//

#import "CreateContact.h"
#import <Contacts/Contacts.h>

@implementation CreateContact

+ (void)run {
    CNMutableContact *contact = [CNMutableContact new];
    
    contact.givenName = @"Alper";
    contact.familyName = @"Karataş";
    
    CNLabeledValue *homeEmail = [[CNLabeledValue alloc] initWithLabel:CNLabelHome value:@"karatas.alper@yahoo.com"];
    CNLabeledValue *workEmail = [[CNLabeledValue alloc] initWithLabel:CNLabelWork value:@"malperk@gmail.com"];
    contact.emailAddresses = @[ homeEmail, workEmail ];
    
    CNLabeledValue *iPhoneTelephone =
    [[CNLabeledValue alloc] initWithLabel:CNLabelPhoneNumberiPhone
                                    value:[CNPhoneNumber phoneNumberWithStringValue:@"(532)1234567"]];
    contact.phoneNumbers = @[ iPhoneTelephone ];
    
    CNMutablePostalAddress *homeAddress = [CNMutablePostalAddress new];
    
    homeAddress.street = @"My Street Address";
    homeAddress.city = @"İstanbul";
    homeAddress.postalCode = @"34000";
    contact.postalAddresses = @[ [[CNLabeledValue alloc] initWithLabel:CNLabelHome value:homeAddress] ];
    
    NSDateComponents *birthday = [NSDateComponents new];
    birthday.day = 1;
    birthday.month = 8;
    birthday.year = 1982;
    contact.birthday = birthday;
    
    // Save Values
    CNContactStore *store = [CNContactStore new];
    CNSaveRequest *saveRequest = [CNSaveRequest new];
    [saveRequest addContact:contact toContainerWithIdentifier:nil];
    NSError *err;
    [store executeSaveRequest:saveRequest error:&err];
    
    if (err) {
        NSLog(@"%@", err.localizedDescription);
    }
}

@end
