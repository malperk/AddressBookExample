//
//  CreateContact.h
//  AddressBookExample
//
//  Created by Alper KARATAŞ on 24/08/16.
//  Copyright © 2016 Alper KARATAŞ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Contacts/Contacts.h>

NS_ASSUME_NONNULL_BEGIN

@interface CreateContact : NSObject

+ (void)run;

// Builds the placeholder contact that run saves to the address book.
+ (CNMutableContact *)sampleContact;

+ (BOOL)saveContact:(CNMutableContact *)contact toStore:(CNContactStore *)store error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
