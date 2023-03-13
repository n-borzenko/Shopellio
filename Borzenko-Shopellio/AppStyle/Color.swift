//
//  Colors.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import SwiftUI

extension Color {
  static let backgroundColor = Color("BackgroundColor")
  static let textColor = Color("TextColor")
}

struct Color_Previews: PreviewProvider {
  static var previews: some View {
    Text("Text")
      .titleStyle()
      .foregroundColor(Color.textColor)
      .background(Color.backgroundColor)
  }
}
