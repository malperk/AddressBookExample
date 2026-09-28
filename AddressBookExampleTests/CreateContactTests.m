//
//  CreateContactTests.m
//  AddressBookExampleTests
//

#import <XCTest/XCTest.h>
#import "CreateContact.h"
#import "FakeContactStore.h"

@interface CreateContactTests : XCTestCase
@end

@implementation CreateContactTests

- (void)testSampleContactHasPlaceholderName {
    CNMutableContact *contact = [CreateContact sampleContact];

    XCTAssertEqualObjects(contact.givenName, @"Jane");
    XCTAssertEqualObjects(contact.familyName, @"Doe");
}

- (void)testSampleContactHasHomeAndWorkEmails {
    CNMutableContact *contact = [CreateContact sampleContact];

    XCTAssertEqual(contact.emailAddresses.count, 2);
    XCTAssertEqualObjects(contact.emailAddresses[0].label, CNLabelHome);
    XCTAssertEqualObjects(contact.emailAddresses[0].value, @"jane.doe@example.com");
    XCTAssertEqualObjects(contact.emailAddresses[1].label, CNLabelWork);
    XCTAssertEqualObjects(contact.emailAddresses[1].value, @"jane.doe@work.example.com");
}

- (void)testSampleContactEmailsUseReservedExampleDomain {
    for (CNLabeledValue<NSString *> *email in [CreateContact sampleContact].emailAddresses) {
        XCTAssertTrue([email.value hasSuffix:@"example.com"], @"%@ is not a placeholder address", email.value);
    }
}

- (void)testSampleContactHasFictionalPhoneNumber {
    CNMutableContact *contact = [CreateContact sampleContact];

    XCTAssertEqual(contact.phoneNumbers.count, 1);
    XCTAssertEqualObjects(contact.phoneNumbers[0].label, CNLabelPhoneNumberiPhone);
    XCTAssertEqualObjects(contact.phoneNumbers[0].value.stringValue, @"(555) 555-0100");
}

- (void)testSampleContactHasHomeAddress {
    CNMutableContact *contact = [CreateContact sampleContact];

    XCTAssertEqual(contact.postalAddresses.count, 1);
    XCTAssertEqualObjects(contact.postalAddresses[0].label, CNLabelHome);
    CNPostalAddress *address = contact.postalAddresses[0].value;
    XCTAssertEqualObjects(address.street, @"1 Example Street");
    XCTAssertEqualObjects(address.city, @"Springfield");
    XCTAssertEqualObjects(address.postalCode, @"12345");
}

- (void)testSampleContactHasBirthday {
    NSDateComponents *birthday = [CreateContact sampleContact].birthday;

    XCTAssertEqual(birthday.day, 1);
    XCTAssertEqual(birthday.month, 1);
    XCTAssertEqual(birthday.year, 1990);
}

- (void)testSaveContactExecutesSaveRequestOnStore {
    FakeContactStore *store = [FakeContactStore new];
    NSError *error;

    BOOL saved = [CreateContact saveContact:[CreateContact sampleContact] toStore:store error:&error];

    XCTAssertTrue(saved);
    XCTAssertNil(error);
    XCTAssertNotNil(store.lastSaveRequest);
}

- (void)testSaveContactReportsStoreError {
    FakeContactStore *store = [FakeContactStore new];
    store.errorToReturn = [NSError errorWithDomain:CNErrorDomain code:CNErrorCodeAuthorizationDenied userInfo:nil];
    NSError *error;

    BOOL saved = [CreateContact saveContact:[CreateContact sampleContact] toStore:store error:&error];

    XCTAssertFalse(saved);
    XCTAssertEqualObjects(error, store.errorToReturn);
}

@end
