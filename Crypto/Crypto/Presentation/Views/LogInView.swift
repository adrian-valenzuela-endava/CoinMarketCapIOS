//
//  LogInView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 14/06/2023.
//

import SwiftUI
import Combine


struct LogInView: View {
    @EnvironmentObject var loginViewModel: LogInViewModel
    @State var color = Color.white
    @State var visible = false
    @State private var showAlert : Bool = false
    @State private var error : String = ""
    @State private var password : String = ""
    @State private var email: String = ""
    @State private var isSignInViewPresented = false
    
    var body: some View {
        NavigationView{
            ZStack{
                ZStack(alignment: .topTrailing){
                    GeometryReader{_ in
                        VStack{
                            HStack{
                                Spacer()
                                Button(action: {
                                    self.isSignInViewPresented.toggle()
                                }) {
                                    Text("Register")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("MainColor"))
                                        .padding(.trailing)
                                        .padding(.top)
                                }
                            }
                            IconView()
                                .padding()
                            HStack(alignment: .center){
                                Text("Welcome to Crypto")
                                    .font(.title)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color("MainColor"))
                                    .cornerRadius(15)
                            }
                            HStack{
                                Spacer()
                                
                            }
                            Form{
                                TextField("Your email", text: $loginViewModel.email)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 4).stroke(email != "" ? Color("MainColor") : self.color, lineWidth: 2))
                                
                                HStack{
                                    VStack{
                                        if self.visible{
                                            TextField("Your password", text: $loginViewModel.password)
                                        }
                                        else{
                                            SecureField("Your password", text: $loginViewModel.password)
                                        }
                                    }
                                    Button(action: {
                                        self.visible.toggle()
                                    }){
                                        Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                            .foregroundColor(Color("MainColor"))
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 4).stroke(password != "" ? Color("MainColor") : self.color, lineWidth: 2))
                                
                                HStack{
                                    Spacer()
                                    Button (action:
                                                {
                                        loginViewModel.sendPasswordResetEmail(for: loginViewModel.email) { error in
                                                if let error = error {
                                                    // Handle the error (e.g., show an alert)
                                                    print("Error sending password reset email: \(error.localizedDescription)")
                                                } else {
                                                    // Password reset email sent successfully, show a confirmation message
                                                    print("Password reset email sent successfully.")
                                                }
                                            }
                                        
                                    }) {
                                        Text("Forgot password?")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("MainColor"))
                                    }
                                    
                                }.padding(.top,10)
                                HStack{
                                    Spacer()
                                    
                                    Button(action:  {
                                        self.loginViewModel.verify()
                                    }
                                    ){
                                        Text("Login")
                                    }
                                    .padding(.horizontal, 20.0)
                                    .padding(.vertical,15)
                                    .foregroundColor(.white)
                                    .background(Color("MainColor"))
                                    .cornerRadius(15)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                NavigationLink(
                    destination: SignInView(signInViewModel: SignInViewModel()),
                    isActive: $isSignInViewPresented,
                    label: {
                        EmptyView()
                    })
                .hidden()
            }.alert(isPresented: $showAlert) {
                Alert(
                    title: Text(error)
                        .fontWeight(.bold)
                        .foregroundColor(Color("MainColor"))
                )
            }
            .onReceive(self.loginViewModel.$alert){alert in
                showAlert = alert
            }
            .onReceive(self.loginViewModel.$error){err in
                error = err
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}







