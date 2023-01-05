//
//  RegistrationView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/15/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var viewModels = ProfileModel()
    var color = #colorLiteral(red: 0.1698683487, green: 0.3265062064, blue: 0.74163749, alpha: 1)
    var body: some View {
      // Form {
            
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.cyan, Color.teal, Color.green]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    VStack {
                        
                        //profile pic picker
                        
                        ProfileForm()
                            .padding(.bottom, 30)
                        
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
                            viewModel.register(withEmail: email, password: password)
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
