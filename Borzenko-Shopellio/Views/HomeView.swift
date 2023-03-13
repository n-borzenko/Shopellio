//
//  HomeView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 18/02/2023.
//

import SwiftUI

struct HomeView: View {
  @StateObject private var cart = Cart(items: [])
  @State private var aboutIsShown = false

  var body: some View {
    NavigationView {
      ProductGridView(cart: cart)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            AboutToolbarItem(aboutIsShown: $aboutIsShown)
          }
          ToolbarItem(placement: .principal) {
            Image.logoLarge
              .resizable()
              .scaledToFit()
              .padding(.vertical, 4.0)
          }
          ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(destination: CartView(cart: cart)) {
              Image.cart
            }
          }
        }
        .navigationViewStyle(.stack)
        .navigationTitle(Constants.Home.navigationTitle)
        .navigationBarTitleDisplayMode(.large)
        .background(Color.backgroundColor)
    }
  }
}

struct AboutToolbarItem: View {
  @Binding var aboutIsShown: Bool

  var body: some View {
    Button(action: {
      aboutIsShown = true
    }, label: {
      Image.infoCircle
    })
    .sheet(isPresented: $aboutIsShown, onDismiss: {}, content: {
      AboutView(aboutIsShown: $aboutIsShown)
    })
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
