//
//  PerfilView.swift
//  FirstApp
//
//  Created by José Guerra on 30-11-22.
//

import SwiftUI

struct PerfilPhoto: View {
    var body: some View {
        
        ZStack {
            
            Circle()
                .foregroundColor(.blue)
            
            Image(systemName: "person")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.white)
            
        }
        .frame(width: 300, height: 300)
        
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilPhoto()
    }
}
