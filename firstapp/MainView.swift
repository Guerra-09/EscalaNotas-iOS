//
//  MainView.swift
//  FirstApp
//
//  Created by José Guerra on 21-10-22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            EscalaDeNotasView()
                .tabItem {
                    Label("Escala de notas", systemImage: "doc.text.fill")
                }
            
            PromedioNotas()
                .tabItem {
                    Label("Promedio", systemImage: "sum")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
    }
}
