//
//  Colors.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import SwiftUI

extension Color {
  static let backgroundColor = Color("BackgroundColor")
  static let cellBackgroundColor = Color("CellBackgroundColor")
  static let textColor = Color("TextColor")
  static let invertedContrastColor = Color("InvertedContrastColor")
  static let toolbarColor = Color("ToolbarColor")
}

extension Color {
  // expects color in hex format: #FF0000
  init?(hex: String) {
    if hex.hasPrefix("#") {
      let red, green, blue: CGFloat
      let start = hex.index(hex.startIndex, offsetBy: 1)
      let hexColor = String(hex[start...])

      if hexColor.count == 6 {
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
          red = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          green = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          blue = CGFloat(hexNumber & 0x000000ff) / 255

          self.init(red: red, green: green, blue: blue)
          return
        }
      }
    }
    return nil
  }
}

struct Color_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ScrollView {
        VStack {
          Text("Text")
            .titleStyle()
          Button("TestButton") {}
            .buttonStyle(.borderedProminent)
            .foregroundColor(.invertedContrastColor)
          RoundedRectangle(cornerRadius: 10)
            .fill(Color.cellBackgroundColor)
            .frame(width: 200, height: 200)
            .overlay {
              Text("Text")
                .defaultStyle()
            }
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .foregroundColor(Color.textColor)
      .background(Color.backgroundColor)
      .navigationTitle("Title")
      .toolbarBackground(Color.toolbarColor)
    }
  }
}
