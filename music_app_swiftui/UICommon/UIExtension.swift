//
//  UIExtension.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 21/08/23.
//

import SwiftUI

enum CircularStd: String {
    case regular = "CircularStd-Book"
    case medium = "CircularStd-Medium"
    case bold = "CircularStd-Bold"
    case black = "CircularStd-Black"
}

extension Font {
    static func customfont(_ font: CircularStd, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension CGFloat {
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per;
        //375 * 0.5
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per;
        //375 * 0.5
    }
    
    static var topInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top
        }
        return 0.0
    }
    
    static var bottomInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
    
    static var horizontalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.left + keyWindow.safeAreaInsets.right
        }
        return 0.0
    }
    
    static var verticalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top + keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
}


extension Color {
    
    static var primaryApp: Color {
        return Color(hex: "C35BD1")
    }
    
    static var focus: Color {
        return Color(hex: "D9519D")
    }
    
    static var unfocused: Color {
        return Color(hex: "63666E")
    }
    
    static var focusStart: Color {
        return Color(hex: "ED8770")
    }
    static var secondaryStart: Color {
        return primaryApp
    }
    static var secondaryEnd: Color {
        return Color(hex: "657DDF")
    }
    static var org: Color {
        return Color(hex: "E1914B")
    }
    
    static var primaryText: Color {
        return Color.white
    }
    
    static var primaryText80: Color {
        return Color.white.opacity(0.8)
    }
    static var primaryText60: Color {
        return Color.white.opacity(0.6)
    }
    static var primaryText35: Color {
        return Color.white.opacity(0.35)
    }
    static var primaryText28: Color {
        return Color.white.opacity(0.28)
    }
    
    static var primaryText10: Color {
        return Color.white.opacity(0.1)
    }
    
    static var secondaryText: Color {
        return Color(hex: "585A66")
    }
    
    static var primaryG: [Color] {
        return [focusStart, focus]
    }
    
    static var secondaryG: [Color] {
        return [secondaryStart, secondaryEnd]
    }
    static var bg: Color {
        return Color(hex: "181B2C")
    }
    
    static var darkGray: Color {
        return Color(hex: "383B49")
    }
    static var lightGray: Color {
        return Color(hex: "D0D1D4")
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB(12 -bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corner: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corner: corner))
    }
    
}

extension Color {
 
    func uiColor() -> UIColor {

        if #available(iOS 14.0, *) {
            return UIColor(self)
        }

        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corner: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
