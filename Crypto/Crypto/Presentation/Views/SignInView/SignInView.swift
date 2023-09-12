//
//  SignInView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/07/2023.
//

import SwiftUI
import Combine
import Firebase

struct SignInView: View {
    @StateObject var signInViewModel : SignInViewModel
    @State var color = Color.white
    @State var visible = false
    @State private var showAlert : Bool = false
    @State private var message : String = ""
    @State private var firstFieldPassword : String = ""
    @State private var secondFieldPassword : String = ""
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
                                TextField("Your email", text: $email)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 4).stroke(email != "" ? Color("MainColor") : self.color, lineWidth: 2))
                                HStack{
                                    VStack{
                                        if self.visible{
                                            TextField("Your password", text: $firstFieldPassword)
                                        }
                                        else{
                                            SecureField("Your password", text: $firstFieldPassword)
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
                                .background(RoundedRectangle(cornerRadius: 4).stroke(firstFieldPassword != "" ? Color("MainColor") : self.color, lineWidth: 2))
                                HStack{
                                    VStack{
                                        if self.visible{
                                            TextField("Repeat your password", text: $secondFieldPassword)
                                        }
                                        else{
                                            SecureField("Repeat your password", text: $secondFieldPassword)
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
                                .background(RoundedRectangle(cornerRadius: 4).stroke(secondFieldPassword != "" ? Color("MainColor") : self.color, lineWidth: 2))
                            }
                            HStack{
                                Spacer()
                                
                                Button(action:  {
                                    let invalidEmail = Validators.validateUsername(username: email)
                                    let passwordsAreEquals = Validators.validatePassWords(firstPassword: firstFieldPassword, secondPassword: secondFieldPassword)
                                    
                                    if !invalidEmail || !passwordsAreEquals{
                                        message = "The email or password is not valid"
                                        showAlert = true
                                    }
                                    else {
                                        self.signInViewModel.verify(email: email, firstFieldPassword: firstFieldPassword, secondFieldPassword: secondFieldPassword)
                                    }
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
            message = state.message
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(message)
            )
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(signInViewModel: SignInViewModel(authUseCase: DefaultAuthUseCase(authRepository: FirebaseAuth(firebaseAuth: Auth.auth()))))
    }
}
