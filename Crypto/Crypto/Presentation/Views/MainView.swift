//
//  MainView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 30/06/2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mainViewModel: MainViewModel
    @State var logInApprobed: Bool = false
    
    var body: some View {
        VStack {
            //if logInApprobed{
            ContentView(contentViewData: ContentViewModel(), singleViewData: SingleCoinViewModel())
            //}
            //LogInView(loginViewModel: LogInViewModel())
            
        }.onReceive(self.mainViewModel.$logInViewModelState){state in
            logInApprobed = state
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainViewModel: MainViewModel())
    }
}
