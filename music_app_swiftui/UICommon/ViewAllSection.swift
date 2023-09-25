//
//  ViewAllSection.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 22/08/23.
//

import SwiftUI

struct ViewAllSection: View {
    
    @State var title: String =  "Title"
    @State var button: String = "View All"
    var didTap: (()->())?
    
    var body: some View {
        HStack{
            Text(title)
                .font(.customfont(.medium, fontSize: 15))
                .foregroundColor(.primaryText80)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            
            Button {
                didTap?()
            } label: {
                Text(button)
                    .font(.customfont(.regular, fontSize: 11))
                    .foregroundColor(Color.org)
            }

           
                
        }
    }
}

struct ViewAllSection_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllSection()
    }
}
