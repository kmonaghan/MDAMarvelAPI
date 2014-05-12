MDAMarvelAPI
============

[![Version](http://cocoapod-badges.herokuapp.com/v/MDAMarvelAPI/badge.png)](http://cocoadocs.org/docsets/MDAMarvelAPI)
[![Platform](http://cocoapod-badges.herokuapp.com/p/MDAMarvelAPI/badge.png)](http://cocoadocs.org/docsets/MDAMarvelAPI)

An unofficial iOS library to access the [Marvel.com API](https://developer.marvel.com).

## Getting Started with the demo
The example uses [Cocoapods](http://cocoapods.org/). From within the `Example` folder you should run the following:
```
pod install
```

Copy `CBPDefines-example.h` to `CBPDefines.h` and fill in your public and private keys in CBPDefines.h.

The example app currently shows you this week's releases by default and allows you to search to last/next week's releases. Tapping a cell brings you to a (very) crude standalone comic details screen.

## Installation
#### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AFNetworking in your projects.

Add the follow to your podfile:

```ruby
pod "MDAMarvelAPI", "~> 0.1.0"
```

#### Manual
Copy the contents of the `MDAMarvelAPI` folder into your project.

## Usage
Include `MDAMarvelAPIClient.h` and `NSURLSessionDataTask+MarvelDeveloperAPI.h` where ever you want to be able to access the Marvel API.

For example, if we wanted to view the details of "Avengers Assemble #24" which we know has an id of 48564 and save the result of an instance variable called `comic`, we simply perform the following call:
``` objective-c
    __weak typeof(self) blockSelf = self;
    
    NSInteger comicId = 48564;
    
    [NSURLSessionDataTask fetchComicWithId:comicId
                                withBlock:^(MDAComic *comic, NSError *error) {
                                    blockSelf.comic = comic;
    }];
```

## Requirements

MDAMarvelAPI requires [iOS 7.0](https://developer.apple.com/library/ios/releasenotes/General/WhatsNewIniOS/Articles/iOS7.html) and above.

MDAMarvelAPI uses [AFNetworking](https://github.com/AFNetworking/AFNetworking) for network connectivity.
### ARC
MDAMarvelAPI uses ARC.


## Contributing
First of all, **thank you** for contributing, **you are awesome**!

Please, write [commit messages that make
sense](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html),
and [rebase your branch](http://git-scm.com/book/en/Git-Branching-Rebasing)
before submitting your Pull Request.

One may ask you to [squash your
commits](http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html)
too. This is used to "clean" your Pull Request before merging it (we don't want
commits such as `fix tests`, `fix 2`, `fix 3`, etc.).

Thank you!

## Contact
Karl Monaghan

* http://github.com/kmonaghan 
* http://karlmonaghan.com 
* https://twitter.com/karlmonaghan

## License

MDAMarvelAPI is available under the MIT license. See the LICENSE file for more info.

All data fetched is provided by Marvel. © 2014 Marvel.
