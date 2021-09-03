//
//  ContentView.swift
//  Mealagram
//
//  Created by Brandon Shaw on 9/3/21.
//

import SwiftUI
import SlideOverCard

struct ContentView: View {
    @State private var showingProfileSheet = false
    @State private var showingQRSheet = false

    var body: some View {
        ZStack() {
            Image("pizza")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width + 200, height: UIScreen.main.bounds.height / 2)
                .offset(x: 65, y: -UIScreen.main.bounds.height / 5)
            
            VStack {
                Text("Mealagram")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .padding(.top, 30)
                Spacer()

                Button(action: {
                    showingProfileSheet.toggle()
                }) {
                    HStack(alignment: .center, spacing: 15) {
                       Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .foregroundColor(.primary)
                        
                        Text("Create Profile")
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    .foregroundColor(Color.primary)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 60)
                    .background(Color("buttonColor"))
                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 8)
                    .cornerRadius(15)
                    .padding(5)
                }
                .buttonStyle(MainButtonStyle())
                .sheet(isPresented: $showingProfileSheet) {
                    NavigationView {
                        ProfileView()
                    }
                }
                
                Text("or")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.vertical, 2.5)

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
                    .foregroundColor(Color.primary)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 60)
                    .background(Color.blue)
                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 8)
                    .cornerRadius(15)
                    .padding(5)
                }
                .buttonStyle(MainButtonStyle())
                .slideOverCard(isPresented: $showingQRSheet) {
                    VStack(alignment: .center) {
                        Text("Scan QR Code")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .offset(y: -20)

                        Text("Scan any Chatr QR code to open to the profile.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .offset(y: -10)

    //                    ScanQRView(dimissView: self.$dimissView)
    //                        .environmentObject(self.auth)
    //                        .frame(width: .infinity, height: Constants.screenWidth / 1.2, alignment: .center)
    //                        .cornerRadius(20)
    //                        .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 0)
    //                        .padding(.top, 5)
                    }
                }

                Button(action: { }) {
                    Text("Already have a QR Code? \nRecover your QR code here!")
                        .multilineTextAlignment(.center)
                        .font(.caption)
                        .lineLimit(2)
                        .foregroundColor(Color.secondary)
                        .frame(width: UIScreen.main.bounds.width - 40)
                }
                .buttonStyle(MainButtonStyle())
                .padding(.bottom, 30)
                
                Image("powered_by")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
