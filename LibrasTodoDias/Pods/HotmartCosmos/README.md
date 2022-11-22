# Cosmos iOS [![Build Status](https://app.bitrise.io/app/c7f5c5f20dee86af/status.svg?token=Hk6IxBNs8d7tB16bYVwubw&branch=master)](https://app.bitrise.io/app/c7f5c5f20dee86af)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS >= 10.0

## Installation

Cosmos iOS is available through [CocoaPods](https://cocoapods.org) using Hotmart ORG private spec reposioty. To install
it, first follow the steps on https://github.com/Hotmart-Org/podspec-repository to configure the repository, than simply add the following line to your Podfile:

```ruby
pod 'HotmartCosmos'
```

## Publish New Release

1. To generate a new Cosmos release, first make sure that all of the content that will be released is in the develop branch;

2. Then go to [Bitrise](https://app.bitrise.io/app/c7f5c5f20dee86af#) and start a new build from `develop` for `update_version` workflow;

3. When the workflow finishes, a pull request with the release changes will be opened to master branch; (Needs two reviews)

4. When the pull request has been merged, create a new release on GitHub following the release number pattern; (don’t forget to add the changelog to the release notes)

5. When you publish the new release, the release workflow will be triggered on Bitrise. The workflow will upload the podspec and example app to Testflight

6. Go to you app and change the version on you podfile.
