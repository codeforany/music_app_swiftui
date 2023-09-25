//
//  MyPlaylistCell.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 25/08/23.
//

import SwiftUI

struct MyPlaylistCell: View {
    
    var sObj: NSDictionary =  [
        "image": "mp_1",
        "name": "Queens Collection"
    ]
    
    var body: some View {
        VStack {
            Image(sObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 80)
                .overlay( RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.primaryText28, lineWidth: 1)
                )
                .padding(.bottom, 4)
                
            Text(sObj.value(forKey: "name") as? String ?? "")
                .font(.customfont(.medium, fontSize: 12))
                .lineLimit(1)
                .foregroundColor(.primaryText60)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
        }
        .frame(width: 90)
    }
}

struct MyPlaylistCell_Previews: PreviewProvider {
    static var previews: some View {
        MyPlaylistCell()
            .padding(30)
            .background(Color.bg)
    }
}
