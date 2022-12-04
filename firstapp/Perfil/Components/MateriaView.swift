//
//  MateriaView.swift
//  FirstApp
//
//  Created by José Guerra on 04-12-22.
//

import SwiftUI

struct MateriaView: View {
    
    @ObservedObject var vm: ProfileViewModel 
    
    
    
    var body: some View {
        VStack {
            
          

            
            if vm.reducedSize {
                
                VStack {
                    ForEach(vm.materias) { materia in
                        VStack(spacing: 20) {
                            Text("\(materia.name)")
                                .foregroundColor(vm.notasColor(color: materia.materiaColor))
                                
                            Grid {
                
                                GridRow() {

                                    ForEach(materia.notas, id: \.self) { notita in
                                        Text("\(notita.description)")
                                            
                                        
                                    }
                                }
                            }
                            .foregroundColor(vm.notasColor(color: materia.materiaColor))
                                
                            
                        }
                        .frame(maxWidth: 300, minHeight: 80)
                        .background(Color(materia.materiaColor))
                        .cornerRadius(10)
                            
                        
                    }
                }
                
                
            } else {
                VStack {
                    ForEach(vm.materias) { materia in
                        VStack(spacing: 40) {
                            Text("\(materia.name)")
                                .foregroundColor(vm.notasColor(color: materia.materiaColor))
                                
                        
                            
                            Grid(verticalSpacing: -7) {
                
                                GridRow() {

                                    ForEach(materia.notas, id: \.self) { notita in
                                        Text("\(notita.description)")
                                            .frame(width: 60, height: 50)
            
                                    }
                                    
                                    
                                }
                                .background(.gray)
                                .cornerRadius(10)
                                
                                GridRow() {
                                    ForEach(materia.porcentajes, id: \.self) { notita in
                                        Text("\(notita.description)%")
                                            .font(.subheadline)
                                            .frame(width: 60, height: 40)
                                        

                                            
                                            
                                    }
                                }
                            }
                            .foregroundColor(vm.notasColor(color: materia.materiaColor))
                            
                                
                            
                        }
                        .frame(maxWidth: 300, minHeight: 200)
                        .background(Color(materia.materiaColor))
                        .cornerRadius(10)
                        
                        HStack {
                            Text("Promedio Final: \(vm.promedio(notas: materia.notas, porcentajes: materia.porcentajes))")
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 80)
                            
                        
                    }
                    
                    
                }
                
                
                
                    
            }// Else finish
            
        }
        
        
        
    }
    
    
}

struct MateriaView_Previews: PreviewProvider {
    static var previews: some View {
        MateriaView(vm: ProfileViewModel())
    }
}
