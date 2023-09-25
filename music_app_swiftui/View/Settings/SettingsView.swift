//
//  SettingsView.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 29/08/23.
//

import SwiftUI

struct SettingsView: View {
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
                    
                    Text("Settings")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText80)
                    
                    
                    Spacer()
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                
                
                ScrollView( showsIndicators: false) {
                    VStack{
                        SettingRow(title: "Display", icon: "s_display")
                        SettingRow(title: "Audio", icon: "s_audio")
                        SettingRow(title: "Headset", icon: "s_headset")
                        SettingRow(title: "Lock Screen", icon: "s_lock_screen")
                        SettingRow(title: "Advanced", icon: "s_menu")
                        SettingRow(title: "Other", icon: "s_other")
                    }
                    .padding(20)
                    
                    
                }
            }
        }
        .frame(width: .screenWidth, height: .screenHeight)
        .background(Color.bg)
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
