//
//  AudioPlayerViewModel.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 03/09/23.
//

import SwiftUI
import Combine
import RxMusicPlayer
import RxSwift
import RxCocoa

class AudioPlayerViewModel: ObservableObject {
    static var shared: AudioPlayerViewModel = AudioPlayerViewModel()
    
    private let disposeBag = DisposeBag()
    private let player: RxMusicPlayer
    private let commandRelay = PublishRelay<RxMusicPlayer.Command>()

    @Published var canPlay = true
    @Published var canPlayNext = true
    @Published var canPlayPrevious = true
    @Published var canSkipForward = true
    @Published var canSkipBackward = true
    @Published var title = ""
    @Published var album = ""
    @Published var artist = ""
    @Published var artwork = ""
    @Published var restDuration = "--:--"
    @Published var duration = "--:--"
    @Published var shuffleMode = RxMusicPlayer.ShuffleMode.off
    @Published var repeatMode = RxMusicPlayer.RepeatMode.none
    @Published var remoteControl = RxMusicPlayer.RemoteControl.moveTrack

    @Published var sliderValue = Double(0)
    @Published var sliderMaximumValue = Double(0)
    @Published var sliderIsUserInteractionEnabled = false
    @Published var sliderPlayableProgress = Double(0)

    private var cancelBag = Set<AnyCancellable>()
    var sliderValueChanged = PassthroughSubject<Double, Never>()

    init() {
        // 1) Create a player
        let items: [RxMusicPlayerItem]  = [
            [
                    "id": "csaEsVWV",
                    "name": "Kun Faaya Kun",
                    "type": "",
                    "album": "Rockstar",
                    "year": "2011",
                    "duration": "473",
                    "label": "",
                    "artists": "A.R. Rahman, Javed Ali, Mohit Chauhan",
                    "artistsId": "456269, 455926, 455124",
                    "featuredArtists": "",
                    "featuredArtistsId": "",
                    "explicitContent": 0,
                    "playCount": "32891706",
                    "language": "hindi",
                    "hasLyrics": "true",
                    "url": "https://www.jiosaavn.com/song/kun-faaya-kun/ExsKdAdmYGU",
                    "copyright": "©  2011 ",
                    "image": "https://c.saavncdn.com/408/Rockstar-Hindi-2011-20221212023139-500x500.jpg",
                    "downloadUrl": "https://aac.saavncdn.com/274/aee250c500588f117ae5343688e12b42_160.mp4"
                  ],
                  [
                    "id": "1beIJP9H",
                    "name": "Kun faya Kun",
                    "type": "",
                    "album": "Kun faya Kun",
                    "year": "2022",
                    "duration": "186",
                    "label": "Prime Digital Arena",
                    "artists": "Ahemad Razvi",
                    "artistsId": "11294502",
                    "featuredArtists": "",
                    "featuredArtistsId": "",
                    "explicitContent": 0,
                    "playCount": "7777",
                    "language": "urdu",
                    "hasLyrics": "false",
                    "url": "https://www.jiosaavn.com/song/kun-faya-kun/QQoOeD5gDns",
                    "copyright": "(P) 2022 Prime Digital Arena",
                    "image": "https://c.saavncdn.com/237/Kun-faya-Kun-Urdu-2022-20230724200550-500x500.jpg",
                    "downloadUrl": "https://aac.saavncdn.com/237/35bc86c94065ebfba7f43dd0f0ed7f6c_160.mp4"
                  ],
                  [
                    "id": "-Rb5lPKJ",
                    "name": "Kun Faya Kun",
                    "type": "",
                    "album": "Kun Faya Kun",
                    "year": "2019",
                    "duration": "284",
                    "label": "PT Artha Musik Produksi",
                    "artists": "7 Bintang",
                    "artistsId": "3084476",
                    "featuredArtists": "",
                    "featuredArtistsId": "",
                    "explicitContent": 0,
                    "playCount": "15803",
                    "language": "indonesian",
                    "hasLyrics": "false",
                    "url": "https://www.jiosaavn.com/song/kun-faya-kun/XToJBBhgfHk",
                    "copyright": "(P) 2019 Artha Music Production",
                    "image": "https://c.saavncdn.com/107/Kun-Faya-Kun-Indonesian-2019-20191214142413-500x500.jpg",
                    "downloadUrl": "https://aac.saavncdn.com/107/6b6a254924bc31176e65ffd0d71a17e5_160.mp4"
                  ],
                  [
                    "id": "brqxXg-c",
                    "name": "Kun Faya Kun",
                    "type": "",
                    "album": "Kun Faya Kun",
                    "year": "2023",
                    "duration": "255",
                    "label": "Prime Digital Arena",
                    "artists": "Amir Hanif",
                    "artistsId": "10209176",
                    "featuredArtists": "",
                    "featuredArtistsId": "",
                    "explicitContent": 0,
                    "playCount": "160",
                    "language": "urdu",
                    "hasLyrics": "false",
                    "url": "https://www.jiosaavn.com/song/kun-faya-kun/EhoaSSxXGlA",
                    "copyright": "(P) 2023 Prime Digital Arena",
                    "image": "https://c.saavncdn.com/259/Kun-Faya-Kun-Urdu-2023-20230805110007-500x500.jpg",
                    "downloadUrl": "https://aac.saavncdn.com/259/e4af4e445d24aa36e1be6b0f7fe28dfc_160.mp4"
                  ],
                  [
                    "id": "l56idbSQ",
                    "name": "Kun Faya Kun",
                    "type": "",
                    "album": "Kun Faya Kun",
                    "year": "2022",
                    "duration": "195",
                    "label": "Hunter Prince Khalid",
                    "artists": "Hunter Prince Khalid",
                    "artistsId": "10808504",
                    "featuredArtists": "",
                    "featuredArtistsId": "",
                    "explicitContent": 0,
                    "playCount": "686",
                    "language": "unknown",
                    "hasLyrics": "false",
                    "url": "https://www.jiosaavn.com/song/kun-faya-kun/HF1dWBBSZGI",
                    "copyright": "℗ 2022 Hunter Prince Khalid",
                    "image": "https://c.saavncdn.com/374/Kun-Faya-Kun-Unknown-2022-20220322144653-500x500.jpg",
                    "downloadUrl": "https://aac.saavncdn.com/374/6ef38cb844872013aecf5049a164a5de_160.mp4"
                  ],
                  [
                    "id": "FJx1Tj5w",
                    "name": "Kun Faya Kun",
                    "type": "",
                    "album": "Kun Faya Kun",
                    "year": "2021",
                    "duration": "94",
                    "label": "Fita Cassete",
                    "artists": "JOELSON O REI DO SOM AUTOMOTIVO",
                    "artistsId": "8699736",
                    "featuredArtists": "",
                    "featuredArtistsId": "",
                    "explicitContent": 0,
                    "playCount": "294",
                    "language": "unknown",
                    "hasLyrics": "false",
                    "url": "https://www.jiosaavn.com/song/kun-faya-kun/NiITACBaAkQ",
                    "copyright": "℗ 2021 Fita Cassete",
                    "image": "https://c.saavncdn.com/046/Kun-Faya-Kun-Unknown-2021-20210810215429-500x500.jpg",
                    "downloadUrl": "https://aac.saavncdn.com/046/258526db3c63551096e773fe54f2acfc_160.mp4"
                  ],
                  [
                    "id": "_Go9q0V3",
                    "name":
                        "Kun fa-ya Kun ( Be and It will Be) [feat. Al Ghazali College Choir]",
                    "type": "",
                    "album": "For the Pleasure of Allah",
                    "year": "2010",
                    "duration": "279",
                    "label": "Green Dome Edu-Tainment",
                    "artists": "Hussein Kalla",
                    "artistsId": "2898666",
                    "featuredArtists": "",
                    "featuredArtistsId": "",
                    "explicitContent": 0,
                    "playCount": "728",
                    "language": "english",
                    "hasLyrics": "false",
                    "url":
                        "https://www.jiosaavn.com/song/kun-fa-ya-kun-be-and-it-will-be-feat.-al-ghazali-college-choir/Ly8ECAUAYQA",
                    "copyright": "© 2010 Hussein Kalla",
                    "image": "https://c.saavncdn.com/491/For-the-Pleasure-of-Allah-English-2010-20180227073427-500x500.jpg",
                    "downloadUrl": "https://aac.saavncdn.com/491/a7cd460a340b5f103b639dd14e628e76_160.mp4"
                  ],
                  [
                    "id": "ALPzy3Lp",
                    "name": "Kun Faya Kun",
                    "type": "",
                    "album": "Kun Faya Kun",
                    "year": "2021",
                    "duration": "293",
                    "label": "Aqsa Abdul Haq",
                    "artists": "Aqsa Abdul Haq",
                    "artistsId": "2020208",
                    "featuredArtists": "",
                    "featuredArtistsId": "",
                    "explicitContent": 0,
                    "playCount": "143",
                    "language": "urdu",
                    "hasLyrics": "false",
                    "url": "https://www.jiosaavn.com/song/kun-faya-kun/MSQ7Sw0De0M",
                    "copyright": "© 2021 Aqsa Abdul Haq",
                    "image": "https://c.saavncdn.com/390/Kun-Faya-Kun-Urdu-2021-20220628163038-500x500.jpg",
                    "downloadUrl": "https://aac.saavncdn.com/390/23a381d63116474175085d9d015c78eb_160.mp4"
                  ],
                  [
                    "id": "vQDUtZvr",
                    "name": "Kun Faya Kun",
                    "type": "",
                    "album": "Mujhe Bheek Mil Rahi Hai",
                    "year": "2021",
                    "duration": "298",
                    "label": "Meem Production",
                    "artists": "Faizan Raza Qadri",
                    "artistsId": "889539",
                    "featuredArtists": "",
                    "featuredArtistsId": "",
                    "explicitContent": 0,
                    "playCount": "132",
                    "language": "urdu",
                    "hasLyrics": "false",
                    "url": "https://www.jiosaavn.com/song/kun-faya-kun/BjkvZABqQUE",
                    "copyright": "(P) 2021 Smart Tech",
                    "image":
                      "https://c.saavncdn.com/096/Mujhe-Bheek-Mil-Rahi-Hai-Urdu-2021-20210625181852-500x500.jpg",
                    "downloadUrl": "https://aac.saavncdn.com/096/cd265aebfe541a3ebe130b6a2b6ffa0a_160.mp4"
                  ],
                  [
                    "id": "9AHD4CaS",
                    "name": "Kun Faya Kun",
                    "type": "",
                    "album": "Kun Faya Kun",
                    "year": "2023",
                    "duration": "210",
                    "label": "Mannan Multimedia",
                    "artists": "Abu Sahid",
                    "artistsId": "4540111",
                    "featuredArtists": "",
                    "featuredArtistsId": "",
                    "explicitContent": 0,
                    "playCount": "22",
                    "language": "bengali",
                    "hasLyrics": "false",
                    "url": "https://www.jiosaavn.com/song/kun-faya-kun/SSkjdUBzVmA",
                    "copyright": "℗ 2023 Mannan Multimedia",
                    "image": "https://c.saavncdn.com/446/Kun-Faya-Kun-Bengali-2023-20230621124938-500x500.jpg",
                    "downloadUrl": "https://aac.saavncdn.com/446/cff6a721f2dd9651f8054d46b4d0a50e_160.mp4"
                  ]
           
        ]
        .map({ val in
            
            let sObj = val as? NSDictionary ?? [:]
            
            let meta = RxMusicPlayerItem.Meta(lyrics: sObj.value(forKey: "image") as? String, title: sObj.value(forKey: "name") as? String, album: sObj.value(forKey: "image") as? String, artist: sObj.value(forKey: "artists") as? String  )
            
           return RxMusicPlayerItem(url: URL(string: sObj.value(forKey: "downloadUrl") as? String ?? "")!, meta: meta )
            
            
        })
        
        
        player = RxMusicPlayer(items: items)!

        // 2) Control views
        player.rx.canSendCommand(cmd: .play)
            .do(onNext: { [weak self] canPlay in
                self?.canPlay = canPlay
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.canSendCommand(cmd: .next)
            .do(onNext: { [weak self] canPlayNext in
                self?.canPlayNext = canPlayNext
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.canSendCommand(cmd: .previous)
            .do(onNext: { [weak self] canPlayPrevious in
                self?.canPlayPrevious = canPlayPrevious
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.canSendCommand(cmd: .seek(seconds: 0, shouldPlay: false))
            .do(onNext: { [weak self] canSeek in
                self?.sliderIsUserInteractionEnabled = canSeek
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.canSendCommand(cmd: .skip(seconds: 15))
            .do(onNext: { [weak self] canSkip in
                self?.canSkipForward = canSkip
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.canSendCommand(cmd: .skip(seconds: -15))
            .do(onNext: { [weak self] canSkip in
                self?.canSkipBackward = canSkip
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.currentItemDuration()
            .do(onNext: { [weak self] in
                self?.sliderMaximumValue = Double($0?.seconds ?? 0)
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.currentItemTime()
            .do(onNext: { [weak self] time in
                self?.sliderValue = Double(time?.seconds ?? 0)
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.currentItemLoadedProgressRate()
            .do(onNext: { [weak self] rate in
                self?.sliderPlayableProgress =  Double(rate ?? 0)
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.currentItemTitle()
            .do(onNext: { [weak self] title in
                self?.title = title ?? ""
            })
            .drive()
            .disposed(by: disposeBag)
                
        player.rx.currentItemAlbum()
            .do(onNext: { [weak self] album in
                self?.artwork = album ?? ""
                self?.album =  ""
            })
            .drive()
            .disposed(by: disposeBag)
                
        player.rx.currentItemArtist()
            .do(onNext: { [weak self] artist in
                self?.artist = artist ?? ""
            })
            .drive()
            .disposed(by: disposeBag)
                        
                        

//        player.rx.currentItemLyrics()
//            .do(onNext: { [weak self] artwork in
//                self?.artwork = artwork ?? ""
//            })
//            .drive()
//            .disposed(by: disposeBag)

        player.rx.currentItemRestDurationDisplay()
            .do(onNext: { [weak self] duration in
                self?.restDuration = duration ?? "--:--"
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.currentItemTimeDisplay()
            .do(onNext: { [weak self] duration in
                if duration == "00:00" {
                    self?.duration = "0:00"
                    return
                }
                self?.duration = duration ?? "--:--"
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.shuffleMode()
            .do(onNext: { [weak self] mode in
                self?.shuffleMode = mode
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.repeatMode()
            .do(onNext: { [weak self] mode in
                self?.repeatMode = mode
            })
            .drive()
            .disposed(by: disposeBag)

        player.rx.remoteControl()
            .do(onNext: { [weak self] control in
                self?.remoteControl = control
            })
            .drive()
            .disposed(by: disposeBag)

        // 3) Process the user's input
        player.run(cmd: commandRelay.asDriver(onErrorDriveWith: .empty()))
            .flatMap { status -> Driver<()> in
                switch status {
                case let RxMusicPlayer.Status.failed(err: err):
                    print(err)
                case let RxMusicPlayer.Status.critical(err: err):
                    print(err)
                default:
                    print(status)
                }
                return .just(())
            }
            .drive()
            .disposed(by: disposeBag)

        commandRelay.accept(.prefetch)

        sliderValueChanged
            .removeDuplicates()
            .sink { [weak self] value in
                self?.seek(value: value)
            }
            .store(in: &cancelBag)
    }

    func seek(value: Double?) {
        commandRelay.accept(.seek(seconds: Int(value ?? 0), shouldPlay: false))
    }

    func skip(second: Int) {
        commandRelay.accept(.skip(seconds: second))
    }

    func shuffle() {
        switch player.shuffleMode {
        case .off: player.shuffleMode = .songs
        case .songs: player.shuffleMode = .off
        }
    }

    func play() {
        commandRelay.accept(.play)
    }

    func pause() {
        commandRelay.accept(.pause)
    }

    func playNext() {
        commandRelay.accept(.next)
    }

    func playPrevious() {
        commandRelay.accept(.previous)
    }

    func doRepeat() {
        switch player.repeatMode {
        case .none: player.repeatMode = .one
        case .one: player.repeatMode = .all
        case .all: player.repeatMode = .none
        }
    }

    func toggleRemoteControl() {
        switch remoteControl {
        case .moveTrack:
            player.remoteControl = .skip(second: 15)
        case .skip:
            player.remoteControl = .moveTrack
        }
    }
}


