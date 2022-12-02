//
//  PromedioComponents.swift
//  FirstApp
//
//  Created by José Guerra on 30-11-22.
//

import Foundation

import SwiftUI

struct PromedioInput : ViewModifier {
    
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .frame(width: 150, height: 80)
            .background(Color("textFieldBackground"))
            .cornerRadius(15)
            .multilineTextAlignment(.center)
            //.keyboardType(.numberPad)
            .submitLabel(.return)
            
            
    }
    
}
