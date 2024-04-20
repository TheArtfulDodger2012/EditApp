//
//  EditProfileView.swift
//  EditApp
//
//  Created by Ron Lane on 4/20/24.
//

import SwiftUI

struct EditProfileView: View {
    @EnvironmentObject var viewModel: ContentViewModel

    var body: some View {
        List {
            Section("Edit Options") {
                Text("John Doe")
                
                NavigationLink {
                    EditEmailView()
                } label: {
                    Text(viewModel.user.email)
                }
                
                NavigationLink {
                    EditAddressView()
                } label: {
                    Text(viewModel.user.address)
                }
            }
        }
    }
}

struct EditEmailView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            TextField("Edit your email", text: $viewModel.user.email)
                .font(.subheadline)
                .cornerRadius(10)
                .padding(.horizontal, 4)
            
            Divider()
            
            Spacer()
        }
        .navigationTitle("Edit Email")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    dismiss()
                }
                .fontWeight(.semibold)
            }
        }
    }
}

struct EditAddressView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            TextField("Edit your address", text: $viewModel.user.address)
                .font(.subheadline)
                .cornerRadius(10)
                .padding(.horizontal, 4)
            
            Divider()
            
            Spacer()
        }
        .navigationTitle("Edit Address")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    dismiss()
                }
                .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    EditProfileView()
        .environmentObject(ContentViewModel())
}
