//
//  ContentView.swift
//  APNGViewDemo
//
//  Created by devonly on 2021/05/23.
//

import SwiftUI
import SwiftyAPNGKit

struct ContentView: View {
    var body: some View {
        APNGView(named: "Loading")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
