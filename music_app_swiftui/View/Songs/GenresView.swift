//
//  GenresView.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 25/08/23.
//

import SwiftUI

struct GenresView: View {
    @State var allArr: NSArray = [
        [
                    "image": "gen_1",
                    "name": "Classical",
                    "songs": "56 Songs"
                ],
                [
                    "image": "gen_2",
                    "name": "Pop",
                    "songs": "80 Songs"
                ],
                [
                    "image": "gen_3",
                    "name": "Hip-Hop",
                    "songs": "56 Songs"
                ],
                [
                    "image": "gen_4",
                    "name": "Rock",
                    "songs": "120 Songs"
                ],
                [
                    "image": "gen_5",
                    "name": "Soul and R&B",
                    "songs": "99 Songs"
                ],
                [
                    "image": "gen_6",
                    "name": "Instrumental",
                    "songs": "140 Songs"
                ],
                
                [
                    "image": "gen_7",
                    "name": "Jazz",
                    "songs": "70 Songs"
                ],
                [
                    "image": "gen_8",
                    "name": "Country Music",
                    "songs": "80 Songs"
                ]
    ]
    
    var columnGrid = [ GridItem( .flexible(), spacing: 15 ), GridItem(.flexible(), spacing: 15) ]
    
    var body: some View {
        ScrollView{
            
            LazyVGrid(columns: columnGrid, spacing: 15) {
                ForEach (0..<allArr.count, id:\.self) {
                    index in
                    
                    var pObj = allArr[index] as? NSDictionary ?? [:]
                    GenreCell(pObj: pObj)
                }
            }
            .padding(15)
            
        }
        .background(Color.bg)
        .ignoresSafeArea()
        
    }
}

struct GenresView_Previews: PreviewProvider {
    static var previews: some View {
        GenresView()
    }
}
