//
//  Settings.swift
//  DrinkWater
//
//  Created by aslan on 6.03.2022.
//

import SwiftUI

// Settings sub views
struct privacyView: View {
    var body: some View{
        Text("privacyView")
    }
}

struct targetView: View {
    var body: some View{
        Text("targetView")
    }
}

struct drinkView: View {
    var body: some View{
        Text("drinkView")
    }
}

struct aquariumView: View {
    var body: some View{
        Text("aquariumView")
    }
}

struct remindersView: View {
    var body: some View{
        Text("remindersView")
    }
}

struct soundsView: View {
    var body: some View{
        Text("soundsView")
    }
}

struct trophiesView: View {
    var body: some View{
        Text("trophiesView")
    }
}

struct synchView: View {
    var body: some View{
        Text("synchView")
    }
}

struct iWatchView: View {
    var body: some View{
        Text("iWatchView")
    }
}

struct proVerView: View {
    var body: some View{
        Text("proVerView")
    }
}

struct restoreProView: View {
    var body: some View{
        Text("restorePro")
    }
}

struct helpView: View {
    var body: some View{
        Text("help")
    }
}

struct supportView: View {
    var body: some View{
        Text("support")
    }
}

struct settingsLink : Identifiable{
    let name: String
    let destination: AnyView
    let id = UUID()
}

// Settings main view
struct Settings: View {
    private var settingsCont = [
        settingsLink(name: "Legal notice & Data privacy", destination: AnyView(privacyView())),
        settingsLink(name: "Target and Weight", destination: AnyView(targetView())),
        settingsLink(name: "Drink", destination: AnyView(drinkView())),
        settingsLink(name: "Aquarium", destination: AnyView(aquariumView())),
        settingsLink(name: "Reminders", destination: AnyView(remindersView())),
        settingsLink(name: "Sounds", destination: AnyView(soundsView())),
        settingsLink(name: "Trophies", destination: AnyView(trophiesView())),
        settingsLink(name: "Synchronise between multiple devices & iCloud backup", destination: AnyView(synchView())),
        settingsLink(name: "Apple Watch integration", destination: AnyView(iWatchView())),
        settingsLink(name: "Upgrade to the Pro Version", destination: AnyView(proVerView())),
        settingsLink(name: "Restore purchases", destination: AnyView(restoreProView())),
        settingsLink(name: "Help", destination: AnyView(helpView())),
        settingsLink(name: "Support us", destination: AnyView(supportView()))
    ]

    var body: some View {
        List(settingsCont) {cont in
            NavigationLink(destination: cont.destination) {
                Text(cont.name)
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .previewInterfaceOrientation(.portrait)
    }
}
