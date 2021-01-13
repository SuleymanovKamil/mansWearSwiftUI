//
//  TabBar.swift
//  mrKingsman
//
//  Created by Камиль  Сулейманов on 12.01.2021.
//

import SwiftUI

struct TabBar: View {
    @Binding var showAccount: Bool
    @Binding var showFav: Bool
    @Binding var showBasket: Bool
    
    @ObservedObject var basket = BasketModel()
    @ObservedObject var user = AccountModel()
    
    var body: some View {
        HStack (spacing: 30){
            
            Button(action: {
                withAnimation(.spring()){
                    showAccount.toggle()
                }
            }, label: {
                Image(systemName: user.userAddress == "" ? "person" : "person.fill")
                    
            })
            
            Button(action: {
                withAnimation(.spring()){
                        showFav.toggle()
                }
            }, label: {
                ZStack {
                    Image(systemName: basket.favorites.count > 0 ? "heart.fill" : "heart")
                  
                        .foregroundColor(Color.orange.opacity(0.7))
                       
                }
                  
            })
            
            Button(action: {
                withAnimation(.spring()){
                    showBasket.toggle()
                }
            }, label: {
                Image(systemName: basket.basket.count > 0 ? "cart.fill" : "cart")
                
              
                    ZStack {
                        Circle()
                            .foregroundColor(Color.red.opacity(0.8))
                            .frame(width: 40)
                         
                        Text("\(((basket.basket.count)))")
                            .font(.caption)
                            .foregroundColor(.white)
                        
                    }
                    .offset(x: -20, y: -14)
                    .opacity(basket.basket.count > 0 ? 1 : 0)
                    .animation(.easeIn)
                    .frame(width: 20, height: 20)
                
            })
            .padding(.trailing, -30)
            
            
        }
        .foregroundColor(Color.orange.opacity(0.7))
        .blendMode(.screen)
        .font(.system(size: 25))
        .padding()
        .padding(.horizontal)
        .background(LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 2, y: 2)
                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: -2, y: 0))
        .offset(y: -50)
       
    
    
    }
}
