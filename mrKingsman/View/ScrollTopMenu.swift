//
//  ScrollTopMenu.swift
//  mrKingsman
//
//  Created by Камиль  Сулейманов on 12.01.2021.
//

import SwiftUI

struct ScrollTopMenu: View {
    @Binding var showTopMenu: Bool
    @Binding var showFav: Bool
    
    var body: some View {
        HStack {
            Image("logo")
                .resizable()
                .frame(width: 60, height: 60)
                Text("Mr.Kingsman")
                    .font(.title2)
                    .bold()
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
            })
            
        }
        .font(.system(size: 25))
        .foregroundColor(.white)
        .padding(.horizontal)
        .padding(.top, -10)
        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)))
        .opacity(showTopMenu && !showFav ? 1 : 0)
    }
}

