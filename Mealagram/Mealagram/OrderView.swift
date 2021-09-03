//
//  OrderView.swift
//  Mealagram
//
//  Created by Brandon Shaw on 9/3/21.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: String
}

struct OrderView: View {
    @Environment(\.presentationMode) var presentationMode

    var menu: [MenuItem] = [MenuItem(name: "Ham Sandwich", image: "ham sandwich", price: "$6.99"),
                           MenuItem(name: "Brandon's Burrito", image: "burrito", price: "$8.99"),
                           MenuItem(name: "Austin's Aioli Burger", image: "aoili", price: "$10.99"),
                           MenuItem(name: "Caitlyn's Crusted Calamari", image: "calamari", price: "$15.99"),
                           MenuItem(name: "Kung Pao Chicken", image: "kung pao", price: "$13.99"),
                           MenuItem(name: "Falafel Sandwich", image: "falafel", price: "$3.99")]
    
    @State private var selectedMenu: MenuItem = MenuItem(name: "", image: "", price: "")
    @State private var nextView: Bool = false
    @State private var action: Int? = 0
    
    var body: some View {
        NavigationLink(destination: ThankYouView(), tag: 1, selection: $action) {
            ScrollView() {
                VStack {
                    ForEach(self.menu, id: \.id) { item in
                        Button(action: {
                            if self.selectedMenu.id == item.id {
                                self.selectedMenu = MenuItem(name: "", image: "", price: "")
                            } else {
                                self.selectedMenu = item
                            }
                        }) {
                            HStack(alignment: .center, spacing: 15) {
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 65, height: 65, alignment: .center)
                                    .padding(.leading)

                                Text(item.name)
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                Text(item.price)
                                    .font(.caption)
                                    .fontWeight(.none)
                                    .foregroundColor(.secondary)
                                    .padding(.horizontal)
                            }
                            .foregroundColor(Color.primary)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 80)
                            .background(Color("buttonColor"))
                            .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(self.selectedMenu.id == item.id ? Color.blue.opacity(0.8) : Color.clear, lineWidth: 3))
                            .cornerRadius(15)
                            .padding(5)
                        }
                        .buttonStyle(MainButtonStyle())
                        .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 6)
                        .padding(.horizontal)
                    }
                }.padding(.top, 30)
            }
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Button(action: {
                    guard self.selectedMenu.name != "" else { return }

                    UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                    self.action = 1
                }) {
                    Text("Next")
                        .foregroundColor(self.selectedMenu.name == "" ? .secondary : .blue)
                })
        }

       
    }
}
