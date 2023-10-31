//
//  MainView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/08/2023.
//

import SwiftUI

import SwiftUI

struct MainView: View {

    private var mainViewModel: MainViewModel

    init(mainViewModel: MainViewModel = MainViewModel()) {
        self.mainViewModel = mainViewModel
    }
    
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    HStack{
                        Spacer()
                        Button(action:  {
                            mainViewModel.logOutUser()
                        }
                        ){
                            Text("Logout")
                        }
                        .padding(.horizontal,10.0)
                        .padding(.vertical,7)
                        .foregroundColor(.white)
                        .background(Color("MainColor"))
                        .cornerRadius(10)
                    }
                    .padding(.trailing, 6.0)

                    TabView{
                        HomeView(isDarkMode: false)
                            .tabItem{
                                Image(systemName: "house")
                                Text("Home")
                            }
                        ContentView()
                            .tabItem{
                                Image(systemName: "bag")
                                Text("Market")
                                
                            }
                        ProfileView(profileViewModel: ProfileViewModel())
                            .tabItem{
                                Image(systemName: "person")
                                Text("Profile")
                                
                            }
                    }
                    .padding([.bottom],-50)
                }
            }.accentColor(Color("MainPageBackgroudColor"))
        }.onReceive(mainViewModel.$state){state in
            if(state.isLogout){
                NavigationManager.shared().onSessionLose()
            }
        }
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
