//
//  Main.swift
//  mrKingsman
//
//  Created by Камиль  Сулейманов on 07.01.2021.
//

import SwiftUI

struct Main: View {
    @State var show = false
    @State var selectedItem : item = hats[0]
    @State var showTopMenu = false
    @State var showHats = false
    @State var showTop = false
    @State var showDown = false
    @State var showBoots = false
    @StateObject var basket = BasketModel()
    @State var showBasket = false
    @State var showFav = false
    @State var showAccount = false
    @StateObject var user = AccountModel()
    @State var start = false
    @State var alert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView (showsIndicators: false) {
                    VStack (alignment:.leading, spacing: 10) {
                        
              
                        GeometryReader{reader -> AnyView in
                            let y = reader.frame(in: .global).minY
                            if y < -20 && start {
                                withAnimation(.linear){ showTopMenu = true}
                            }
                            else{
                                withAnimation(.linear){showTopMenu = false}
                            }
                            return AnyView(
                                Text("")
                                    .offset(y: -10))
                        
                        } 
                        HStack {
                            Image("logo")
                                .resizable()
                                .frame(width: 60, height: 60)
                            
                            Text("Mr.Kingsman")
                                .font(.title2)
                                .bold()
                            
                            Spacer()
                            
                            Button(action: {
                                withAnimation(.spring()){
                                    showAccount = false
                                    alert.toggle()
                                }
                            }, label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                                    .alert(isPresented: $alert) {
                                        return Alert(title: Text("Alert"), message: Text("This is alert"), dismissButton: .default(Text("OK")))
                                    }
                                    
                            })
                           
                        }
                        .padding(.horizontal)
                        .padding(.top, 40)
                        .opacity(showTopMenu ? 0 : 1)
                        
                        Group {
                            Spacer(minLength: 20)
                            Button(action: {
                                withAnimation(.easeInOut){
                                    showAccount = false
                                    showHats.toggle()
                                }
                            }, label: {
                                HStack {
                                    VStack (alignment: .leading){
                                        Text("Аксессуары")
                                            .font(.title2)
                                            .bold()
                                        
                                        Text("Шапки, кепки, ремни")
                                            .font(.subheadline)
                                    }
                                    .padding(.leading, 30)
                                    
                                    Spacer()
                                    
                                    Image(systemName: showHats ? "minus" : "plus")
                                        .font(.system(size: 20))
                                        .padding(.trailing)
                                }
                                .foregroundColor(.white)
                            })
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: Array(repeating: GridItem(.flexible(),spacing: 10), count: 1),spacing: 20){
                                    ForEach(0..<hats.count, id: \.self) { index in
                                        Carts(item: hats[index], selectedItem: $selectedItem, show: $show, basket: basket)
                                    }
                                }
                                .padding()
                                .frame(height: showHats ? 220 : 0)
                            }
                            
                        }
                        
                        Group {
                            
                            Button(action: {
                                withAnimation(.easeInOut){
                                    showAccount = false
                                    showTop.toggle()
                                }
   
                            }, label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Верхняя одежда")
                                            .font(.title2)
                                            .bold()
                                        
                                        Text("Куртки, жилеты, пальто")
                                            .font(.subheadline)
                                    }
                                    .padding(.leading, 30)
                                    Spacer()
                                    Image(systemName: showTop ? "minus" : "plus")
                                        .font(.system(size: 20))
                                        .padding(.trailing)
                                }
                                .foregroundColor(.white)
                            })
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: Array(repeating: GridItem(.flexible(),spacing: 20), count: 1),spacing: 20){
                                    ForEach(0..<jackets.count, id: \.self) { index in
                                        Carts(item: jackets[index], selectedItem: $selectedItem, show: $show, basket: basket)
                                    }
                                }
                                .padding()
                                .frame(height: showTop ? 220 : 0)
                            }
                        }
                        
                        Group {
                            
                            Button(action: {
                                withAnimation(.easeInOut){
                                    showAccount = false
                                    showDown.toggle()
                                }
                            }, label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Брюки")
                                            .font(.title2)
                                            .bold()
                                        
                                        Text("Классика, спортивные штаны, джинсы")
                                            .font(.subheadline)
                                        
                                    }
                                    .padding(.leading, 30)
                                    Spacer()
                                    Image(systemName: showDown ? "minus" : "plus")
                                        .font(.system(size: 20))
                                        .padding(.trailing)
                                }
                                .foregroundColor(.white)
                            })
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 1),spacing: 20){
                                    ForEach(0..<pants.count, id: \.self) { index in
                                        Carts(item: pants[index], selectedItem: $selectedItem, show: $show, basket: basket)
                                    }
                                }
                                .padding()
                                .frame(height: showDown ? 220 : 0)
                            }
                        }
                        
                        Group {
                            
                            Button(action: {
                                withAnimation(.easeInOut){
                                    showAccount = false
                                    showBoots.toggle()
                                }  
                            }, label: {
                                HStack {
                                    
                                    VStack (alignment: .leading) {
                                        Text("Обувь")
                                            .font(.title2)
                                            .bold()
                                        
                                        Text("Туфли, кроссовки, кеды")
                                            .font(.subheadline)
                                    }
                                    .padding(.leading, 30)
                                    Spacer()
                                    
                                    Image(systemName: showBoots ? "minus" : "plus")
                                        .font(.system(size: 20))
                                        .padding(.trailing)
                                }
                                .foregroundColor(.white)
                            })
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: Array(repeating: GridItem(.flexible(),spacing: 20), count: 1),spacing: 20){
                                    ForEach(0..<shoes.count, id: \.self) { index in
                                        Carts(item: shoes[index], selectedItem: $selectedItem, show: $show, basket: basket)
                                    }
                                }
                                .padding()
                                .frame(height: showBoots ? 220 : 0)
                            }
                            
                            
                        }
                        
                      
                        Spacer()
                        
                    }
                    .padding(.bottom, 90)
                }
                
                //Scroll menu & tabbar
                VStack {
                    ScrollTopMenu(showTopMenu: $showTopMenu, showFav: $showFav)
                    
                    Spacer()
   
                    TabBar(showAccount: $showAccount, showFav: $showFav, showBasket: $showBasket, basket: basket, user: user)
   
                }
              
                
                //Navigations 
                
                NavigationLink("",destination:  Detail(item: $selectedItem, show: $show),
                               isActive: $show)
                
                NavigationLink("",destination:   Basket(hide: $showBasket)
                               ,isActive: $showBasket)
                

                    Favorites(hide: $showFav)
                    .offset(y: showFav ? -80 : -height )
                
                     Account(hide: $showAccount)
                        .offset(x: showAccount ? -50 : -width )
              
   
            }
            .onTapGesture {
                withAnimation(.spring()){
                    showAccount = false
                }
                
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
            .background(  LinearGradient(gradient: Gradient(colors:
                                                                [Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all, edges: .all))
        }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    start = true
                }
            }
        .accentColor(Color.orange.opacity(0.7))
        .environmentObject(basket)
        .environmentObject(user)
    }
}

