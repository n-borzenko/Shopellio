![Shopellio logo](https://shopellio.nborzenko.me/report/logo-large.png)

# Shopellio

Capstone project for [Kodeco iOS Bootcamp](https://bootcamp.kodeco.com/accelerator/ios) 2023

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

- static `LaunchScreen.storyboard` with the logo: [Launch screen](https://shopellio.nborzenko.me/report/launch-screen.png)
- animated screen `MainLoadingView.swift` which appears rarely (you need to skip onboarding without network connection first, and on the second launch with poor network connection it will be visible): [Animated splash screen](https://shopellio.nborzenko.me/report/animated-splash-screen.mp4)
- animated loading screen, which appears after network connection errors (turn off all network connections, reinstall the app, skip onboarding, you will get the screen, in case of network link conditioner usage you have to wait until URLSession timeout expires): [Animated network connection issues](https://shopellio.nborzenko.me/report/animated-network-issues.mp4)

### All features are completed

There is no unfinished features in the app.

### Screens with lists

- `ProductGroupsGridView.swift`: [Grid with product groups](https://shopellio.nborzenko.me/report/product-groups-grid.png)
- `ProductsGridView.swift`: [Grid with products](https://shopellio.nborzenko.me/report/products-grid.png)
- `CartView.swift`: [Cart list](https://shopellio.nborzenko.me/report/cart-list.png)

### Product details

- Product list is long and requres scrolling
- Product details `ProductDetailsView.swift` contains images, price, colors, sizes, overview and short review list
- Product details page contains "Add to cart button"
- Application itself contains 3 tabs

[Product details demo](https://shopellio.nborzenko.me/report/product-details-demo.mp4)

### Networking

- Network requests are handles by `APIClient.swift`
- App performs 2 requests for shop and products data during initial loading and caches the results
- Errors during initial download are handled properly: [Animated network connection issues](https://shopellio.nborzenko.me/report/animated-network-issues.mp4)
- Network connection is checked by `NetworkMonitor.swift` if there was an error
- App contains async images `ProductImageView.swift` without caching

### Saving data

- Products, Shop and Cart content data are persisted in json files in application documents folder `Cache.swift`
- Info about completed Onboarding is saved in UserDefaults `Router.swift`

### Empty screens

- Empty states are handled in `ErrorStateView.swift`
- [Empty category](https://shopellio.nborzenko.me/report/empty-category.png)
- [Empty cart](https://shopellio.nborzenko.me/report/empty-cart.png)

### Additional screenshots

- iPhone SE 3rd gen: [1](https://shopellio.nborzenko.me/report/iphone-1.png), [2](https://shopellio.nborzenko.me/report/iphone-2.png), [3](https://shopellio.nborzenko.me/report/iphone-3.png), [4](https://shopellio.nborzenko.me/report/iphone-4.png), [5](https://shopellio.nborzenko.me/report/iphone-5.png), [6](https://shopellio.nborzenko.me/report/iphone-6.png), [7](https://shopellio.nborzenko.me/report/iphone-7.png)
- iPad Pro 11-inch: [1](https://shopellio.nborzenko.me/report/ipad-1.png), [2](https://shopellio.nborzenko.me/report/ipad-2.png), [3](https://shopellio.nborzenko.me/report/ipad-3.png), [4](https://shopellio.nborzenko.me/report/ipad-4.png), [5](https://shopellio.nborzenko.me/report/ipad-5.png), [6](https://shopellio.nborzenko.me/report/ipad-6.png), [7](https://shopellio.nborzenko.me/report/ipad-7.png)

### Code organization

- Files and Folders structure have logic separation between models, views, etc: [project structure](https://shopellio.nborzenko.me/report/code-structure.png)
- SwiftLint is included in building process: [build script](https://shopellio.nborzenko.me/report/swift-lint.png)
- Project builds without errors and warnings: [build result](https://shopellio.nborzenko.me/report/build-result.png)

### Tests

- Project contains 2 unit test cases `BorzenkoShopellioTests` and 2 ui tests `BorzenkoShopellioUITests`
- Tests pass without issues: [test results](https://shopellio.nborzenko.me/report/test-results-1.png)
- Whole code coverage is around 70%: [coverage 1](https://shopellio.nborzenko.me/report/test-results-2.png), [coverage 2](https://shopellio.nborzenko.me/report/test-results-3.png)

### Basic features

- Custom icon `AppIcon` and Display name: [icon and name](https://shopellio.nborzenko.me/report/custom-icon-name.png)
- Onboarding screens in `OnboardingView.swift`: [onboarding 1](https://shopellio.nborzenko.me/report/onboarding-1.png), [onboarding 2](https://shopellio.nborzenko.me/report/onboarding-2.png), [onboarding 3](https://shopellio.nborzenko.me/report/onboarding-3.png)
- Animation in `LoadingView.swift` which is used during data and images loading and on [animated splash screen](https://shopellio.nborzenko.me/report/animated-splash-screen.mp4)
- Text is styled with proper modifiers and there are several styles that are used all over the app: `Text.swift`
