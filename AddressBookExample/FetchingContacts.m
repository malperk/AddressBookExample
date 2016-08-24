//
//  FetchingContacts.m
//  AddressBookExample
//
//  Created by Alper KARATAŞ on 24/08/16.
//  Copyright © 2016 Alper KARATAŞ. All rights reserved.
//

#import "FetchingContacts.h"
#import <Contacts/Contacts.h>

@implementation FetchingContacts

+ (void)run {
    NSPredicate *predicate = [CNContact predicateForContactsMatchingName:@"alper"];
    NSArray *keysToFetch = @[ CNContactGivenNameKey, CNContactFamilyNameKey ];
    CNContactStore *store = [CNContactStore new];
    NSError *err;
    NSArray *contacts = [store unifiedContactsMatchingPredicate:predicate keysToFetch:keysToFetch error:&err];
    if (err) {
        NSLog(@"%@", err.localizedDescription);
    } else {
        for (CNContact *contact in contacts) {
            NSLog(@"%@", [CNContactFormatter stringFromContact:contact style:CNContactFormatterStyleFullName]);
        }
    }
    
    [CNContactFormatter descriptorForRequiredKeysForStyle:CNContactFormatterStyleFullName];
    let contactStore = CNContactStore()
    let predicate = CNContact.predicateForContactsMatchingName("John")
    let foundContacts = try contactStore.unifiedContactsMatchingPredicate(predicate, keysToFetch: [CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName)]
                                                                          for contact in foundContacts {
                                                                              print(CNContactFormatter.stringFromContact(contact, style: .FullName))
                                                                          }[]
    

                                                                          
}

@end
