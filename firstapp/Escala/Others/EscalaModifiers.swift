//
//  EscalaModifiers.swift
//  FirstApp
//
//  Created by José Guerra on 02-12-22.
//

import SwiftUI

struct ViewTest: View {
    
    @State var buenaNota: Bool
    
    var body: some View {
        
        
        HStack {
            VStack {
                ForEach(0..<10, id: \.self) { index in
                    
                    Text("\(index) -> 3.5")
                        .modifier(NotaModifier(isRed: buenaNota))
                }
            }
            
            VStack {
                ForEach(0..<10, id: \.self) { index in
                    
                    Text("\(index) -> 3.5")
                        .modifier(NotaModifier(isRed: buenaNota))
                    
                }
            }
        }
    
        
            
            
        
        
        
    }
}


struct NotaModifier: ViewModifier {
    
    var isRed: Bool = false
    
    func body(content: Content) -> some View {
        content
            .frame(width: 120, height: 60)
            //.background(Color(isRed ? "malaNota" : "buenaNota"))
            .background(Color("textFieldBackground"))
            .cornerRadius(5)
            .foregroundColor(isRed ? .red : .black)
            .padding(.horizontal)
            .padding(.vertical, 2)
            
            
    }
    
}


struct EscalaModifiers_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewTest(buenaNota: true)
                
            //ViewTest(buenaNota: false)
        }
        .previewLayout(.sizeThatFits)
        
        
        
    }
}
