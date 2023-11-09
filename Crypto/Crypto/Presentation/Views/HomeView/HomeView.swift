//
//  HomeView.swift
//  CryptoService
//
//  Created by Orlando Nicolas Marchioli on 08/04/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State private var isDarkMode: Bool
    init(isDarkMode: Bool) {
        _isDarkMode = State(initialValue: UITraitCollection().userInterfaceStyle == .dark)
        if (colorScheme == .dark){
            _isDarkMode = State(initialValue: true)
        }
    }
    
    var body: some View {
        ZStack(){
            ScrollView{
                VStack(alignment: .center){
                    Image("HomeImage")
                        .padding(50)
                    HomeViewTitle(text: "Implemented by ")
                    HStack{
                        HomeViewTitle(text: "Nicolas Marchioli").foregroundColor(Color("MainPageBackgroudColor"))
                        HomeViewTitle(text: ", 2023")
                    }
                    .padding([.bottom],30)
                    HStack{
                        
                    }
                    .padding(.bottom)
                    
                    HStack(spacing : 35){
                        SelectedChipButton<SelectionButtonData>(item: SelectionButtonData(label: "Light Theme", letterColor: "ARSChipColor",backgroundColor: "ChipSelectedBackgroundColor")){SelectedChipButton in "Light Theme"} getLetterColor: { SelectionButtonData in
                            "ARSChipColor"} getBackgroundColor: { SelectionButtonData in
                                "ChipSelectedBackgroundColor"
                            } onChipTapped: {
                                homeViewModel.toggleMode(mode: EnvironmentMode.ligthMode)
                            }
                        
                        UnselectedChipButton<SelectionButtonData>(item: SelectionButtonData(label: "Dark Theme", letterColor: "ARSChipColor",backgroundColor: "ChipSelectedBackgroundColor")){SelectedChipButton in "Dark Theme"} getLetterColor: { SelectionButtonData in
                            "ChipUnselectedBorder"} getBackgroundColor: { SelectionButtonData in
                                "ChipSelectedBackgroundColor"
                            } onChipTapped: {
                                homeViewModel.toggleMode(mode: EnvironmentMode.darkMode)
                            }
                    }
                }
                .padding([.bottom],90)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("MainViewBackgroundColor")) // Background color
                .edgesIgnoringSafeArea(.all)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color("MainViewBackgroundColor"))
            .onChange(of: isDarkMode) { newValue in
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    if let window = windowScene.windows.first {
                        window.overrideUserInterfaceStyle = newValue ? .dark : .light
                    }
                }
            }
            .onReceive(homeViewModel.$isDarkMode){mode in
                self.isDarkMode = mode
            }
        }
    }
}

struct HomeViewTitle: View{
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Mulish-SemiBold",fixedSize: 25))
            .multilineTextAlignment(.center)
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isDarkMode: false)
    }
}

