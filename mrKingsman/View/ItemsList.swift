//
//  ItemsList.swift
//  mrKingsman
//
//  Created by Камиль  Сулейманов on 09.01.2021.
//

import SwiftUI

struct ItemsList: View {
    @Binding var array: [item]
    @Binding var selectedItem : item
    @Binding var showDetail: Bool
    
    var body: some View {
        ScrollView(array.count > 5 ? .vertical : [], showsIndicators: false) {
            ZStack {
                VStack {
                    ForEach(0..<array.count, id: \.self) { index in
                        GeometryReader { geo in
                            
                            ZStack {
                                
                                Circle()
                                    .frame(width: 95, height: 95)
                                    .foregroundColor(Color.orange.opacity(0.7))
                                    
                                
                                Image(array[index].image)
                                    .resizable()
                                    .frame(width: 90, height: 90)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(60)
                                  
                            }
                            .zIndex(1)
                            .offset(x: 10, y: -10)
                            .offset(y: geo.frame(in: CoordinateSpace.global).origin.y < 80 ? -height : 0)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text(array[index].name)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                    }
                                    Text("Цена: \(array[index].price)₽")
                                        .font(.subheadline)
                                }
                                .onTapGesture {
                                    selectedItem = array[index]
                                    showDetail.toggle()
                                }
                                .padding()
                                
                                Spacer()
                                Button(action: {
                                    withAnimation(.easeInOut){
                                        array.remove(object: array[index])
                                        
                                    }
                                },label: {
                                    ZStack {
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.red)
                                        
                                        Image(systemName: "trash.fill")
                                            .font(.system(size: 15))
                                            .foregroundColor(.white)
                                    }
                                    
                                })
                            }
                            .padding(.leading, 80)
                            .foregroundColor(Color.white.opacity(0.8))
                            .padding(.horizontal)
                            .background(LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                                            .cornerRadius(20))
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 3, y: 3)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -3, y: -3)
                            .offset(y: geo.frame(in: CoordinateSpace.global).origin.y < 80 ? -height : 0)
                           
                        }
                        .animation(.spring())
                        .padding(.horizontal)
                        .frame(width: width, height: 95)
                    }
                    
                }
                .padding(.top)
            }
        }
    }
}

