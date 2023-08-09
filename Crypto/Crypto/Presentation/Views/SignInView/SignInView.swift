//
//  SignInView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/07/2023.
//

import SwiftUI
import Combine

struct SignInView: View {
    @StateObject var signInViewModel : SignInViewModel
    @State var color = Color.white
    @State var visible = false
    @State private var showAlert : Bool = false
    @State private var error : String = ""
    @State private var firstPassword : String = ""
    @State private var secondPassword : String = ""
    @State private var email: String = ""
    @State private var isEmailValid: Bool = false
    @State private var isPasswordValid: Bool = false
    
    var body: some View {
        ZStack{
            ZStack(alignment: .topTrailing){
                GeometryReader{_ in
                    VStack{
                        IconView()
                            .padding()
                        HStack(alignment: .center){
                            Text("Please enter your email and password")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color("MainColor"))
                                .cornerRadius(15)
                        }
                        Form{
                            Section{
                                TextField("Your email", text: $signInViewModel.state.email, onEditingChanged: {editing in
                                    self.isEmailValid = editing ? true : Validators.validateUsername(username: signInViewModel.state.email)
                                    
                                })
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 4).stroke(email != "" ? Color("MainColor") : self.color, lineWidth: 2))
                                HStack{
                                    VStack{
                                        if self.visible{
                                            TextField("Your password", text: $signInViewModel.state.firstFieldPassword, onEditingChanged: {editing in
                                                self.isPasswordValid = editing ? true : Validators.validatePassWord(password: signInViewModel.state.firstFieldPassword)
                                                
                                            })
                                        }
                                        else{
                                            SecureField("Your password", text: $signInViewModel.state.firstFieldPassword)
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
                                .background(RoundedRectangle(cornerRadius: 4).stroke(firstPassword != "" ? Color("MainColor") : self.color, lineWidth: 2))
                                HStack{
                                    VStack{
                                        if self.visible{
                                            TextField("Repeat your password", text: $signInViewModel.state.secondFieldPassword, onEditingChanged: {editing in
                                                self.isPasswordValid = editing ? true : Validators.validatePassWord(password: signInViewModel.state.secondFieldPassword)
                                            })
                                        }
                                        else{
                                            SecureField("Repeat your password", text: $signInViewModel.state.secondFieldPassword)
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
                                .background(RoundedRectangle(cornerRadius: 4).stroke(secondPassword != "" ? Color("MainColor") : self.color, lineWidth: 2))
                            }
                            HStack{
                                Spacer()
                                
                                Button(action:  {
                                    self.signInViewModel.verify()
                                }
                                ){
                                    Text("Sign In")
                                    .fontWeight(.bold)
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
        }.onReceive(self.signInViewModel.$state){state in
            showAlert = state.alert
            error = state.error
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(signInViewModel.state.error)
            )
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(signInViewModel: SignInViewModel())
    }
}
