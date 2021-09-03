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
        ScrollView() {
            VStack {
                VStack(alignment: .trailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Close")
                    }
                    .padding(.leading, 200)
                    .font(.system(size: 12))
                }
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
                Divider()
                Image("map")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.top, 15)
                    .padding(.bottom, 10)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct AllergiesCell: View {
    @State var isNuts = false
    @State var isDairy = false
    @State var isShellfish = false
    @State var isEggs = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Allergies")
                .font(.system(size: 15))
                .padding(.leading, 30)
                .padding(.top, 10)
            Divider()
            HStack() {
                Button(action: {
                    isNuts.toggle()
                }) {
                    Text("Nuts")
                }
                .foregroundColor(isNuts ? Color.white : Color.black)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .background(isNuts ? Color.blue : Color.white)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1)
                )
                Button(action: {
                    isDairy.toggle()
                }) {
                    Text("Dairy")
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .foregroundColor(isDairy ? Color.white : Color.black)
                .background(isDairy ? Color.blue : Color.white)
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
                .foregroundColor(isShellfish ? Color.white : Color.black)
                .background(isShellfish ? Color.blue : Color.white)
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
                .foregroundColor(isEggs ? Color.white : Color.black)
                .background(isEggs ? Color.blue : Color.white)
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
    @State var isAmerican = false
    @State var isMexican = false
    @State var isVegan = false
    @State var isItalian = false
    @State var isAsian = false
    
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
                        isAmerican.toggle()
                    }) {
                        Text("American")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .foregroundColor(isAmerican ? Color.white : Color.black)
                    .background(isAmerican ? Color.blue : Color.white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    Button(action: {
                        isMexican.toggle()
                    }) {
                        Text("Mexican")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .foregroundColor(isMexican ? Color.white : Color.black)
                    .background(isMexican ? Color.blue : Color.white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    Button(action: {
                        isVegan.toggle()
                    }) {
                        Text("Vegan")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .foregroundColor(isVegan ? Color.white : Color.black)
                    .background(isVegan ? Color.blue : Color.white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                .padding(.leading, 30)
                HStack {
                    Button(action: {
                        isItalian.toggle()
                    }) {
                        Text("Italian")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .foregroundColor(isItalian ? Color.white : Color.black)
                    .background(isItalian ? Color.blue : Color.white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    Button(action: {
                        isAsian.toggle()
                    }) {
                        Text("Asian")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .foregroundColor(isAsian ? Color.white : Color.black)
                    .background(isAsian ? Color.blue : Color.white)
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
