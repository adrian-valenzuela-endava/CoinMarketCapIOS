//
//  MainView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/08/2023.
//

import SwiftUI

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
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
                        HomeView()
                            .tabItem{
                                Image(systemName: "house")
                                Text("Home")
                            }
                        ContentView()
                            .tabItem{
                                Image(systemName: "bag")
                                Text("Market")
                                
                            }
                        ProfileView()
                            .tabItem{
                                Image(systemName: "person")
                                Text("Profile")
                                
                            }
                    }
                    .padding([.bottom],-50)
                }
            }.accentColor(Color("MainPageBackgroudColor"))
        }
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
