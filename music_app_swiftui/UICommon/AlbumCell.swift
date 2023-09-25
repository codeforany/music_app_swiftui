//
//  AlbumCell.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 25/08/23.
//

import SwiftUI

struct AlbumCell: View {
    var sObj: NSDictionary =   [
        "image": "alb_1",
        "name": "History",
        "artists": "Michael Jackson",
        "songs": "10 Songs"
      ]
    
    var body: some View {
        VStack {
            Image(sObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
                .aspectRatio( CGSize(width: 1, height: 1) , contentMode: .fit)
                .frame(width: .infinity, height: .infinity)
                
            
            VStack(spacing: 4){
                
                    HStack{
                        Text(sObj.value(forKey: "name") as? String ?? "")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Menu {
                            Button {
                                
                            } label: {
                                Text("Play")
                                    .foregroundColor(.primaryText)
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Play next")
                                    .foregroundColor(.primaryText)
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Add to playlist queue")
                                    .foregroundColor(.primaryText)
                            }
                            
                            
                            Button {
                                
                            } label: {
                                Text("Add to playlist")
                                    .foregroundColor(.primaryText)
                            }
                            
                            
                            Button {
                                
                            } label: {
                                Text("Rename")
                                    .foregroundColor(.primaryText)
                            }
                            
                            
                            Button {
                                
                            } label: {
                                Text("Tag Editor")
                                    .foregroundColor(.primaryText)
                            }
                            
                            
                            Button {
                                
                            } label: {
                                Text("Go to artist")
                                    .foregroundColor(.primaryText)
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Delete form device")
                                    .foregroundColor(.primaryText)
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Share")
                                    .foregroundColor(.primaryText)
                            }
                            

                        } label: {
                            Image("more_btn")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                        }
                        .environment(\.colorScheme, .dark)

                    }
                    
                    HStack{
                        Text(sObj.value(forKey: "artists") as? String ?? "")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(Color.primaryText28)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text("•")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(Color.primaryText28)
                        
                        Text(sObj.value(forKey: "songs") as? String ?? "")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(Color.primaryText28)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                  
           
        }
    }
}

struct AlbumCell_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCell()
            
            .background(Color.bg)
            .frame(width: 200)
    }
}
