//
//  ContentView.swift
//  Mealagram
//
//  Created by Brandon Shaw on 9/3/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false

    var body: some View {
        VStack {
            Text("Mealagram")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Spacer()

            Button(action: {
                showingSheet.toggle()
            }) {
                Text("Create Profile")
            }
            .sheet(isPresented: $showingSheet) {
                ProfileView()
            }
            .foregroundColor(Color.black)
            .frame(width: 250, height: 30)
            .border(Color.gray)
            .padding(5)

            Button(action: { }) {
                Text("Scan QR Code")
            }
            .foregroundColor(Color.white)
            .frame(width: 250, height: 30)
            .background(Color.blue)
            .border(Color.gray)
            .padding(5)

            Button(action: { }) {
                Text("Already have a QR Code? Select this link to scan here!")
            }
            .font(.system(size: 10))
            .lineLimit(2)
            .foregroundColor(Color.primary)
            .frame(width: 170)
            .padding(.bottom, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
