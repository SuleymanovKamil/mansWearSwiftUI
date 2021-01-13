//
//  Carts.swift
//  mrKingsman
//
//  Created by Камиль  Сулейманов on 06.01.2021.
//

import SwiftUI

struct Carts: View {
    @State var item: item
    @Binding var selectedItem: item
    @Binding var show: Bool
    @ObservedObject var basket = BasketModel()
    
    var body: some View {
        VStack {
            ZStack {
                
                Circle()
                    .frame(width: 130, height: 130)
                    .foregroundColor(Color.orange.opacity(0.7))
                    
                
                Image(item.image)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .scaledToFill()
                    .cornerRadius(60)
            }
            .offset(x: -20)
        
            VStack (alignment: .leading){
            Text(item.name)
                .font(.headline)
                .lineLimit(1)
                .foregroundColor(Color.orange.opacity(0.7))
                .padding(.bottom, -5)
                .padding(.leading, 15)
                .padding(.trailing, 5)
            
            HStack (spacing: 0) {
               
                Text("\(item.price)₽")
                    .font(.subheadline)
                    .foregroundColor(Color.white.opacity(0.8))
                    .padding(.leading, 15)
                  
                
                Spacer()
                Button(action: {
                    
                    if basket.basket.contains(item) {
                        basket.basket.remove(object: item)
                    } else {
                        selectedItem = item
                        basket.basket.append(item)
                    }
                    }, label: {
                        Image(systemName: basket.basket.contains(item) ? "cart.fill" : "cart")
                            .padding(.trailing)
                            .foregroundColor(Color.white.opacity(0.8))
                })
                
                Button(action: {
                    if basket.favorites.contains(item) {
                        basket.favorites.remove(object: item)
                    } else {
                        basket.favorites.append(item)
                    }
                    }, label: {
                        Image(systemName: basket.favorites.contains(item) ? "heart.fill" : "heart")
                            .foregroundColor(Color.white.opacity(0.8))
                            .padding(.trailing)
                           
                })
                .padding(.leading, -10)
            }
            .padding(.bottom)
            .font(.system(size: 20))
            }
        }
        .onTapGesture {
            withAnimation(.spring()){
                selectedItem = item
                show.toggle()
            }
        }
        .padding(.vertical, 20)
        .frame(width: 200, height: 200)
        .background(LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                .clipShape(CustomShape())
                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 2, y: 2)
                .shadow(color: Color.black.opacity(0.3), radius: 2, x: -2, y: -2)
        )
    }
}


