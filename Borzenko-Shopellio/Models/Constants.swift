//
//  Constants.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import Foundation

enum Constants {
  enum General {
    //    static let welcomeTextKerning = 1.4
    static let headlineTextLineSpacing = 6.0
    //
    static let unavailableString = "n/a"
    static let newArrivalTag = "new"
    //    static let doneAction = "Done"
    //    static let imagesAspectRatio = CGSize(width: 3, height: 4)
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
    static let colorCircleRowSize = 16.0
    static let colorCircleBorderWidth = 1.0
    static let colorCircleLimit = 5
    static let tagRowCornerRadius = 4.0
    static let tagRowHorizontalPadding = 4.0
  }

  enum Product {
    static let imagePlaceholderScale = 0.2
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

//  enum Product {
//    static let borderWidth = 2.0
//    static let cornerRadius = 8.0
//    static let gridVerticalSpacing = 20.0
//    static let gridColumnMinWidth = 160.0
//    static let gridColumnsCount = 2
//    static let horizontalActionsSpacing = 40.0
//
//    static let maxLineCount = 2
  //    static let maxRating = 5
  //
  //    static let reviews = "Reviews:"
  //    static let toggleLabel = "Hide items without category"
  //    static let cartContentLabel = "In the cart:"
  //    static let addToCartLabel = "Add to cart"
  //  }

  enum Cart {
    //    static let verticalSpacing = 20.0
    //    static let itemListSpacing = 10.0
    //
    static let navigationTitle = "Cart"
    static let checkoutButtonTitle = "Checkout"
    static let contentSectionTitle = "Content"
    static let summarySectionTitle = "Summary"
    static let summaryItemsCount = "Items count:"
    static let summaryBeforeDiscount = "Before discount:"
    static let summaryDiscountedAmount = "Discounted amount:"
    static let summarytotalAmount = "Total amount:"
    static let rowColorLabel = "Color:"
    static let rowSizeLabel = "Size:"
    static let rowCountLabel = "Count:"

    //    static let totalTitle = "Total:"
    //    static let discount = "Current discount"
    //    static let totalAfterDiscountTitle = "Total amount after discount:"
  }
}
