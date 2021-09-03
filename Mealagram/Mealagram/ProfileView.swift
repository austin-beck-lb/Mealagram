//
//  ProfileView.swift
//  Mealagram
//
//  Created by Austin Beck on 9/3/21.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var profileName = ""
    @State var profileDescription = ""

    var body: some View {
        VStack {
            Button(action: {
                        print("Round Action")
                        }) {
                        Text("+")
                            .frame(width: 100, height: 100)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
            .font(.title)
            .padding(5)
            Text("Add Image")
                .font(.system(size: 10))
            VStack {
                TextField("Full name", text: $profileName)
                    .font(.system(size: 10))
                    .padding(10)
                Spacer()
                TextField("Description..", text: $profileDescription)
                    .font(.system(size: 10))
                    .padding(5)
                Spacer()
            }
            .frame(width: 250, height: 100)
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray, lineWidth: 1)
                    )
            AllergiesCell()
            FavoritesCell()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct AllergiesCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Allergies")
                .font(.system(size: 15))
                .padding(.leading, 30)
                .padding(.top, 10)
            Divider()
            HStack() {
                Button(action: {
                    
                }) {
                    Text("Nuts")
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1)
                )
                Button(action: {
                    
                }) {
                    Text("Dairy")
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1)
                )
                Button(action: {
                    
                }) {
                    Text("Shellfish")
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1)
                )
                Button(action: {
                    
                }) {
                    Text("Eggs")
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
            .padding(.leading, 10)
        }
    }
}

struct FavoritesCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Favorites")
                .font(.system(size: 15))
                .padding(.leading, 30)
                .padding(.top, 20)
            Divider()
            VStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        Text("American")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    Button(action: {
                        
                    }) {
                        Text("Mexican")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    Button(action: {
                        
                    }) {
                        Text("Vegan")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                .padding(.leading, 30)
                HStack {
                    Button(action: {
                        
                    }) {
                        Text("Italian")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    Button(action: {
                        
                    }) {
                        Text("Asian")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                .padding(.top, 10)
            }
        }
    }
}
