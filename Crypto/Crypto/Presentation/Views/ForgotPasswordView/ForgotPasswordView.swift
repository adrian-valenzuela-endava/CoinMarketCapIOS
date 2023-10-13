//
//  ForgotPasswordView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 03/08/2023.
//

import SwiftUI
import Firebase

struct ForgotPasswordView: View {
    @ObservedObject var forgotPasswordViewModel : ForgotPasswordViewModel
    @State private var email: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State var color = Color.white
    
    var body: some View {
        ZStack{
            ZStack(alignment: .topTrailing){
                GeometryReader{_ in
                    VStack{
                        IconView()
                            .padding()
                        HStack(alignment: .center){
                            Text("Please enter your email")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color("MainColor"))
                                .cornerRadius(15)
                        }
                        Form{
                            TextField("Your email", text: $forgotPasswordViewModel.state.email)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 4).stroke(email != "" ? Color("MainColor") : self.color, lineWidth: 2))
                            HStack{
                                Spacer()
                                
                                Button(action:  {
                                    let invalidEmail = Validators.validateUsername(username: forgotPasswordViewModel.state.email)
                                    if !invalidEmail {
                                        alertMessage = "The email not valid"
                                        showAlert = true
                                    } else {
                                        forgotPasswordViewModel.restorePassword(email: forgotPasswordViewModel.state.email)
                                    }
                                }
                                ){
                                    Text("Send email")
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
        }
        .onReceive(self.forgotPasswordViewModel.$state){newState in
            alertMessage = newState.message
            showAlert = newState.alert
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertMessage)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
            )
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(forgotPasswordViewModel: ForgotPasswordViewModel(authUseCase: DefaultAuthUseCase(authRepository: FirebaseAuth(firebaseAuth: Auth.auth()))))
    }
}
