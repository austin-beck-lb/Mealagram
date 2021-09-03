//
//  ThankYouView.swift
//  Mealagram
//
//  Created by Brandon Shaw on 9/3/21.
//

import SwiftUI

struct ThankYouView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Thank you!")
                .font(.system(size: 42))
                .padding(.top, 70)
            Spacer()
            Button(action: {
                
            }) {
                Text("Share")
                    .foregroundColor(Color.primary)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 60)
                    .background(Color("buttonColor"))
                    .cornerRadius(15)
                    .padding(5)
            }
            .padding()
            .buttonStyle(MainButtonStyle())
            .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 6)
        }
        .navigationTitle("Order Completed")
        .navigationBarTitleDisplayMode(.inline)
        .background(
            Image("pizza")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width + 200, height: UIScreen.main.bounds.height / 2)
                .clipped()
                .offset(x: 65, y: -UIScreen.main.bounds.height / 5)
                .opacity(0.2)
    )
    }
}

struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ThankYouView()
        }
    }
}
