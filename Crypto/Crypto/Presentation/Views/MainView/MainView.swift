//
//  MainView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/08/2023.
//

import SwiftUI

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView{
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
        }.accentColor(Color("MainPageBackgroudColor"))
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
