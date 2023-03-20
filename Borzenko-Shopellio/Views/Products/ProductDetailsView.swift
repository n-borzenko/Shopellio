//
//  ProductDetailsView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 20/03/2023.
//

import SwiftUI

struct ProductDetailsView: View {
  var product: Product

  var body: some View {
    Text(product.title)
  }
}

struct ProductDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailsView(product: SampleData.products[0])
  }
}
