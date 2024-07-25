//
//  CategoryHeaderView.swift
//  Notes
//
//  Created by Amine Hajri on 27.06.24.
//

import SwiftUI

struct CategoryHeaderView: View {
    
    let name: String
    let count: Int
    let color: Color
    
    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 28))
                .fontWeight(.bold)
                .foregroundStyle(color)
                .padding()
            
            Spacer()
            Text(String(count))
                .font(.system(size: 28))
                .foregroundStyle(color)
                .padding()
            
        }
    }
}

#Preview {
    CategoryHeaderView(name: "Home", count: 3, color: .teal)
}
