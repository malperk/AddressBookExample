//
//  CreateContact.m
//  AddressBookExample
//
//  Created by Alper KARATAŞ on 24/08/16.
//  Copyright © 2016 Alper KARATAŞ. All rights reserved.
//

#import "CreateContact.h"

@implementation CreateContact

+ (void)run {
    NSError *err;
    [self saveContact:[self sampleContact] toStore:[CNContactStore new] error:&err];
    
    if (err) {
        NSLog(@"%@", err.localizedDescription);
    }
}

+ (CNMutableContact *)sampleContact {
    CNMutableContact *contact = [CNMutableContact new];
    
    contact.givenName = @"Jane";
    contact.familyName = @"Doe";
    
    CNLabeledValue *homeEmail = [[CNLabeledValue alloc] initWithLabel:CNLabelHome value:@"jane.doe@example.com"];
    CNLabeledValue *workEmail = [[CNLabeledValue alloc] initWithLabel:CNLabelWork value:@"jane.doe@work.example.com"];
    contact.emailAddresses = @[ homeEmail, workEmail ];
    
    CNLabeledValue *iPhoneTelephone =
    [[CNLabeledValue alloc] initWithLabel:CNLabelPhoneNumberiPhone
                                    value:[CNPhoneNumber phoneNumberWithStringValue:@"(555) 555-0100"]];
    contact.phoneNumbers = @[ iPhoneTelephone ];
    
    CNMutablePostalAddress *homeAddress = [CNMutablePostalAddress new];
    
    homeAddress.street = @"1 Example Street";
    homeAddress.city = @"Springfield";
    homeAddress.postalCode = @"12345";
    contact.postalAddresses = @[ [[CNLabeledValue alloc] initWithLabel:CNLabelHome value:homeAddress] ];
    
    NSDateComponents *birthday = [NSDateComponents new];
    birthday.day = 1;
    birthday.month = 1;
    birthday.year = 1990;
    contact.birthday = birthday;
    
    return contact;
}

+ (BOOL)saveContact:(CNMutableContact *)contact toStore:(CNContactStore *)store error:(NSError **)error {
    CNSaveRequest *saveRequest = [CNSaveRequest new];
    [saveRequest addContact:contact toContainerWithIdentifier:nil];
    return [store executeSaveRequest:saveRequest error:error];
}

@end
