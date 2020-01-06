# Aladin

[![Version](https://img.shields.io/cocoapods/v/Aladin.svg?style=flat)](https://cocoapods.org/pods/Aladin)
[![License](https://img.shields.io/cocoapods/l/Aladin.svg?style=flat)](https://cocoapods.org/pods/Aladin)
[![Platform](https://img.shields.io/cocoapods/p/Aladin.svg?style=flat)](https://cocoapods.org/pods/Aladin)


## Requirements

iOS 11.0+

## Getting started

Clone this repo and play around with the included sample app, available at ([`/Example`](Example/)). To add Aladin functionality to your own project, read below.

Note: The app integrates login and storage features, and is a good way to play with Aladin features immediately.

## Adding the SDK to a project

Aladin is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile and run `pod install`:

```ruby
pod 'Aladin', :git => 'https://github.com/ALADINIO/ios-sdk.git'
```

Add `import Aladin` to the top of any file you wish to
invoke the SDK's functionality.

## How to use

Utilize Aladin functionality in your app via the shared instance:
`Aladin.shared.*some_method()*`.

Some of the essentials are described below, but have a look at the documentation for the `Aladin` class to get a better understanding of what's possible. Happy coding!

### Authentication

Authenticate users using their Aladin ID by calling  `Aladin.shared.signIn`. 
A web view will pop up to request their credentials and grant access to your app.

```
Aladin.shared.signIn(redirectURI: URL(string: "urlschema://redirect")!, appDomain: URL(string: "urlschema://")!, scopes: [.storeWrite, .publishData]){ [weak self] authResult in
    switch authResult {
        case .success(let userData):
            print("sign in success")
            print(userData)
        case .cancelled:
            print("sign in cancelled")
        case .failed(let error):
            print("sign in failed, error: ", error ?? "n/a")
    }
}

```

### Storage

Store content to the user's Gaia hub as a file, via the `putFile` method:

```
Aladin.shared.putFile(to: "testFile", text: "Testing 123") {
    publicURL, error in
    // publicURL points to the file in Gaia storage
}
```

Retreive files from the user's Gaia hub with the `getFile` method.

```
Aladin.shared.getFile(at: "testFile") {
    response, error in
    print(response as! String) // "Testing 123"
}
```
Delete files from the user's Gaia hub with the `deleteFile` method.

```
Aladin.shared.deleteFile(at: "testFile", wasSigned: false) { error in
    var message: String?
    if let gaiaError = error as? GaiaError {
        switch gaiaError {
        case .itemNotFoundError:
            message = "'\(filename)' was not found."
        default:
            message = "Something went wrong, could not delete file."
        }
    } else {
        message = "Success! '\(filename)' was deleted."
    }
    print(message)
}

```

List of files from the user's Gaia hub with the `listFiles` method.

```
var files = [String]()
Aladin.shared.listFiles(callback: {
    // Continue until there are no more files
    files.append($0)
    return true
}, completion: { fileCount, error in
    if fileCount > 0 {
        let message = "\(fileCount) files found.\n"
        DispatchQueue.main.async {
            print(message)
        }
        
    }
    else {
        DispatchQueue.main.async {
            print("No File found")
        }
    }
})

```
## Contributing
Please see the [contribution guidelines](CONTRIBUTING.md).

## License

Please see the [license](LICENSE.md) file..
