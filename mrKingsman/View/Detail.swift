//
//  Detail.swift
//  mrKingsman
//
//  Created by Камиль  Сулейманов on 05.01.2021.
//

import SwiftUI

struct Detail: View {
    @Binding var item: item
    @Binding var show: Bool
    @State var size = ""
    @EnvironmentObject var basket: BasketModel
    @State var showBasket = false
    
    var body: some View{
     
        
                VStack (alignment:.center) {
                
                        VStack (spacing: 10) {
                            ZStack {
                                Circle()
                                    .frame(width: width - 70 + 15, height: width - 70 + 15)
                                    .foregroundColor(Color.orange.opacity(0.7))
                                  
                                
                                Image(item.image)
                                    .resizable()
                                    .frame(width: width - 70, height: width - 70)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(width - 70 / 2)
                                 
                            }
                            .offset(x: 10, y: 20)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: -3, y: -3)
                            
                                Text(item.name)
                                    .font(.title2)
                                    .bold()
                                    .padding(.top, 20)
                                    .foregroundColor(Color.orange.opacity(0.7))
                            
                                Text(item.description)
                                
                                Text("Размерный ряд:")
                                    .font(.subheadline)
                                    .padding(.top)
                                    .padding(.bottom, 5)
                                
                                HStack (spacing: 6){
                                    ForEach(sizes.indices) { index in
                                        
                                        Button(action: {
                                            size = sizes[index]
                                        }, label: {
                                            Text(sizes[index])
                                                .foregroundColor(.white)
                                                .font(.subheadline)
                                                .bold()
                                                .frame(width: 40, height:40)
                                                .background(size == sizes[index] ? LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)), Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))]), startPoint: .bottom, endPoint: .top): LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]), startPoint: .bottom, endPoint: .top))
                                                .cornerRadius(25)
                                        })
                                        
                                    }
                                }
                                .padding(.bottom)
                                Text("Цена: \(item.price)₽")
                                    .font(.title3)
                                    .padding(.bottom)
                                    
                               
            
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        .background(LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                                .clipShape(CustomShape2())
                                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 2, y: 2)
                                .shadow(color: Color.black.opacity(0.3), radius: 2, x: -2, y: -2))
                    
                   
                    
                    HStack {
                        Button(action: {
                            if !basket.basket.contains(item) {
                                basket.basket.append(item)
                                
                            } else {
                                withAnimation(.spring()){
                                    showBasket.toggle()
                                   
                                }
                            }
                        }, label: {
                            Text(basket.basket.contains(item) ? "Оформить" : "В корзину")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 20)
                                .frame(width: 150)
                                .background(basket.basket.contains(item) ? LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)), Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))]), startPoint: .bottom, endPoint: .top): LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]), startPoint: .bottom, endPoint: .top))
                                .cornerRadius(20)
                                .padding(.bottom)
                        })
                        
                        Button(action: {
                            if !basket.favorites.contains(item) {
                                basket.favorites.append(item)
                            } else {
                                basket.favorites.remove(object: item)
                            }
                        }, label: {
                            Text(basket.favorites.contains(item) ? "В избранном" : "В избранное")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 20)
                                .frame(width: 150)
                                .background(basket.favorites.contains(item) ? LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)), Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))]), startPoint: .bottom, endPoint: .top): LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]), startPoint: .bottom, endPoint: .top))
                                .cornerRadius(20)
                                .padding(.bottom)
                        })
                       
                    }
                    .padding(.top)
                    
                    Spacer()
                    NavigationLink("",destination:   Basket(hide: $showBasket)
                                   ,isActive: $showBasket)
                }
                .frame(width: width)
                .foregroundColor(Color.white.opacity(0.7))
                .padding()
                .accentColor(.white)
                .offset(y: -70)
            
           
            .background(LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all, edges: .all))
 
          
        
        .navigationBarTitle("")
    }
}


