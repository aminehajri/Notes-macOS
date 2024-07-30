//
//  AllNotesCountView.swift
//  Notes
//
//  Created by Amine Hajri on 30.07.24.
//

import SwiftUI

struct AllNotesCountView: View {
    
    let count: Int
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: IconUtils.trayCircleFill)
                    .font(.largeTitle)
                Text("All")
            }
            Spacer()
            VStack {
                Text("\(count)")
                    .font(.title)
                EmptyView()
            }
        }
        .padding()
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
    }
}

#Preview {
    AllNotesCountView(count: 0)
}
