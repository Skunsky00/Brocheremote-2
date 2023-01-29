//
//  RegistrationView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/15/22.
//

import SwiftUI
import PhotosUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var color = #colorLiteral(red: 0.1698683487, green: 0.3265062064, blue: 0.74163749, alpha: 1)
    var body: some View {
      // Form {
            
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.cyan, Color.teal, Color.green]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    VStack {
                        
                        //profile pic picker
                        
                        if let data = data, let uiImage = UIImage(data: data) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipShape(Circle())
                        }
                        
                        if (data == nil) {
                            PhotosPicker(
                                selection: $selectedItems,
                                maxSelectionCount: 1,
                                matching: .images
                                
                            ) {
                                Image(systemName: "plus.circle")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .foregroundColor(.white)
                            }
                            .onChange(of: selectedItems) { result in
                                guard let item = selectedItems.first else {
                                    return
                                }
                                item.loadTransferable(type: Data.self) { result in
                                    switch result {
                                    case .success(let data):
                                        if let data = data {
                                            self.data = data
                                        } else {
                                            print("Data is nil")
                                        }
                                    case .failure(let error):
                                        fatalError("\(error)")
                                    }
                                }
                            }
                        }
                        
                        VStack(spacing: 20) {
                            CustomTextField(text: $email, paceholder: Text("Email"), imageName: "envelope")
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal, 32)
                            
                            CustomTextField(text: $username, paceholder: Text("Username"), imageName: "person")
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal, 32)
                            
                            CustomTextField(text: $fullname, paceholder: Text("Full Name"), imageName: "person")
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal, 32)
                            
                            CustomSecureField(text: $password, paceholder: Text("Password"))
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal, 32)
                            
                        }
                        
                        // sign in
                        Button(action: {
                            if let image = UIImage(data: data!) {
                                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username, image: image)
                                print("registered")
                            }
                            
                        }, label: {
                            Text("Sign up")
                                .font(.headline).foregroundColor(.white)
                                .frame(width: 360, height: 50)
                                .background(Color(color))
                                .clipShape(Capsule())
                                .padding()
                        })
                        
                        Spacer()
                        
                        Button(action: {mode.wrappedValue.dismiss()}, label: {
                            HStack{
                                Text("Already have an account?")
                                    .font(.system(size:14))
                                
                                Text("Sign In")
                                    .font(.system(size: 14, weight: .semibold))
                            }.foregroundColor(.white)
                        })
                    }
                }
            }
  //      }
    
}
    
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

struct ProfileForm: View {
    @StateObject var viewModel = ProfileModel()
    
    var body: some View {
        //Form {
            Section {
                HStack {
                    Spacer()
                    EditableCircularProfileImage(viewModel: viewModel)
                    Spacer()
                }
            }
      // }
    }
    
}
