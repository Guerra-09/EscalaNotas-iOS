//
//  EscalaComponents.swift
//  FirstApp
//
//  Created by José Guerra on 16-11-22.
//

import SwiftUI

struct FieldComponent: View {
    
    @State var state: String
    @State var placeholder: String
    
    var body: some View {
        
        
        VStack {
            
            Text(state)
                .font(.caption)
            
            TextField("0", text: $placeholder)
                .frame(height: 100)
                .frame(maxWidth: 180)
                .background(Color("textFieldBackground"))
                .cornerRadius(15)
                .multilineTextAlignment(.center)
                .font(.system(size: 30))
                .padding(18)
        }
        
       
        
        
    }
}


struct TextFieldViewModifier: ViewModifier {
    
    var maxWidthSize: CGFloat = 150
    var customPadding: CGFloat = 10
    
    func body(content: Content) -> some View {
        content
            .frame(height: 100)
            .frame(maxWidth: maxWidthSize)
            .background(Color("textFieldBackground"))
            .cornerRadius(15)
            .multilineTextAlignment(.center)
            .font(.system(size: 30))
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
    }
    
}


struct InfoSheet: View {
    
    @State var title: String = "Informacion adicional"
    
    @State var info1: String = "Para la facilidad del lector y el programador detras, se representaran los datos con enteros pero luego en la practica se dividen por 10 (A excepcion de la exigencia) de manera tal que la nota maxima (en Chile) es 7.0 y para fines practicos de conversion se expresa como 70."
    
    @State var exigenciaText: String = "Que es la exigencia?\nLa exigencia es la fracción del puntaje total que el evaluador determina como necesaria para considerar la evaluación como aprobada"
    
    @State var soon: String = "Se agregará más informacion al finalizar la app"
    
    
    var body: some View {
        
        VStack {
        
            Text(title)
                .font(.title)
            
            Text(info1)
                .font(.body)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 370, maxHeight: 150)
            
            Text(soon)
                .foregroundColor(.red)
                .padding(.vertical, 50)
        
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("textFieldBackground"))
        
        
        
        
    }
}



struct EscalaComponents_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InfoSheet()
        }
        
    }
}
