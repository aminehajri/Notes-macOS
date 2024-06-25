//
//  ColorListView.swift
//  Notes
//
//  Created by Amine Hajri on 25.06.24.
//

import SwiftUI

struct ColorListView: View {
    
    private let colors: [Color] = [.red, .orange, .cyan, .purple, .mint]
    @Binding var selectedColor: Color
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                
                Image(systemName: selectedColor == color ?
                      IconUtils.recordCircleFill : IconUtils.circleFill)
                .foregroundStyle(color)
                .font(.system(size: 16))
                .clipShape(Circle())
                .onTapGesture {
                    selectedColor = color
                }
            }
        }
    }
}

#Preview {
    ColorListView(selectedColor: .constant(.cyan))
}
