//
//  LogInView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 14/06/2023.
//

import SwiftUI
import Combine


struct LogInView: View {
    @State var color = Color.white
    @State var visible = false
    @ObservedObject var errorViewModel : ErrorViewModel
    @ObservedObject var loginViewModel : LogInViewModel
    
    var body: some View {
        ZStack{
            ZStack(alignment: .topTrailing){
                GeometryReader{_ in
                    VStack{
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
                        Form{
                            TextField("Your email", text: loginViewModel.email)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 4).stroke(loginViewModel.email != "" ? Color("MainColor") : self.color, lineWidth: 2))
                            HStack{
                                VStack{
                                    if self.visible{
                                        TextField("Your password", text: loginViewModel.password)
                                    }
                                    else{
                                        SecureField("Your password", text: loginViewModel.password)
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
                            .background(RoundedRectangle(cornerRadius: 4).stroke(loginViewModel.password != "" ? Color("MainColor") : self.color, lineWidth: 2))
                            
                            HStack{
                                Spacer()
                                Button (action:
                                {
                                    
                                }) {
                                    Text("Forget password?")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("MainColor"))
                                }

                            }.padding(.top,10)
                            
                            HStack{
                                Spacer()
                                
                                Button(action:  {
                                    loginViewModel.verify()
                                }
                                ){
                                    Text("Login")
                                }
                                .padding(.horizontal, 20.0)
                                .padding(.vertical,15)
                                .foregroundColor(.white)
                                .background(Color("MainColor"))
                                .cornerRadius(15)
                                .alert(isPresented: errorViewModel.$alert) {
                                    Alert(
                                        ErrorView()
                                    )
                                }
                                Spacer()
                            }

                        }
                    }
                }
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(errorViewModel: ErrorViewModel(), loginViewModel: LogInViewModel())
    }
}





