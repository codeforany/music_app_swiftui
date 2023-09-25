//
//  MainViewModel.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 22/08/23.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var share : MainViewModel = MainViewModel()
    
    @Published var selectTab: Int = 0
    @Published var isShowMenu: Bool = false
}
