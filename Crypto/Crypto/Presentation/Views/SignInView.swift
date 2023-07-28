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
    @State private var firstPassword : String = ""
    @State private var secondPassword : String = ""
    @State private var email: String = ""
    @State private var isLogInViewPresented = false
    
    var body: some View {
        ZStack{
            ZStack(alignment: .topTrailing){
                GeometryReader{_ in
                    VStack{
                        HStack{
                            Button(action: {
                                self.isLogInViewPresented.toggle()
                            }) {
                                Text("back")
                                .fontWeight(.bold)
                                .foregroundColor(Color("MainColor"))
                                .padding(.top)
                                .padding(.leading)
                            }
                            Spacer()
                        }
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
                            TextField("Your email", text: $signInViewModel.email)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 4).stroke(email != "" ? Color("MainColor") : self.color, lineWidth: 2))
                            HStack{
                                VStack{
                                    if self.visible{
                                        TextField("Your password", text: $signInViewModel.firstFieldPassword)
                                    }
                                    else{
                                        SecureField("Your password", text: $signInViewModel.firstFieldPassword)
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
                                        TextField("Repeat your password", text: $signInViewModel.secondFieldPassword)
                                    }
                                    else{
                                        SecureField("Repeat your password", text: $signInViewModel.secondFieldPassword)
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
        }.onReceive(self.signInViewModel.$alert){alert in
            print(alert)
            showAlert = alert
        }
        .sheet(isPresented: $isLogInViewPresented) {
            LogInView()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(signInViewModel.error)
            )
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(signInViewModel: SignInViewModel())
    }
}
