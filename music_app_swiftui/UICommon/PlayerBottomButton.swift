//
//  PlayerBottomButton.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 28/08/23.
//

import SwiftUI

struct PlayerBottomButton: View {
    var title: String = "Playlist"
    var icon: String = "playlist"
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.primaryText)
            
            Text(title)
                .font(.customfont(.regular, fontSize: 10))
                .foregroundColor(.secondaryText)
             
        }
    }
}

struct PlayerBottomButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBottomButton()
            .padding(20)
            .background(Color.bg)
            
    }
}
