//
//  ContentView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 24/05/2023.
//

import SwiftUI

func formatter(date: String) -> Date{
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy"
    let newDate: Date = formatter.date(from: date)!
    return newDate
}


struct ContentView: View {
    
    @ObservedObject var contentViewData: ContentViewModel
    @ObservedObject var singleViewData: SingleCoinViewModel
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
                    SIngleCoinView(singleViewData: SingleCoinViewModel(), coinData: singleViewData.coinValues )
                    
                    
                    Text("Your crypto balance")
                        .padding(.top,50)
                    Text(contentViewData.total)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    List(){
                        Section(header: Text("MY WALLET")){
                            ForEach(contentViewData.myWallet, id:\.self ) {
                                coin in
                                NavigationLink(destination: SIngleCoinView(singleViewData: SingleCoinViewModel(), coinData:contentViewData.myWallet)){
                                    HStack{
                                        Image(coin.icon)
                                        Text(coin.name)
                                        Spacer()
                                        Text("$\(coin.price.rounded(.up))")
                                    }
                                }
                            }
                        }
                    }
                    
                    List(){
                        Section(header: Text("Current Prices")){
                            ForEach(contentViewData.rates, id: \.self){
                                rate in
                                NavigationLink(destination: SIngleCoinView(singleViewData: SingleCoinViewModel(), coinData:contentViewData.rates)){
                                    HStack{
                                        Image(rate.icon)
                                        Text(rate.name)
                                        Spacer()
                                        Text("$\(rate.price.rounded(.up))")
                                    }
                                }
                            }
                        }
                    }
                    LogInView(loginViewModel: LogInViewModel())
                                            .environmentObject(appState)
                }
            }
            .onAppear{
                contentViewData.chargeAllContentViewData()
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
        ContentView(contentViewData: ContentViewModel(), singleViewData: SingleCoinViewModel())
            .environmentObject(AppState())
    }
}
