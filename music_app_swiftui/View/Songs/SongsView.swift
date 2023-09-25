//
//  SongsView.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 24/08/23.
//

import SwiftUI

struct SongsView: View {
    
    @StateObject var mainVM = MainViewModel.share
    @State var selectTab: Int = 0
    
    var body: some View {
        ZStack{
            
            VStack{
                HStack(spacing: 15){
                    Button {
                        print("open Menu")
                        mainVM.isShowMenu = true
                    } label: {
                        Image("menu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                    
                    Text("Songs")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText80)
                    
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("search")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.primaryText28)
                    }
                    
                    
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                
                ScrollViewReader { scrollView in
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack(alignment: .bottomLeading) {
                            
                            HStack(spacing: 15) {
                                ScrollTabButton(title: "All Songs", isSelect: selectTab == 0) {
                                    
                                    withAnimation {
                                        scrollView.scrollTo(0, anchor: .center)
                                        selectTab = 0
                                    }
                                }
                                .id(0)
                                
                                ScrollTabButton(title: "Playlists", isSelect: selectTab == 1) {
                                    
                                    withAnimation {
                                        scrollView.scrollTo(1, anchor: .center)
                                        selectTab = 1
                                    }
                                }
                                .id(1)
                                
                                ScrollTabButton(title: "Albums", isSelect: selectTab == 2) {
                                    
                                    withAnimation {
                                        scrollView.scrollTo(2, anchor: .center)
                                        selectTab = 2
                                    }
                                }
                                .id(2)
                                
                                ScrollTabButton(title: "Artists", isSelect: selectTab == 3) {
                                    
                                    withAnimation {
                                        scrollView.scrollTo(3, anchor: .center)
                                        selectTab = 3
                                    }
                                }
                                .id(3)
                                
                                
                                ScrollTabButton(title: "Genres", isSelect: selectTab == 4) {
                                    
                                    withAnimation {
                                        scrollView.scrollTo(4, anchor: .center)
                                        selectTab = 4
                                    }
                                }
                                .id(4)
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                            
                            Rectangle()
                                .fill( Color.focusStart )
                                .frame( width: 70, height: 2, alignment: .leading )
                                .padding(.leading, ( CGFloat( selectTab ) * (70 + 15) + 20 ) )
                            
                        }
                        
                    }
                    .onChange(of: selectTab) { _ in
                        withAnimation {
                            scrollView.scrollTo(selectTab, anchor: .center)
                        }
                    }
                }
                .frame(height: 25)
                .background( Color.bg )
                
                TabView(selection: $selectTab) {
                    
                    AllSongsView()
                        .tag(0)
                    
                    PlaylistsView()
                    .tag(1)
                    
                    AlbumsView()
                    .tag(2)
                    
                    
                    ArtistsView()
                    .tag(3)
                    
                    GenresView()
                    .tag(4)
                    
                }
                .tabViewStyle(PageTabViewStyle( indexDisplayMode: .never))
                .padding(.bottom, .bottomInsets + 40)
            }
            
            
        }
        .onAppear{
            UITabBar.appearance().isHidden = true
        }
        .frame(width: .screenWidth, height: .screenHeight)
        .background(Color.bg)
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct SongsView_Previews: PreviewProvider {
    static var previews: some View {
        SongsView()
    }
}
