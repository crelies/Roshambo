fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios beta
```
fastlane ios beta
```
Creates a beta build and uploads it to the MS AppCenter
### ios provision
```
fastlane ios provision
```
Creates the provisioning profiles
### ios screenshot
```
fastlane ios screenshot
```
Takes screenshots
### ios framethem
```
fastlane ios framethem
```
Frames screenshots
### ios setup_release
```
fastlane ios setup_release
```
Sets up release
### ios build
```
fastlane ios build
```
Creates ipa
### ios upload_testflight
```
fastlane ios upload_testflight
```
Uploads to TestFlight
### ios upload
```
fastlane ios upload
```
Uploads to App Store
### ios gogogo
```
fastlane ios gogogo
```
Creates provisioning profiles, takes screenshots, builds and uploads to App Store

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
