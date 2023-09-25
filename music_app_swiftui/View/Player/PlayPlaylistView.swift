//
//  PlayPlaylistView.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 28/08/23.
//

import SwiftUI
import CircularSlider

struct PlayPlaylistView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var seekbarVal: Double = 0.5
    
    @State var allArr: NSArray = [
        [
            
            "image": "s1",
            "name": "Billie Jean",
            "artist": "Michael Jackson"
        ],
        [
            "image": "s2",
            "name": "Be the girl",
            "artist": "Bebe Rexa"
        ],
        [
            "image": "s3",
            "name": "Countryman",
            "artist": "Daughtry"
        ],
        [
            "image": "s4",
            "name": "Do you feel lonelyness",
            "artist": "Marc Anthony"
        ],
        [
            "image": "s5",
            "name": "Earth song",
            "artist": "Michael Jackson"
        ],
        [
            "image": "s6",
            "name": "Smooth criminal",
            "artist": "Michael Jackson"
        ],
        [
            "image": "s7",
            "name": "The way you make me feel",
            "artist": "Michael Jackson"
        ],
        
        [
            "image": "s9",
            "name": "Somebody that I used to know",
            "artist": "Gotye"
        ],
        [
            "image": "s10",
            "name": "Wild Thoughts",
            "artist": "Michael Jackson"
        ]
    ]
   
    
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button {
                        self.mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Text("Playlist")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText80)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Menu {
                        Button {
                            
                        } label: {
                            Text("Social Share")
                                .foregroundColor(.primaryText)
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Playing Queue")
                                .foregroundColor(.primaryText)
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Add to playlist ...")
                                .foregroundColor(.primaryText)
                        }
                        
                        
                        Button {
                            
                        } label: {
                            Text("Lyrics")
                                .foregroundColor(.primaryText)
                        }
                        
                        
                        Button {
                            
                        } label: {
                            Text("Volume")
                                .foregroundColor(.primaryText)
                        }
                        
                        
                        Button {
                            
                        } label: {
                            Text("Details")
                                .foregroundColor(.primaryText)
                        }
                        
                        
                        Button {
                            
                        } label: {
                            Text("Sleep Timer")
                                .foregroundColor(.primaryText)
                        }
                    } label: {
                        Image("more_btn")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .environment(\.colorScheme, .dark)
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal,20)
                
                ScrollView{
                    
                    HStack(spacing: 25) {
                        Button {
                            
                        } label: {
                            Image("previous_song")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Image("player_image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: .widthPer(per: 0.4), height: .widthPer(per: 0.4))
                                .cornerRadius(.widthPer(per: 0.2))
                                .clipped()
                            
                            CircularSlider(currentValue: $seekbarVal,
                                           minValue: 0.0,
                                           maxValue: 1.0,
                                           knobRadius: 10, knobColor: Color.focusStart,
                                           radius:  Double( CGFloat.widthPer(per: 0.2)),
                                           progressLineColor: Color.focusStart,
                                           textColor: .clear,
                                                       currentValueSuffix: "")
                            .frame(width: .widthPer(per: 0.45), height: .widthPer(per: 0.45))
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("next_song")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                        }

                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 4)
                    
                    
                    Text("3:15 | 4.26")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .padding(.bottom, 15)
                    
                    Text("Black or White")
                        .font(.customfont(.medium, fontSize: 18))
                        .foregroundColor(.primaryText.opacity(0.9))
                        .padding(.bottom, 4)
                    
                    Text("Michael Jackson • Album - Dangerous")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.primaryText60)
                        .padding(.bottom, 15)
                    
                    
                    
                    
                    
                    LazyVStack(spacing: 10) {
                        ForEach( 0..<allArr.count, id:\.self ) {
                            index in
                            
                            var sObj = allArr[index] as? NSDictionary ?? [:]
                            
                            NavigationLink {
                                MainPlayerView()
                            } label: {
                                AllSongRow(sObj: sObj)
                            }
                        }
                    }
                    .padding(20)
                }
                
            }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .background(Color.bg)
        .ignoresSafeArea()
    }
}

struct PlayPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlayPlaylistView()
    }
}
