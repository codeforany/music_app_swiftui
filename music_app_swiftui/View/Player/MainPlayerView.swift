//
//  MainPlayerView.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 28/08/23.
//

import SwiftUI
import CircularSlider
import SDWebImageSwiftUI

struct MainPlayerView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var seekbarVal: Double = 0.5
    
    @StateObject var model = AudioPlayerViewModel.shared
   
    
    
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
                    
                    Text("Now Playing")
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
                        
                        NavigationLink {
                            DriverModeView()
                        } label: {
                            Text("Driver Mode")
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
                    
                    ZStack {
                        
                        let _ = print(model.artwork)
                        
                        WebImage( url: URL(string: model.artwork))
                            .resizable()
                            .indicator(.activity)
                            .transition(.fade(duration: 0.5))
                            .scaledToFit()
                            .frame(width: .widthPer(per: 0.6), height: .widthPer(per: 0.6))
                            .cornerRadius(.widthPer(per: 0.3))
                            .clipped()
                        
                        CircularSlider(currentValue: $model.sliderValue,
                                       minValue: 0.0,
                                       maxValue: model.sliderMaximumValue,
                                       knobRadius: 10, knobColor: Color.focusStart,
                                       radius:  Double( CGFloat.widthPer(per: 0.3)),
                                       progressLineColor: Color.focusStart,
                                       textColor: .clear,
                                                   currentValueSuffix: "")
                        .padding(20)
                    }
                    .padding(.bottom, 4)
                    
                    ProgressSliderView(value: $model.sliderValue,
                                                       maximumValue: $model.sliderMaximumValue,
                                                       isUserInteractionEnabled: $model.sliderIsUserInteractionEnabled,
                                                       playableProgress: $model.sliderPlayableProgress) {
                        model.sliderValueChanged.send($0)
                                    }
                                        .padding(.horizontal)
                    
                    
                    Text("\(model.duration) | -\(model.restDuration)")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .padding(.bottom, 15)
                    
                    Text(model.title)
                        .font(.customfont(.medium, fontSize: 18))
                        .foregroundColor(.primaryText.opacity(0.9))
                        .padding(.bottom, 4)
                    
                    Text("\( model.artist )")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .padding(.bottom, 15)
                    
                    Image("eq_display")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 70)
                    
                    Divider()
                        .padding(20)
                    
                    HStack(spacing: 25) {
                        Button {
                            model.playPrevious()
                        } label: {
                            Image("previous_song")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                        }
                        .disabled(!model.canPlayPrevious)
                        
                        Button {
                            model.canPlay ? model.play() : model.pause()
                        } label: {
                            Image( model.canPlay ? "play" : "pause" )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            model.playNext()
                        } label: {
                            Image("next_song")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                        }
                        .disabled(!model.canPlayNext)

                    }
                    
                    HStack(spacing: 25) {
                        NavigationLink {
                            PlayPlaylistView()
                        } label: {
                            PlayerBottomButton(title: "Playlist", icon: "playlist")
                        }
                        
                        Button {
                            model.shuffle()
                        } label: {
                            PlayerBottomButton(title: "Shuffle", icon: "shuffle")
                        }
                        
                        Button {
                            model.doRepeat()
                        } label: {
                            PlayerBottomButton(title: "Repeat", icon: "repeat")
                        }
                        
                        Button {
                            
                        } label: {
                            PlayerBottomButton(title: "EQ", icon: "eq")
                        }
                        
                        Button {
                            
                        } label: {
                            PlayerBottomButton(title: "Favourites", icon: "favTemp")
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

struct MainPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainPlayerView()
        }
        
    }
}
