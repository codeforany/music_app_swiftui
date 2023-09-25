//
//  AlbumsView.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 25/08/23.
//

import SwiftUI

struct AlbumsView: View {
    
    @State var allArr: NSArray = [
        [
              "image": "alb_1",
              "name": "History",
              "artists": "Michael Jackson",
              "songs": "10 Songs"
            ],
            [
              "image": "alb_2",
              "name": "Thriller",
              "artists": "Michael Jackson",
              "songs": "10 Songs"
            ],
            [
              "image": "alb_3",
              "name": "It Won't Be Soon. . ",
              "artists": "Maroon 5",
              "songs": "10 Songs"
            ],
            [
              "image": "alb_4",
              "name": "I Am... Yours",
              "artists": "Beyonce",
              "songs": "10 Songs"
            ],
            [
              "image": "alb_5",
              "name": "Earth song",
              "artists": "Michael Jackson",
              "songs": "10 Songs"
            ],
            [
              "image": "alb_6",
              "name": "Smooth criminal",
              "artists": "Michael Jackson",
              "songs": "10 Songs"
            ]
    ]
    
    var columnGrid = [ GridItem( .flexible(), spacing: 15 ), GridItem(.flexible(), spacing: 15) ]
    
    var body: some View {
        ScrollView{
            
            LazyVGrid(columns: columnGrid, spacing: 15) {
                ForEach (0..<allArr.count, id:\.self) {
                    index in
                    
                    let sObj = allArr[index] as? NSDictionary ?? [:]
                    
                    NavigationLink {
                        AlbumDetailsView()
                    } label: {
                        AlbumCell(sObj: sObj)
                    }

                   
                }
            }
            .padding(15)
            
        }
        .background(Color.bg)
        .ignoresSafeArea()
        
    }
}

struct AlbumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AlbumsView()
        }
        
    }
}
