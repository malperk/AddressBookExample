//
//  FetchingContacts.m
//  AddressBookExample
//
//  Created by Alper KARATAŞ on 24/08/16.
//  Copyright © 2016 Alper KARATAŞ. All rights reserved.
//

#import "FetchingContacts.h"

@implementation FetchingContacts

+ (void)run {
    NSError *err;
    NSArray<NSString *> *names = [self fullNamesOfContactsMatchingName:@"Jane" inStore:[CNContactStore new] error:&err];
    if (err) {
        NSLog(@"%@", err.localizedDescription);
    } else {
        for (NSString *name in names) {
            NSLog(@"%@", name);
        }
    }
}

+ (NSArray<NSString *> *)fullNamesOfContactsMatchingName:(NSString *)name
                                                 inStore:(CNContactStore *)store
                                                   error:(NSError **)error {
    NSPredicate *predicate = [CNContact predicateForContactsMatchingName:name];
    NSArray *keysToFetch = @[ CNContactGivenNameKey, CNContactFamilyNameKey,[CNContactFormatter descriptorForRequiredKeysForStyle:CNContactFormatterStyleFullName]];
    NSArray<CNContact *> *contacts = [store unifiedContactsMatchingPredicate:predicate keysToFetch:keysToFetch error:error];
    if (!contacts) {
        return nil;
    }
    
    NSMutableArray<NSString *> *names = [NSMutableArray arrayWithCapacity:contacts.count];
    for (CNContact *contact in contacts) {
        NSString *fullName = [CNContactFormatter stringFromContact:contact style:CNContactFormatterStyleFullName];
        if (fullName) {
            [names addObject:fullName];
        }
    }
    return names;
}

@end
