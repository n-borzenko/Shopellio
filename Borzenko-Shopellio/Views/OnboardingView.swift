//
//  OnboardingView.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import SwiftUI

struct OnboardingView: View {
  @Binding var onboardingIsShown: Bool
  
  var body: some View {
    VStack(spacing: 20) {
      OnboardingTopView(onboardingIsShown: $onboardingIsShown)
      
      ScrollView {
        VStack(alignment: .leading, spacing: 40) {
          HeadlineTextView(text: "Shopellio is an online shop where you can buy a huge variety of different goods that can fit anyone's needs. User-friendly interface will help you navigate easily and choose the best item possible in almost one touch. Please, enjoy the application and share your experience and thoughts!")
          
          FeatureListView()
          
          HStack {
            Spacer()
            FootnoteTextView(text: "This app is a prototype of the Capstone project for Kodeco iOS Bootcamp 2023.")
            Spacer()
          }
        }
        .padding([.leading, .trailing, .bottom])
      }
    }
  }
}

struct OnboardingTopView: View {
  @Binding var onboardingIsShown: Bool
  
  var body: some View {
    HStack {
      Spacer()
      Button(action: {
        onboardingIsShown = false
      }) {
        ImageCircleView(systemName: "xmark.circle")
      }
    }
    .padding([.leading, .trailing, .top])
  }
}

struct FeatureListView: View {
  private let plannedFeatureList = FeatureList()
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      TitleTextView(text: "Planned feature list")
      
      ForEach(plannedFeatureList.content, id: \.self) { feature in
        HStack(alignment: .firstTextBaseline, spacing: 8) {
          Image(systemName: feature.implemented ? "checkmark.circle" : "circle")
            .foregroundColor(.accentColor)
          TextView(text: feature.title)
        }
      }
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView(onboardingIsShown: .constant(true))
  }
}
