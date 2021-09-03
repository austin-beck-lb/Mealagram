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
                HStack(alignment: .center, spacing: 15) {
                   Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.primary)
                    
                    Text("Create Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
            }
            .foregroundColor(Color.primary)
            .frame(width: UIScreen.main.bounds.width - 40, height: 60)
            .background(Color("buttonColor"))
            .cornerRadius(15)
            .padding(5)
            .sheet(isPresented: $showingSheet) {
                NavigationView {
                    ProfileView()
                }
            }
            
            Text("or")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.vertical, 5)

            Button(action: {
                
            }) {
                HStack(alignment: .center, spacing: 15) {
                   Image(systemName: "qrcode.viewfinder")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .foregroundColor(.white)
                    
                    Text("Scan QR Code")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
            }
            .foregroundColor(Color.primary)
            .frame(width: UIScreen.main.bounds.width - 40, height: 60)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(5)

            Button(action: { }) {
                Text("Already have a QR Code? Select this link to scan here!")
            }
            .font(.caption)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .foregroundColor(Color.secondary)
            .frame(width: UIScreen.main.bounds.width - 40, height: 60)
            .padding(.bottom, 50)
            
            Image("powered_by")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
