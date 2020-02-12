# Rachio Control
## An iOS App to View Your Rachio Configuration

### What is it?

An app to view the existing configuration of your Rachio irrigation controller(s).

Even though named "Control", this app currently allows only read-only viewing of your Rachio controllers.

I created this App for the purpose of quickly viewing the configuration of my irrigation zones. The official app is great, but requires quite a bit of tapping around to see all the settings, and does not have a single place to see a summary. This app allows viewing of the main configuration values in a single list.

This was also an opportunity to play with Combine and SwiftUI.


### Configuration:

1. Set your Developer Team in Xcode in *Signing and Capabilities*.
2. Find the file *RachioConfig.plist* in the Rachio group. Enter your API key. For information regarding obtaining an API key, look [here](https://rachio.readme.io/docs/authentication)

