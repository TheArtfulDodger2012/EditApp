//
//  ContentView.swift
//  EditApp
//
//  Created by Ron Lane on 4/20/24.
//

import SwiftUI

struct User {
    let fullname : String
    var email    : String
    var address  : String
    
    var initials: String? {
        let formatter = PersonNameComponentsFormatter()
        guard let components = formatter.personNameComponents(from: fullname) else { return nil }
        formatter.style = .abbreviated
        return formatter.string(from: components)
    }
}

class ContentViewModel: ObservableObject {
    @Published var user: User
    
    init() {
        self.user = User(fullname: "John Doe", email: "doe.john@gmail.com", address: "123 Main St")
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    EditProfileView()
                } label: {
                    HStack {
                        Text(viewModel.user.initials ?? "")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 48, height: 48)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                        
                        VStack (alignment: .leading, spacing: 4) {
                            Text(viewModel.user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text(viewModel.user.email)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                                .padding(.leading, 2)
                                .tint(.gray)
                            
                            Text(viewModel.user.address)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ContentViewModel())
}
