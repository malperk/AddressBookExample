//
//  FetchingContactsTests.m
//  AddressBookExampleTests
//

#import <XCTest/XCTest.h>
#import "FetchingContacts.h"
#import "FakeContactStore.h"

@interface FetchingContactsTests : XCTestCase
@end

@implementation FetchingContactsTests

- (CNMutableContact *)contactWithGivenName:(NSString *)givenName familyName:(NSString *)familyName {
    CNMutableContact *contact = [CNMutableContact new];
    contact.givenName = givenName;
    contact.familyName = familyName;
    return contact;
}

- (void)testReturnsFullNamesOfMatchingContacts {
    FakeContactStore *store = [FakeContactStore new];
    store.contactsToReturn = @[ [self contactWithGivenName:@"Jane" familyName:@"Doe"],
                                [self contactWithGivenName:@"Jane" familyName:@"Roe"] ];
    NSError *error;

    NSArray<NSString *> *names = [FetchingContacts fullNamesOfContactsMatchingName:@"Jane" inStore:store error:&error];

    XCTAssertNil(error);
    XCTAssertEqualObjects(names, (@[ @"Jane Doe", @"Jane Roe" ]));
}

- (void)testReturnsEmptyArrayWhenNothingMatches {
    FakeContactStore *store = [FakeContactStore new];
    NSError *error;

    NSArray<NSString *> *names = [FetchingContacts fullNamesOfContactsMatchingName:@"Nobody" inStore:store error:&error];

    XCTAssertNil(error);
    XCTAssertEqualObjects(names, @[]);
}

- (void)testSkipsContactsWithoutAName {
    FakeContactStore *store = [FakeContactStore new];
    store.contactsToReturn = @[ [self contactWithGivenName:@"" familyName:@""],
                                [self contactWithGivenName:@"Jane" familyName:@"Doe"] ];

    NSArray<NSString *> *names = [FetchingContacts fullNamesOfContactsMatchingName:@"Jane" inStore:store error:NULL];

    XCTAssertEqualObjects(names, @[ @"Jane Doe" ]);
}

- (void)testSearchesStoreWithNamePredicateAndNameKeys {
    FakeContactStore *store = [FakeContactStore new];

    [FetchingContacts fullNamesOfContactsMatchingName:@"Jane" inStore:store error:NULL];

    XCTAssertEqualObjects(store.lastPredicate, [CNContact predicateForContactsMatchingName:@"Jane"]);
    XCTAssertTrue([store.lastKeysToFetch containsObject:CNContactGivenNameKey]);
    XCTAssertTrue([store.lastKeysToFetch containsObject:CNContactFamilyNameKey]);
}

- (void)testReturnsNilAndErrorWhenStoreFails {
    FakeContactStore *store = [FakeContactStore new];
    store.errorToReturn = [NSError errorWithDomain:CNErrorDomain code:CNErrorCodeAuthorizationDenied userInfo:nil];
    NSError *error;

    NSArray<NSString *> *names = [FetchingContacts fullNamesOfContactsMatchingName:@"Jane" inStore:store error:&error];

    XCTAssertNil(names);
    XCTAssertEqualObjects(error, store.errorToReturn);
}

@end
