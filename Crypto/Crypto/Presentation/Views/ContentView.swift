//
//  ContentView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 24/05/2023.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var contentViewData = ContentViewModel()
    @EnvironmentObject var appState: AppState
    @State var is360 = false
    
    var body: some View {
        if appState.isLoggedIn {
            NavigationView{
                VStack(){
                    Button(action: {
                        self.is360.toggle()
                    }){
                        IconView()
                            .rotation3DEffect(.degrees(is360 ? 360 : 0), axis: (x: 0, y: 1, z: 1))
                            .animation(.easeIn, value: 0.7)
                    }
                        .padding(.top,50)
                    
                    CoinListView()
                }
            
            }
            .navigationBarTitle(Text("Dashboard"))
        }
        else{
            LogInView(loginViewModel: LogInViewModel())
                .environmentObject(appState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppState())
    }
}
