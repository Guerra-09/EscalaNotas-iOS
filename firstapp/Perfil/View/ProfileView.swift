//
//  ProfileView.swift
//  FirstApp
//
//  Created by José Guerra on 21-10-22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var name: String = "Guerra"
    
    var body: some View {
        
        
        
        ScrollView {
            
            
            Text(name)
                .font(.title)
                .padding(30)
            
            Divider()
                .background(.gray)
            
            VStack {
                
            }
            
        
            
            // Mas cosas....
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
