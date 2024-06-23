//
//  HomeView.swift
//  Notes
//
//  Created by Amine Hajri on 23.06.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationSplitView {
            SideMenu()
        } detail: {
            Text("content")
        }
    }
}

#Preview {
    HomeView()
}
