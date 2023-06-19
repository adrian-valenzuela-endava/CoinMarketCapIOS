//
//  LogInView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 14/06/2023.
//

import SwiftUI
import Combine


struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    @State var color = Color.white
    @State var visible = false
    @ObservedObject var errorViewModel = ErrorViewModel()
    @State var alert = false
    
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
                            TextField("Your email", text: $email)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("MainColor") : self.color, lineWidth: 2))
                            HStack{
                                VStack{
                                    if self.visible{
                                        TextField("Your password", text: self.$password)
                                    }
                                    else{
                                        SecureField("Your password", text: $password)
                                    }
                                }
                                Button(action: {
                                    
                                }){
                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(Color("MainColor"))
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color("MainColor") : self.color, lineWidth: 2))
                            
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
                                    self.verify()
                                }
                                ){
                                    Text("Login")
                                }
                                .sync($errorViewModel.alert, with: $alert)
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
            
            if self.alert{
                ErrorView()
            }
        }
           
            
    }
    
    func verify(){
        if self.email != "" && self.password != ""{
            
        }
        else {
            errorViewModel.toggleError()
        }
    }
}



struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

extension View{
    func sync(_ published: Binding<Bool>, with binding: Binding<Bool>) -> some View{
        self
            .onChange(of: published.wrappedValue){published in
                binding.wrappedValue = published
            }
            .onChange(of: binding.wrappedValue){binding in
                published.wrappedValue = binding
            }
    }
}



