//
//  ErrorView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 19/06/2023.
//

import SwiftUI

struct ErrorView : View {
    @ObservedObject var errorViewModel = ErrorViewModel()
    @State var alert = false
    
    var body: some View{
        ZStack(){
            
            ZStack(){
                GeometryReader{_ in
                    VStack{
                        HStack{
                            Text("Error")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color("MainColor"))
                            Spacer()
                        }
                        .padding(.horizontal,20)
                        Text(errorViewModel.error)
                            .foregroundColor(Color("MainColor"))
                            .padding(.top)
                        
                        Button(action: {
                            errorViewModel.toggleError()
                        }){
                            Text("Cancel")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 120)
                        }
                        .sync($errorViewModel.alert, with: $alert)
                        .background(Color("MainColor"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                    }
                    .frame(width: UIScreen.main.bounds.width - 70)
                    .background(Color.white)
                    .cornerRadius(15)
                }
                .background(Color.black.opacity(0.3).edgesIgnoringSafeArea(.all))
            }
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}

