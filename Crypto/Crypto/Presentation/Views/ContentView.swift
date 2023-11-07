//
//  ContentView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 24/05/2023.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    var body: some View {
        
        VStack(){
            CoinListView()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
