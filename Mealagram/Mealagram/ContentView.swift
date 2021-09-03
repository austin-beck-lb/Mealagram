//
//  ContentView.swift
//  Mealagram
//
//  Created by Brandon Shaw on 9/3/21.
//

import SwiftUI
import SlideOverCard

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @State private var showingProfileSheet = false
    @State private var showingQRSheet = false
    @State private var showingDiscoverSheet = false

    var body: some View {
        VStack {
            Text("Mealagram")
                .font(.system(size: 42))
                .fontWeight(.bold)
                .padding()
                .padding(.top, 40)
            Spacer()


            // MARK: Create Profile Button

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
                .cornerRadius(15)
                .padding(5)
            }
            .buttonStyle(MainButtonStyle())
            .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 6)
            .sheet(isPresented: $showingProfileSheet) {
                NavigationView {
                    ProfileView { fullName, userDescription in
                        
                        self.addUser(fullName: fullName, description: userDescription)
                        self.showingProfileSheet = false

                    }
                }
            }


            // MARK: Discover Button

            Button(action: {
                showingDiscoverSheet.toggle()
            }) {
                HStack(alignment: .center, spacing: 15) {
                    Text("Discover")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                .foregroundColor(Color.primary)
                .frame(width: UIScreen.main.bounds.width - 40, height: 60)
                .background(Color("buttonColor"))
                .cornerRadius(15)
                .padding(5)
            }
            .buttonStyle(MainButtonStyle())
            .sheet(isPresented: $showingDiscoverSheet) {
                NavigationView {
                    DiscoverView()
                }
            }
            
            Text("or")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.vertical, 2.5)


            // MARK: QR Code Button

            Button(action: {
                self.showingQRSheet.toggle()
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
                .cornerRadius(15)
                .padding(5)
            }
            .buttonStyle(MainButtonStyle())
            .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 6)

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
        }.background(
            Image("pizza")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width + 200, height: UIScreen.main.bounds.height / 2)
                .clipped()
                .offset(x: 65, y: -UIScreen.main.bounds.height / 5)
        )
        .slideOverCard(isPresented: $showingQRSheet) {
            VStack(alignment: .center) {
                Text("Scan QR Code")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .offset(y: -20)

                Text("Scan any Mealagram QR code to open to the profile.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .offset(y: -10)

                ScanQRView(dimissView: self.$showingQRSheet)
                    .frame(width: UIScreen.main.bounds.width - 150, height: UIScreen.main.bounds.height / 3, alignment: .center)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 0)
                    .padding(.top, 5)
            }
        }
    }


    // MARK: CORE DATA

    func addUser(fullName: String, description: String) {
        let newUser = User(context: managedObjectContext)

        newUser.fullName = fullName
        newUser.userDescription = description

        saveContext()
    }

    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
