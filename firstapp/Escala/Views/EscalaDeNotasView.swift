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
    @State var info: Bool = false
    @State var escalaSheet: Bool = false
    
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 5) {
                Text("Generador de escala")
                    .font(.system(size: 35))
                    .padding(.top, 80)
                
                Button {
                    
                    info.toggle()
                    
                } label: {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)
                }
                

                
            }
            
                
                VStack{
                    
                    HStack {
                        
                        VStack(spacing: 1) {
                            
                            Text("Nota Minima")
                                .font(.caption)
                            
                            TextField("0", text: $nMinima)
                                .modifier(TextFieldViewModifier())
                                .focused($isFocused)
                                
                        }
                        
                        VStack(spacing: 1) {
                            Text("Nota Maxima")
                                .font(.caption)
                            
                            TextField("0", text: $nMaxima)
                                .modifier(TextFieldViewModifier())
                                .focused($isFocused)
                                
                        }
                    }
                    
                    
                    HStack {
                        
                        VStack(spacing: 1) {
                            
                            Text("Nota Aprobacion")
                                .font(.caption)
                            
                            TextField("0", text: $nAprobacion)
                                .modifier(TextFieldViewModifier())
                                .focused($isFocused)
                        }
                        
                        
                        VStack(spacing: 1) {
                            Text("Exigencia")
                                .font(.caption)
                            
                            TextField("0", text: $nExigencia)
                                .modifier(TextFieldViewModifier())
                                .focused($isFocused)
                        }
                        
                    }
                    
                    HStack {
                        
                        VStack(spacing: 1) {
                            Text("Puntaje Maximo")
                                .font(.caption)
                            
                            TextField("0", text: $pMaximo)
                                .font(.system(size: 45))
                                .modifier(TextFieldViewModifier(maxWidthSize: 200))
                                .focused($isFocused)
                        }
                        
                        
                            
                    }
                    
                    Button {
                        
                        escalaSheet.toggle()
                        
                    } label: {
                        Text("Calcular \(Image(systemName: "paperplane"))")
                            .font(.title)
                            .frame(height: 70)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)

                    }
                    .padding(.init(top: 20, leading: 80, bottom:80, trailing: 80))

                    
        
                }
                .padding(.top, 40)
            }
        .scrollIndicators(.hidden)
        
        .sheet(isPresented: $info) {
            
            InfoSheet()
            
        }
        
        .sheet(isPresented: $escalaSheet) {
            NotasView(puntajeMaximo: pMaximo, notaMaxima: nMaxima, notaMinima: nMinima, notaAprobacion: nAprobacion, notaExigencia: nExigencia)
        }
        
       
        
    }
    
}

struct EscalaDeNotasView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EscalaDeNotasView()
        }
        
    }
}

