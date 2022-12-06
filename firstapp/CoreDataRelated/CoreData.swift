//
//  CoreData.swift
//  FirstApp
//
//  Created by José Guerra on 05-12-22.
//

import SwiftUI
import CoreData

class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core data \(error)")
            } else {
                print("Wena si funciono")
            }
        }
        context = container.viewContext
        
    }

    
    
    func save() {
        do {
            try context.save()
            print("Se guardo, wenisisiisma")
        } catch let error {
            print("Error saving Core data. \(error.localizedDescription)")
        }
    }
    
    
    
    
    
    func deleteAllEntities() {
        let entities = container.managedObjectModel.entities
        for entity in entities {
            delete(entityName: entity.name!)
        }
    }
    
    func delete(entityName: String) {
            
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try container.viewContext.execute(deleteRequest)
        } catch let error as NSError {
            debugPrint(error)
        }
        
    }
    
    

    
    
    
    
}

class CoreDataViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var asignaturas: [Asignaturas] = []
    @Published var notas: [Notas] = []
    @Published var porcentajes: [Porcentajes] = []
    
    init() {
        getMaterias()
    }
    
    
    // Obtener Data
    func getMaterias() {
        let request = NSFetchRequest<Asignaturas>(entityName: "Asignaturas")
        
        do {
          asignaturas = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getNotas() {
        let request = NSFetchRequest<Notas>(entityName: "Notas")
        
        do {
          notas = try manager.context.fetch(request)
            print(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }

    func getPorcentajes() {
        
        let request = NSFetchRequest<Porcentajes>(entityName: "Porcentajes")
        
        do {
          porcentajes = try manager.context.fetch(request)
            print(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    
    
    
    // Aṉadir data
    func addMaterias(materia: String) {
        
        let newMateria = Asignaturas(context: manager.context)
        newMateria.name = materia
        newMateria.materiaColor = "blackBackground"
        save()
    }

    func addNotas(notas: Float)  {
        
        let newNota = Notas(context: manager.context)
        newNota.data = notas
        newNota.asignaturas = asignaturas.last
        save()
    }
    
    func addPorcentajes(porcentaje: Int) {
        
        let newPorcentaje = Porcentajes(context: manager.context)
        newPorcentaje.porcentaje = Int16(porcentaje)
        newPorcentaje.asignaturas = asignaturas.last
        save()
    }
    
    // Prueba a editar
    func modifyNotas(nota: Float) {
        
        let editNota = Notas(context: manager.context)
        editNota.data = nota
        editNota.asignaturas = asignaturas[0]
        save()
    }
    
    func modifyPorcentaes(porcentaje: Int) {
        
        let editPorcentaje = Porcentajes(context: manager.context)
        editPorcentaje.porcentaje = Int16(porcentaje)
        editPorcentaje.asignaturas = asignaturas[0]
        save()
    }
    
    
    
    func deleteAll() {
        
        manager.deleteAllEntities()
        asignaturas.removeAll()
        notas.removeAll()
    }
    
    
    func save() {
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            self.manager.save()
            self.getMaterias()
            self.getNotas()
        }
    }
}



struct CoreData: View {
    
    @StateObject var vm = CoreDataViewModel()
    
    @State var newAsignatura: String = ""
    @State var nota1: String = ""// [Float]
    @State var porcentaje1: String = ""

    
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack {
                            ForEach(vm.asignaturas) { asignaturas in
                                
                                MateriasView(entity: asignaturas)
                            }
                        }
                    }
                    
                    Button {
                        vm.deleteAll()
                    } label: {
                        Text("Delete all")
                    }

                    
                    // Nuevo
                    Button {
                        
                        vm.addMaterias(materia: newAsignatura)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            vm.addNotas(notas: Float(nota1)! )
                            vm.addPorcentajes(porcentaje: Int(porcentaje1)! )
                        }
                        
                        newAsignatura = ""
                        
                        
                    } label: {
                        Text("Add")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    }
                     
                    // Editar
                    Button {
                        
                        vm.modifyNotas(nota: Float(nota1)!)
                        vm.modifyPorcentaes(porcentaje: Int(porcentaje1)!)
                        
                    } label: {
                        Text("Agregar al array")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    }
                    
                    
                    TextField("Materia", text: $newAsignatura)
                        .frame(maxWidth: 300, minHeight: 60)
                        .background(.quaternary)
                        .multilineTextAlignment(.center)
                        .cornerRadius(15)
                    
                    
                    VStack {
                        HStack {
                            TextField("nota", text: $nota1)
                            TextField("porcentaje", text: $porcentaje1)
                        }
                        .frame(maxWidth: 300, minHeight: 60)
                        .background(.quaternary)
                        .cornerRadius(15)
                        .multilineTextAlignment(.center)
                       
                        
                        
                    }
                    
                                        
                    

                }
            }
            .padding()
        }
        .navigationTitle("Relations")
    }
    
    
}

struct CoreData_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CoreData()
        }
        
    }
}


struct MateriasView: View {
    
    let entity: Asignaturas
    
    
    var body: some View {
        VStack {
            Text("Name: \(entity.name ?? "Error")")
                .bold()
            
            if let notas = entity.notas?.allObjects as? [Notas] {
                Text("Notas: ")
                    .bold()
                ForEach(notas) { nota in
                    HStack {
                        Text(String(format: "%.1f", nota.data))
                    }
                }
            }
            
            
            if let porcentajes = entity.porcentajes?.allObjects as? [Porcentajes] {
                Text("Porcenajtes")
                    .bold()
                ForEach(porcentajes) { porcentaje in
                    HStack {
                        Text("\(porcentaje.porcentaje)")
                    }
                }
            }
            
            
        }//
        .frame(width: 200, height: 300)
        .foregroundColor(.white)
        .cornerRadius(15)
        .background(.gray)
        
        
    }
    
}


