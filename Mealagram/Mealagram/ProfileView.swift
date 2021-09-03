//
//  ProfileView.swift
//  Mealagram
//
//  Created by Austin Beck on 9/3/21.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext

    @State var userName = ""
    @State var userDescription = ""
    @State var userLocation = ""

    var body: some View {
        ScrollView() {
            VStack(alignment: .center) {
                Button(action: {
                            print("Round Action")
                            }) {
                            Image("profile")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .background(Color.gray)
                                .clipShape(Circle())
                        }
                .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 2)
                .font(.title)
                .padding(5)
                Text("Add Image")
                    .font(.system(size: 10))
                VStack {
                    Button(action: {
                        
                    }) {
                        TextField("Full name", text: $userName)
                            .font(.system(size: 10))
                            .foregroundColor(Color.black)
                    }
                    .padding(10)
                    Divider()
                    Spacer()
                    Button(action: {
                        
                    }) {
                        TextField("Description..", text: $userDescription)
                            .font(.system(size: 10))
                            .foregroundColor(Color.black)
                    }
                    .padding(5)
                    Spacer()
                }
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 2)
                .frame(width: 250, height: 100)
                .cornerRadius(6)
                .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1))

                AllergiesCell()
                FavoritesCell()

                Divider()
                Image("map")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.top, 15)
                    .padding(.bottom, 10)
            }
        }.navigationTitle("Create Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Create")
                    .foregroundColor(.blue)
                    
            })
        .navigationBarItems(leading:
            Button(action: {
                addUser(fullName: userName, description: userDescription)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
                    .foregroundColor(.primary)
            }
        )
        .background(
            Image("pizza")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width + 200, height: UIScreen.main.bounds.height / 2)
                .clipped()
                .offset(x: 65, y: -UIScreen.main.bounds.height / 5)
                .opacity(0.1)
        )
    }

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
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
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
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                Button(action: {
                    isShellfish.toggle()
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
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                Button(action: {
                    isEggs.toggle()
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
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
            }
            .padding(.leading, 50)
            .padding(.top, 10)
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
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
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
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
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
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                }
                .padding(.leading, 60)
                .padding(.top, 10)
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
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
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
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                }
                .padding(.top, 10)
            }
        }
    }
}
