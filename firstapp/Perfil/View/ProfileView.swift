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
    
    
    
    var body: some View {
        
        
        ScrollView {
            
            
            Text(name)
                .font(.title)
                .padding(30)
            
            Divider()
                .background(.gray)
            
            
            VStack {
                HStack {
                    
                    Button {
                        vm.addMateria(materiaName: "Innovacion", materiaColor: "red")
                    } label: {
                        Image(systemName: "minus.circle")
                    }

                    
                    Text("Materias")
                        .font(.title)
                        .padding(.vertical, 20)
                    
                    NavigationLink(destination: SaveNotas(viewModel: vm), label: {
                        
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                    })
                }
                
                
                ForEach(vm.materias) { materia in
                    VStack(spacing: 40) {
                        Text("\(materia.name)")
                        
                        Grid(verticalSpacing: 1) {
            
                            GridRow() {
                                
                                ForEach(materia.notas, id: \.self) { notita in
                                    
                                    Text("\(notita.description)")
                                        .frame(width: 60, height: 50)
                                        //.background(Color(notita.materiaColor))
                                        .cornerRadius(10)

                                    
                                    
                                }
                                
                                
                            }
                            GridRow() {
                                ForEach(materia.porcentajes, id: \.self) { notita in
                                    Text("\(notita.description)%")
                                        .frame(width: 60, height: 40)
                                        .foregroundColor(.gray)
                                        
                                        
                                }
                            }
                        }
                            
                        
                    }
                    .frame(maxWidth: 300, minHeight: 200)
                    .background(Color(materia.materiaColor))
                    .cornerRadius(10)
                    
                }
                
                
            }
            
            
        
            
            // Mas cosas....
            
        }
        .environmentObject(vm)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
        
    }
}
