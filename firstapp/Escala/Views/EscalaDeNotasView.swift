//
//  EscalaDeNotasView.swift
//  FirstApp
//
//  Created by José Guerra on 21-10-22.
//


import SwiftUI

struct EscalaDeNotasView: View {
    
    @ObservedObject var vm = notaViewModel()
    
    @State var pMaximo: String = "30"
    @State var nMaxima: String = "70"
    @State var nMinima: String = "10"
    @State var nAprobacion: String = "40"
    @State var nExigencia: String = "60"
    
    
    @FocusState var isFocused: Bool
    
    
    
    var body: some View {
        
        
       
            ScrollView {
                    
                Text("Escalas")
                    .font(.title)
                    .padding()
        
                
                VStack {
                    
                    HStack {
                        
                        VStack {
                            Text("Exigencia")
                                .font(.caption)
                            
                            TextField("0", text: $nExigencia)
                                .modifier(TextFieldViewModifier())
                                .focused($isFocused)
                        }
                        
                        VStack {
                            Text("Nota Maxima")
                                .font(.caption)
                            
                            TextField("0", text: $nMaxima)
                                .modifier(TextFieldViewModifier())
                                .focused($isFocused)
                        }
                    }
                    
                    
                    HStack {
                        
                        VStack {
                            Text("Nota Minima")
                                .font(.caption)
                            
                            TextField("0", text: $nMinima)
                                .modifier(TextFieldViewModifier())
                                .focused($isFocused)
                        }
                        
                        
                        VStack {
                            Text("Nota Aprobacion")
                                .font(.caption)
                            
                            TextField("0", text: $nAprobacion)
                                .modifier(TextFieldViewModifier())
                                .focused($isFocused)
                        }
                        
                    }
                    
                    HStack {
                        
                        VStack {
                            Text("Puntaje Maximo")
                                .font(.caption)
                            
                            TextField("0", text: $pMaximo)
                                .modifier(TextFieldViewModifier())
                                .focused($isFocused)
                        }
                        
                        
                            
                    }
                    
           
                    NavigationLink {

                        NotasView(puntajeMaximo: pMaximo, notaMaxima: nMaxima, notaMinima: nMinima, notaAprobacion: nAprobacion, notaExigencia: nExigencia)

                    } label: {

                        Text("Calcular \(Image(systemName: "paperplane"))")
                            .font(.title)
                            .frame(height: 70)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding(.init(top: 65, leading: 80, bottom:80, trailing: 80))
                    }
                    
                    
                    
                    
                }
                .padding(.top, 40)
            } // ScrollView End
            .onAppear()
        
       
        
    }
    
    
    
    func getNota() -> Float {
            
        return 0.0
        
    }
}

struct EscalaDeNotasView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EscalaDeNotasView()
        }
        
    }
}

