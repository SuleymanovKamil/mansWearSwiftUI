//
//  Fovorites.swift
//  mrKingsman
//
//  Created by Камиль  Сулейманов on 07.01.2021.
//

import SwiftUI

struct Favorites: View {
    @EnvironmentObject var basket: BasketModel
    @Binding var hide: Bool
    @State var showDetail = false
    @State var selectedItem : item = hats[0]
    @State var viewState:CGFloat = .zero
    
    var body: some View {
        VStack (alignment: .leading){
            
            HStack {
                Spacer()
                Text("Избранное")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.top, small ? 50 : 90)
            
            ItemsList( array: $basket.favorites, selectedItem: $selectedItem, showDetail: $showDetail)
            
            
            Spacer()
            HStack {
                Spacer()
                Capsule()
                    .frame(width: 50, height: 5)
                    .foregroundColor(.white)
                Spacer()
            }
            .offset(y: 5)
            
            NavigationLink("",destination:  Detail(item: $selectedItem, show: $showDetail).accentColor(.white),
                           isActive: $showDetail)
        }
        .frame(width: width, height:  height - 70)
        .background(LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .clipShape(CustomCorner())
                        .shadow(color: Color.black.opacity(0.5), radius: 3, x: 0, y: 3))
        .gesture(
            DragGesture().onChanged{ value in
                withAnimation(.easeIn(duration: 0.5)){
                    if -value.translation.height >= 0 {
                        viewState = value.translation.height
                    }
                }
            }
            .onEnded{ value in
                if -value.translation.height >= 50 {
                    withAnimation(.easeIn(duration: 0.5)){
                        hide.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        viewState = .zero
                    }
                }
                else {
                    viewState = .zero
                }
            }
        )
        .offset(y: viewState)
    }
}

