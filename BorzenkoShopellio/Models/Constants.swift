//
//  Constants.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import Foundation

enum Constants {
  enum General {
    static let headlineTextLineSpacing = 6.0
    static let unavailableString = "n/a"
  }

  enum Main {
    static let productsTitle = "Products"
    static let newArrivalsTitle = "New Arrivals"
    static let cartTitle = "Cart"
    static let aboutTitle = "About"
  }

  enum Products {
    static let navigationTitle = "Categories"
    static let unselectedSubcategoryText = "Select subcategory"
    static let unselectedProductText = "Select product"

    static let productRowHeight = 100.0
    static let titleRowLineLimit = 2
  }

  enum Product {
    static let imagePlaceholderScale = 0.2

    static let colorCircleSmallSize = 16.0
    static let colorCircleLargeSize = 32.0
    static let colorCircleBorderWidth = 1.0
    static let colorCircleLimit = 5
    static let colorCircleSmallLineWidth = 3.0
    static let colorCircleLargeLineWidth = 5.0
    static let colorCircleGradientStops = [ 0.46, 0.48, 0.52, 0.54 ]

    static let newArrivalTag = "new"
    static let tagCornerRadius = 4.0
    static let tagHorizontalPadding = 4.0

    static let sizeLabelSmallCornerRadius = 4.0
    static let sizeLabelLargeCornerRadius = 8.0
    static let sizeLabelSmallHorizontalPadding = 4.0
    static let sizeLabelSmallVerticalPadding = 0.0
    static let sizeLabelLargeHorizontalPadding = 12.0
    static let sizeLabelLargeVerticalPadding = 6.0
    static let sizeLabelUnavailableOpacity = 0.5
    static let sizeLabelDefaultOpacity = 1.0
    static let sizeLabelBorderWidth = 1.0
  }

  enum ProductDetails {
    static let animationStepDuration = 0.5

    static let colorsListLabel = "Colors:"
    static let sizesListLabel = "Sizes:"
    static let selectVariantButtonLabel = "Select variant"

    static let selectionBorderWidth = 2.0

    static let selectColorLabel = "Select color:"
    static let colorLabel = "Color:"
    static let colorStackSpacing = 12.0
    static let colorSelectionWidth = 44.0


    static let selectSizeLabel = "Select size:"
    static let sizeLabel = "Size:"
    static let sizeCornerRadiusOffset = 2.0
    static let sizesGridSpacing = 10.0
    static let sizesMinColumnWidth = 70.0

    static let addToCartButtonTitle = "Add to cart"
  }

  enum NewArrivals {
    static let navigationTitle = "New Arrivals"
    static let categoryPickerLabel = "Category"

    static let gridItemMaxWidth = 220.0
    static let gridItemMinWidth = 160.0
    static let cellAspectRatio = CGSize(width: 3, height: 5)
    static let cellPadding = 8.0
    static let cellCornerRadius = 16.0
  }

  enum About {
    static let navigationTitle = "About"
    static let verticalSpacing = 20.0
    static let featureListSpacing = 10.0

    static let headlineText = "Shopellio is an online shop " +
    "where you can buy a huge variety of different products that can fit anyone's needs. " +
    "User-friendly interface will help you navigate easily and choose the best item possible in almost one touch. " +
    "Please, enjoy the application and share your experience and thoughts!"
    static let creditsText = "Images are selected from:"
    static let imageSourceTitle = "Unsplash"
    static let imageSourceUrl = "https://unsplash.com/license"
    static let footnoteText = "This app is a prototype of the Capstone project for Kodeco iOS Bootcamp 2023."
    static let listTitle = "Planned feature list"
  }

  enum Cart {
    static let titleRowLineLimit = 2

    static let navigationTitle = "Cart"
    static let checkoutButtonTitle = "Checkout"
    static let contentSectionTitle = "Content"
    static let summarySectionTitle = "Summary"
    static let summaryItemsCount = "Items count:"
    static let summaryBeforeDiscount = "Before discount:"
    static let summaryDiscountedAmount = "Discounted amount:"
    static let summaryTotalAmount = "Total amount:"
    static let rowColorLabel = "Color:"
    static let rowSizeLabel = "Size:"
    static let rowCountLabel = "Count:"
  }
}
