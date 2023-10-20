//
//  SimpleSelectionChips.swift
//  Crypto
//
//  Created by Orlando Nicolas Marchioli on 04/08/2023.
//

import SwiftUI

struct SimpleSelectionChips<T>: View {

    var body: some View {
        HStack{
           
        }
        .padding(.bottom)
    }
}


struct SelectedChipButton<T>: View{

    let item: T
    let getLabel: ((T) -> String)
    let getLetterColor: ((T) -> String)
    let getBackgroundColor: ((T) -> String)
    let onChipTapped: (() -> Void)


    var body: some View {
        Button(action: {
            onChipTapped()
        }, label: {
            Text(getLabel(item))
                .foregroundColor(Color(getLetterColor(item)))
                .bold()
        })
        .padding(10)
        .background(Color(getBackgroundColor(item)))
        .cornerRadius(10)
        
    }
}

struct UnselectedChipButton<T>: View{

    let item: T
    let getLabel: ((T) -> String)
    let getLetterColor: ((T) -> String)
    let getBackgroundColor: ((T) -> String)
    let onChipTapped: (() -> Void)


    var body: some View {
        Button(action: {
            onChipTapped()
        }, label: {
            Text(getLabel(item))
                .foregroundColor(Color(getLetterColor(item)))
                .bold()
        })
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color(getLetterColor(item)))
        )
    }
}

struct SimpleSelectionChips_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            SelectedChipButton<SelectionButtonData>(item: SelectionButtonData(label: "Light theme", letterColor: "ARSChipColor",backgroundColor:  "ChipSelectedBackgroundColor"), getLabel:{ item in
                return item.label
            },getLetterColor:{item in return item.letterColor}, getBackgroundColor: {item in return item.backgroundColor          },onChipTapped: {

            })
            UnselectedChipButton<SelectionButtonData>(item: SelectionButtonData(label: "Light theme", letterColor: "MainPageBackgroudColor",backgroundColor:  "ChipSelectedBackgroundColor"), getLabel:{ item in
                return item.label
            },getLetterColor:{item in return item.letterColor}, getBackgroundColor: {item in return item.backgroundColor          },onChipTapped: {

            })
        }
    }
}

