//
//  Images.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 12/03/2023.
//

import SwiftUI

extension Image {
  static let logoLarge = Image("LogoLarge")
  static let infoCircle = Image(systemName: "info.circle")
  static let emptyCircle = Image(systemName: "circle")
  static let checkmarkCircle = Image(systemName: "checkmark.circle")
  static let cart = Image(systemName: "cart")
  static let squareStack = Image(systemName: "square.stack.3d.down.right")
  static let flame = Image(systemName: "flame")
  static let photo = Image(systemName: "photo")
  static let plusCircle = Image(systemName: "plus.circle")
  static let minusCircle = Image(systemName: "minus.circle")
  static let xCircleFill = Image(systemName: "x.circle.fill")
  static let basket = Image(systemName: "basket")
  static let wifi = Image(systemName: "wifi")
  static let wifiSlash = Image(systemName: "wifi.slash")
  static let starFill = Image(systemName: "star.fill")
  static let star = Image(systemName: "star")
  static let mCircle = Image(systemName: "m.circle")
  static let wCircle = Image(systemName: "w.circle")
  static let percent = Image(systemName: "percent")
}

struct Image_Previews: PreviewProvider {
  static var previews: some View {
    VStack(spacing: 16) {
      Image.logoLarge
      HStack {
        Image.infoCircle
        Image.emptyCircle
        Image.checkmarkCircle
        Image.cart
        Image.squareStack
        Image.photo
        Image.starFill
        Image.star
      }
      HStack {
        Image.plusCircle
        Image.minusCircle
        Image.xCircleFill
        Image.basket
        Image.wifi
        Image.wifiSlash
        Image.flame
        Image.percent
        Image.mCircle
        Image.wCircle
      }
    }
  }
}
