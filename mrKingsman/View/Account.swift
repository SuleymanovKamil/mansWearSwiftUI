//
//  Account.swift
//  mrKingsman
//
//  Created by Камиль  Сулейманов on 08.01.2021.
//

import SwiftUI
import CoreLocation

struct Account: View {
    @EnvironmentObject var user: AccountModel
    @State var viewState:CGFloat = .zero
    @Binding var hide: Bool
    
    var body: some View {
        VStack (spacing: 10){
            Text(user.userLocation == nil ? "Уточняем адрес..." : "Адрес доставки")
                .font(.headline)
                .padding(.top)
                .padding(.leading)
            
            Text(user.userAddress)
                .font(.subheadline)
                .fontWeight(.heavy)
                .padding(.leading)
                          
            Spacer()
        }

        .foregroundColor(Color.white.opacity(0.8))
        .padding(.top, 50)
        .onAppear(perform: {
            user.locationManager.delegate = user
        })
        .frame(width: width, height: height + 20)
        .background(LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .clipShape(CustomCorner())
                        .shadow(color: Color.black.opacity(0.5), radius: 3, x: 3, y: -3))
        .gesture(
            DragGesture().onChanged{ value in
                withAnimation(.easeIn(duration: 0.5)){
                    if -value.translation.width >= 50 {
                        viewState = value.translation.width
                    }
                }
            }
            .onEnded{ value in
                if -value.translation.width >= 50 {
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
        .offset(x: viewState)
    }
}

