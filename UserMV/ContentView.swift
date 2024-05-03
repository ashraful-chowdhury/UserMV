//
//  ContentView.swift
//  UserMV
//
//  Created by Mohammad Ashraful Haque Chowdhury on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = Store()
    
    var body: some View {
        NavigationView {
            List(store.posts) { post in
                Text(post.title)
            }
            .task {
                await store.onAppear()
            }
            .navigationTitle("User's Posts")
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
