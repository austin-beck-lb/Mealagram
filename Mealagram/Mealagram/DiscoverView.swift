//
//  DiscoverView.swift
//  Mealagram
//
//  Created by Hamzah Mugharbil on 9/3/21.
//

import SwiftUI

struct DiscoverView: View {

    @FetchRequest(
        entity: User.entity(),

        sortDescriptors: [
            NSSortDescriptor(keyPath: \User.fullName, ascending: true)
        ]

    ) var users: FetchedResults<User>

    @Environment(\.managedObjectContext) var managedObjectContext
    @State var isPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.fullName) {
                    UserRow(user: $0)
                }
            }
//            .sheet(isPresented: $isPresented) {
//                AddMovie { title, genre, release in
//                    self.addMovie(title: title, genre: genre, releaseDate: release)
//                    self.isPresented = false
//                }
//            }
            .navigationBarTitle(Text("Users"))
            .navigationBarItems(trailing:
                                    Button(action: { self.isPresented.toggle() }) {
                                        Image(systemName: "plus")
                                    }
            )
        }
    }

    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
