//
//  HomeView.swift
//  CryptoService
//
//  Created by Orlando Nicolas Marchioli on 08/04/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(){
            Color("MainViewBackgroundColor")
                .edgesIgnoringSafeArea(.horizontal)
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
                            Void.self
                        }
                    
                    UnselectedChipButton<SelectionButtonData>(item: SelectionButtonData(label: "Dark Theme", letterColor: "ARSChipColor",backgroundColor: "ChipSelectedBackgroundColor")){SelectedChipButton in "Dark Theme"} getLetterColor: { SelectionButtonData in
                        "ChipUnselectedBorder"} getBackgroundColor: { SelectionButtonData in
                            "ChipSelectedBackgroundColor"
                        } onChipTapped: {
                            Void.self
                        }
                }
                .padding([.bottom],90)
                .frame(maxHeight: .infinity)
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
        HomeView()
    }
}

