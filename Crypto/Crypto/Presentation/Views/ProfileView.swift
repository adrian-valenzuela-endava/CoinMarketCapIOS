//
//  ProfileView.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/08/2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        ZStack{
            Color("MainViewBackgroundColor")
                .edgesIgnoringSafeArea(.horizontal)
            VStack(){
                Image("profile")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    .padding(.top, 60)
                
                Text("Orlando Nicolas Marchioli")
                    .padding(.top, 40)
                    .font(.title2)
                    .bold()
                Text("Developer")
                    .padding(.top, 40)
                    .font(.title2)
                Text("CABA, Buenos Aires, Argentina")
                    .padding(.top, 40)
                    .font(.title2)
                Spacer()
                HStack{
                    Spacer()
                    Link(destination:URL(string: "https://github.com/OrlandoNicolasMarchioli/SwiftFundamentals")!)
                    {
                        SelectedChipButton<SelectionButtonData>(item: SelectionButtonData(label: "View in Github", letterColor: "ARSChipColor",backgroundColor: "ChipSelectedBackgroundColor")){SelectedChipButton in "View in Github"} getLetterColor: { SelectionButtonData in
                            "ARSChipColor"} getBackgroundColor: { SelectionButtonData in
                                "ChipSelectedBackgroundColor"
                            } onChipTapped: {
                                profileViewModel.openGitHubRepository()
                            }
                    }
                    Spacer()
                }
                Spacer()
            }
            Spacer()
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileViewModel: ProfileViewModel())
    }
}
