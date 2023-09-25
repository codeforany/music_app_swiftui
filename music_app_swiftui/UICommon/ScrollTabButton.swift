//
//  ScrollTabButton.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 24/08/23.
//

import SwiftUI

struct ScrollTabButton: View {
    
    var title: String = "Title"
    var width: Double = 70
    var isSelect: Bool = true
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.medium, fontSize: 15))
                .foregroundColor(isSelect ? .focus : .primaryText28 )
            
        }
        .frame(width: width)

    }
}

struct ScrollTabButton_Previews: PreviewProvider {
    static var previews: some View {
        ScrollTabButton()
    }
}
