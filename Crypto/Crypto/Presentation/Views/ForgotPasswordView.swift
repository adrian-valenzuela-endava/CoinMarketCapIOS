//
//  ForgotPasswordView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 03/08/2023.
//

import SwiftUI

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
                            TextField("Your email", text: $forgotPasswordViewModel.email)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 4).stroke(email != "" ? Color("MainColor") : self.color, lineWidth: 2))
                            HStack{
                                Spacer()
                                
                                Button(action:  {
                                    self.forgotPasswordViewModel.verify()
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
        .onReceive(self.forgotPasswordViewModel.$alertMessage){msg in
            alertMessage = msg
        }
        .onReceive(self.forgotPasswordViewModel.$alert){alert in
            showAlert = alert
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(forgotPasswordViewModel.alertMessage)
            )
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(forgotPasswordViewModel: ForgotPasswordViewModel())
    }
}
