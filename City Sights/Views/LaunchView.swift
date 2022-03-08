//
//  ContentView.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/8/22.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(ContentModel())
    }
}
