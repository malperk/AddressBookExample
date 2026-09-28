//
//  FakeContactStore.m
//  AddressBookExampleTests
//

#import "FakeContactStore.h"

@interface FakeContactStore ()
@property (nonatomic, strong, readwrite, nullable) NSPredicate *lastPredicate;
@property (nonatomic, copy, readwrite, nullable) NSArray *lastKeysToFetch;
@property (nonatomic, strong, readwrite, nullable) CNSaveRequest *lastSaveRequest;
@end

@implementation FakeContactStore

- (NSArray<CNContact *> *)unifiedContactsMatchingPredicate:(NSPredicate *)predicate
                                               keysToFetch:(NSArray<id<CNKeyDescriptor>> *)keys
                                                     error:(NSError **)error {
    self.lastPredicate = predicate;
    self.lastKeysToFetch = keys;
    if (self.errorToReturn) {
        if (error) {
            *error = self.errorToReturn;
        }
        return nil;
    }
    return self.contactsToReturn ?: @[];
}

- (BOOL)executeSaveRequest:(CNSaveRequest *)saveRequest error:(NSError **)error {
    self.lastSaveRequest = saveRequest;
    if (self.errorToReturn) {
        if (error) {
            *error = self.errorToReturn;
        }
        return NO;
    }
    return YES;
}

@end
