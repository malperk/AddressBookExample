//
//  FetchingContacts.h
//  AddressBookExample
//
//  Created by Alper KARATAŞ on 24/08/16.
//  Copyright © 2016 Alper KARATAŞ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Contacts/Contacts.h>

NS_ASSUME_NONNULL_BEGIN

@interface FetchingContacts : NSObject

+ (void)run;

// Returns the full names of the contacts whose name matches, or nil on error.
+ (nullable NSArray<NSString *> *)fullNamesOfContactsMatchingName:(NSString *)name
                                                          inStore:(CNContactStore *)store
                                                            error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
