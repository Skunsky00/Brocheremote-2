//
//  LoginView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/15/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var color = #colorLiteral(red: 0.1698683487, green: 0.3265062064, blue: 0.74163749, alpha: 1)
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.cyan, Color.teal, Color.green]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    
                    Text("Broche")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 80)
                
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, paceholder: Text("Email"), imageName: "envelope")
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
                    
                    HStack {
                        Spacer()
                        Button(action: {}, label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 33)
                        })
                    }
                    // sign in
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.headline).foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color(color))
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                    NavigationLink(destination: RegistrationView()
                        .navigationBarHidden(true),
                                    label: {
                        HStack{
                            Text("Don't have an account?")
                                .font(.system(size:14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }.foregroundColor(.white)
                    }).padding(.bottom, 20)
                    
                    
                }
                .padding(.top, -16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
