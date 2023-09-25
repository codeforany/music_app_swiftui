//
//  TabButton.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 21/08/23.
//

import SwiftUI

struct TabButton: View {
    @State var title: String = "Home"
    @State var icon: String = "home_tab"
    @State var iconUnfocus: String = "home_tab_un"
    var isSelect: Bool = false
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            VStack {
                Image( isSelect ? icon : iconUnfocus)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Text(title)
                    .font(.customfont(.regular, fontSize: 12))
                    .foregroundColor(isSelect ? .focus : .unfocused )
            }
            
        }
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton()
    }
}
