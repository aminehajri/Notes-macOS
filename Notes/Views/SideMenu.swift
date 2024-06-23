//
//  SideMenu.swift
//  Notes
//
//  Created by Amine Hajri on 23.06.24.
//

import SwiftUI

struct SideMenu: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            List(1...5, id: \.self) { index in
                Text("List \(index)")
            }
            Spacer()
            Button("Add list", action: {
                
            })
        }
        
    }
}

#Preview {
    SideMenu()
}
