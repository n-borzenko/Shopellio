![Shopellio logo](https://www.nborzenko.me/assets/shopellio/logo-large.png)

# Borzenko-Shopellio

Capstone project for [Kodeco iOS Bootcamp](https://store.kodeco.com/bootcamp/ios) 2023

## Description

Shopellio is an online shop where you can choose a huge variety of different products that can fit anyone's needs. User-friendly interface will help you navigate easily and find the best item possible in almost one touch.

Implemented feature list:

- Onboarding screens
- Hierarchically organazied structure of collections and categories
- Screens with the list of products
- Detailed item screen
- Editable shopping cart list
- Fetching products and shop structure from an external API
- Persisting of products data and cart content

## Implementation details and installation

Project technologies:

- Swift
- SwiftUI
- Modern concurrency

Minimum requirements:

- Screen size: iPhone SE
- iOS 16+

You don't need to install any additional packages to run this application.

## Capstone submission details

### Splash screen

Application includes:

- static `LaunchScreen.storyboard` with the logo
- animated screen `MainLoadingView.swift` which appears rarely (you need to skip onboarding without network connection first, and on the second launch with poor network connection it will be visible)
- animated loading screen, which appears after network connection errors (turn off all network connections, reinstall the app, skip onboarding, you will get the screen, in case of network link conditioner usage you have to wait until URLSession timeout expires)

![Launch screen](https://shopellio.nborzenko.me/report/launch-screen.png)
![Animated splash screen](https://shopellio.nborzenko.me/report/animated-splash-screen.mp4)
![Animated network connection issues](https://shopellio.nborzenko.me/report/animated-network-issues.mp4)
