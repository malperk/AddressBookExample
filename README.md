# AddressBookExample

The Contacts framework demonstration

https://developer.apple.com/documentation/contacts

The app asks for contacts access on launch, then logs the full names of the
contacts matching "Jane" to the console. `CreateContact` can also save a
placeholder contact (Jane Doe); enable it in `ViewController.m`'s `run` method.

## Requirements

- Xcode (tested with Xcode 27)
- iOS 15.0 or later

## Build

```bash
xcodebuild -project AddressBookExample.xcodeproj -scheme AddressBookExample -destination 'platform=iOS Simulator,name=iPhone 16 Pro' build
```

## Test

```bash
xcodebuild -project AddressBookExample.xcodeproj -scheme AddressBookExample -destination 'platform=iOS Simulator,name=iPhone 16 Pro' test
```

The tests use a fake `CNContactStore`, so they do not read or change the
simulator's contacts.
