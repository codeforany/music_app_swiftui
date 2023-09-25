//
//  ArtistAlbumCell.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 27/08/23.
//

import SwiftUI

struct ArtistAlbumCell: View {
    @State var sObj: NSDictionary = [:]
    
    var body: some View {
        VStack {
            Image(sObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 80)
                .padding(.bottom, 4)
                .clipped()
                
            Text(sObj.value(forKey: "name") as? String ?? "")
                .font(.customfont(.bold, fontSize: 13))
                .foregroundColor(.primaryText60)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Text(sObj.value(forKey: "year") as? String ?? "")
                .font(.customfont(.bold, fontSize: 10))
                .foregroundColor(Color.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 90)
    }
}

struct ArtistAlbumCell_Previews: PreviewProvider {
    static var previews: some View {
        ArtistAlbumCell(sObj: [
            "image":"ar_d_1",
            "name":"Fire Dragon",
            "year":"2019",
        ])
        .padding(80)
        .background(Color.bg)
    }
}
