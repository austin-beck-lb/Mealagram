//
//  UserRow.swift
//  Mealagram
//
//  Created by Hamzah Mugharbil on 9/3/21.
//

import SwiftUI

struct UserRow: View {
    let user: User

    var body: some View {
        VStack(alignment: .leading) {
            Text(user.fullName ?? "")
                .font(.title)
            HStack {
                Text(user.location ?? "")
                    .font(.caption)
            }
        }
    }
}
