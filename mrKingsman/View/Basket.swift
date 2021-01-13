//
//  Basket.swift
//  mrKingsman
//
//  Created by Камиль  Сулейманов on 07.01.2021.
//

import SwiftUI

struct Basket: View {
    @EnvironmentObject var basket: BasketModel
    @Binding var hide: Bool
    @State var showDetail = false
    @State var selectedItem : item = hats[0]
    @State var pay = false
    var totalPrice: Int  {
        var t:Int = 0
        for i in basket.basket {
            
            t += i.price
        }
        return t
    }
    
    var body: some View {

            VStack (alignment: .leading, spacing: 10){

                if !basket.basket.isEmpty{
                    HStack {
                        Spacer()
                        Text(pay ? "Спасибо за покупку" : "Итого: \(totalPrice)₽")
                        .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white.opacity(0.8))
                    }
                    .padding()
                    
                } else {
                    HStack {
                        Spacer()
                        Text("Корзина пуста")
                        .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white.opacity(0.8))
                    }
                    .padding()
                }
                  
                if !basket.basket.isEmpty{
           
                    ItemsList(array: $basket.basket, selectedItem: $selectedItem, showDetail: $showDetail)
                        
                    
                }
                    if !basket.basket.isEmpty{
                       
                        HStack {
                            Spacer()
                            Button(action: {
                                pay.toggle()
                               
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                    withAnimation(Animation.spring()){
                                        basket.basket.removeAll()
                                        pay.toggle()
                                    }
                                }
                            }, label: {
                               
                                HStack {
                                    Text(pay ? "Оплачено!" : "Оплатить")
                                       
                                    Image(systemName: "applelogo")
                                    
                                    Text("Pay")
                                        .padding(.leading, -5)
                                }
                                .font(.system(.headline, design: .rounded))
                                .padding()
                                .font(.system(size: 15))
                                .background(LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                                                .frame(width: 200, height: 60)
                                                .cornerRadius(15)
                                                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 2, y: 2)
                                                .shadow(color: Color.black.opacity(0.3), radius: 2, x: -2, y: -2))
                                
                            })
                            Spacer()
                        }
                        .padding(.top)
                       
                    }
                NavigationLink("",destination:  Detail(item: $selectedItem, show: $showDetail),
                                   isActive: $showDetail)
                Spacer()
            }
                .padding(.top, -90)
                .accentColor(.white)
       
            .navigationBarTitle("")
        .background(LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all, edges: .all))
      
    }
}

