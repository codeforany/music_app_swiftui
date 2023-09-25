//
//  ArtistsView.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 25/08/23.
//

import SwiftUI

struct ArtistsView: View {
    
    @State var allArr: NSArray = [
        [
                      "image": "ar_1",
                      "name": "Beyonce",
                      "albums": "4 albums",
                      "songs": "38 Songs"
                    ],
                    [
                      "image": "ar_2",
                      "name": "Bebe Rexha",
                      "albums": "2 albums",
                      "songs": "18 Songs"
                    ],
                    [
                      "image": "ar_3",
                      "name": "Maroon 5",
                      "albums": "5 albums",
                      "songs": "46 Songs"
                    ],
                    [
                      "image": "ar_4",
                      "name": "Michael Jackson",
                      "albums": "10 albums",
                      "songs": "112 Songs"
                    ],
                    [
                      "image": "ar_5",
                      "name": "Queens",
                      "albums": "3 albums",
                      "songs": "32 Songs"
                    ],
                    [
                      "image": "ar_6",
                      "name": "Yani",
                      "albums": "1 albums",
                      "songs": "13 Songs"
                    ]
    ]
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 15) {
                ForEach( 0..<allArr.count, id:\.self ) {
                    index in
                    
                    var aObj = allArr[index] as? NSDictionary ?? [:]
                    
                    NavigationLink {
                        ArtistDetailsView()
                    } label: {
                        ArtistCell(aObj: aObj)
                    }
                    
                }
            }
            .padding(20)
        }
        .background(Color.bg)
        .ignoresSafeArea()
    }
}

struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ArtistsView()
        }
        
    }
}
