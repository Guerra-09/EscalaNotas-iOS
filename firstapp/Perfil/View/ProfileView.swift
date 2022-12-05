//
//  ProfileView.swift
//  FirstApp
//
//  Created by José Guerra on 21-10-22.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var vm: ProfileViewModel = ProfileViewModel()
    
    @State var name: String = "Guerra"
    
    
    @State var log: String = "hola"
    
    @State var reduced: String = ""
    
    var body: some View {
        
        
        ScrollView {
            
            
            Text(name)
                .font(.title)
                .padding(30)
            
            Divider()
                .background(.gray)
            
            
            VStack {
                HStack() {
                    
                    
                    NavigationLink(destination: Text("Ajustes"), label: {
                        
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 25, height: 25)
                            
                    })
                    
                    Text("Materias")
                        .font(.title)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 80)
                    
                    
                
                    
                    NavigationLink(destination: SaveNotas(viewModel: vm), label: {
                        
                        Image(systemName: "plus.square")
                            .resizable()
                            .frame(width: 25, height: 25)
                            
                            
                    })
                    
                    
                }
                
                
                VStack {
                    ForEach(vm.materias) { materia in
                        
                        MateriaComponent(materiaName: materia.name , textColor: vm.notasColor(color: "\(materia.materiaColor)") , materiaNotas: materia.notas, materiaPorcentajes: materia.porcentajes, materiaColor: materia.materiaColor, promedio: "\(vm.promedio(notas: materia.notas, porcentajes: materia.porcentajes))" , reducedSize: false)
                        
                    }
                }
                

                
                
            }
            
            
        
            
            // Mas cosas....
            
        }
        .environmentObject(vm)
    }
    
    func notasColor(color: String) -> Color {
        
        switch color {
        case "blackBackground":
            return .white
            
        case "pinkBackground":
            return .white
            
        default:
            return .black
        }
        
        
    }
    

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
        
    }
}
