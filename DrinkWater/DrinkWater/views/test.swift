//
//  test.swift
//  DrinkWater
//
//  Created by aslan on 29.05.2022.
//

import SwiftUI

struct test: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        //test()
        //DiamondBackground()
        Frontmost()
    }
}

struct DiamondBackground: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 250, height: 250, alignment: .center)
                .rotationEffect(.degrees(45.0))
        }
    }
}

struct Frontmost: View {
    var body: some View {
        VStack {
            Image(systemName: "folder")
                .font(.system(size: 128, weight: .ultraLight))
                .background(DiamondBackground())
        }
    }
}
