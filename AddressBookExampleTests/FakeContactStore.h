//
//  FakeContactStore.h
//  AddressBookExampleTests
//

#import <Contacts/Contacts.h>

NS_ASSUME_NONNULL_BEGIN

// A CNContactStore that never touches the real address book.
@interface FakeContactStore : CNContactStore

@property (nonatomic, copy, nullable) NSArray<CNContact *> *contactsToReturn;
@property (nonatomic, strong, nullable) NSError *errorToReturn;

@property (nonatomic, strong, readonly, nullable) NSPredicate *lastPredicate;
@property (nonatomic, copy, readonly, nullable) NSArray *lastKeysToFetch;
@property (nonatomic, strong, readonly, nullable) CNSaveRequest *lastSaveRequest;

@end

NS_ASSUME_NONNULL_END
