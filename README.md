MDAMarvelAPI
============

An iOS library to access the [Marvel.com API](https://developer.marvel.com).

## Getting Started with the demo
First you need to initialise all the submodules:
```
$ git submodule update --init --recursive
```

Copy CBPDefines-example to CBPDefines.h and fill in your public and private keys in CBPDefines.h.

The example app currently shows you this week's releases by default and allows you to search to last/next week's releases. Tapping a cell brings you to a (very) crude standalone comic details screen.

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

## Credits

[Karl Monaghan](http://github.com/kmonaghan)  
[@karlmonaghan](https://twitter.com/karlmonaghan)

## License

MDAMarvelAPI is available under the MIT license. See the LICENSE file for more info.

All data fetched is provided by Marvel. © 2014 Marvel.
