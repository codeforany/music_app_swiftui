//
//  AlbumSongRow.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 27/08/23.
//

import SwiftUI

struct AlbumSongRow: View {
    
    @State var sObj: NSDictionary = [:]
    var isPlay: Bool = false
    
    var body: some View {
        VStack {
            
            HStack(spacing: 15) {
                
                Button {
                    
                } label: {
                    Image( "play_btn")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                
                Text(sObj.value(forKey: "name") as? String ?? "")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.primaryText60)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                Text(sObj.value(forKey: "duration") as? String ?? "")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.primaryText60)
                
                
                if(isPlay) {
                    Image("play_eq")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 40, alignment: .center)
                }else{
                    Button {
                        
                    } label: {
                        Image( "more")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .frame(width: 80, height: 40, alignment: .trailing)
                }
                

            }
            
            Divider()
                .padding(.leading, 50)
            
        }
        .frame(height: 44)
    }
}

struct AlbumSongRow_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSongRow(sObj: ["duration": "3:56", "name": "Billie Jean", "artists": "Michael Jackson"])
            .padding(.horizontal, 20)
            .background(Color.bg)
            
    }
}
