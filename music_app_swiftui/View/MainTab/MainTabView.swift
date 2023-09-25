//
//  MainTabView.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 21/08/23.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var mainVM = MainViewModel.share
    
    
    var body: some View {
        ZStack {
            
            if(mainVM.selectTab == 0) {
                HomeView()
            }
            else if(mainVM.selectTab == 1) {
                SongsView()
            }else if(mainVM.selectTab == 2) {
                
                SettingsView()
            }
            
            
            VStack {
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    TabButton(title: "Home", icon: "home_tab", iconUnfocus: "home_tab_un", isSelect: mainVM.selectTab == 0) {
                        mainVM.selectTab = 0
                    }
                    
                    Spacer()
                    
                    TabButton(title: "Songs", icon: "songs_tab", iconUnfocus: "songs_tab_un", isSelect: mainVM.selectTab == 1) {
                        mainVM.selectTab = 1
                    }
                    
                    Spacer()
                    
                    TabButton(title: "Settings", icon: "setting_tab", iconUnfocus: "setting_tab_un", isSelect: mainVM.selectTab == 2) {
                        mainVM.selectTab = 2
                    }
                    
                    Spacer()
                    

                }
                .padding(.top, 10)
                .padding(.bottom, .bottomInsets)
                .background(Color.bg)
                .shadow(radius: 5)
            }
            
            SideMenuView(isShowing: $mainVM.isShowMenu)
            
        }
        .frame(width: .screenWidth, height: .screenHeight)
        .background(Color.bg)
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
