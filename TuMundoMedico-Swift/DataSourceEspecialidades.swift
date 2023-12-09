//
//  DataSourceMedicos.swift
//  TuMundoMedico-Swift
//
//  Created by Ernesto Rosales on 9/12/23.
//

import Foundation
import FirebaseFirestore

final class DataSourceEspecialidades{
    private let database = Firestore.firestore()
    private let collection = "especialidades"
    
    func getEspecialidades(completion: @escaping ([listaEspecialidades]?, Error?) -> Void) {
    let collectionRef = database.collection(collection)
    collectionRef.getDocuments { snapshot, error in
        if let error = error {
                    print("Error fetching documents: \(error)")
                    completion(nil, error)
                } else {
                    print("Documents fetched successfully")
                }
        guard let documents = snapshot?.documents else {
            completion(nil, NSError(domain: "Error getting doctors", code: 1, userInfo: nil))
            return
        }
        var especialidades: [listaEspecialidades] = []
        for document in documents {
            let data = document.data()
            print("Document Data: \(data)")
            
            let especialidadesData = EspecialidadData(
                nombre: data["nombre_especialidad"] as? String ?? "",
                imagen: data["imagen"] as? String ?? ""
            )
            // Check if the data is valid before creating a doctor
            if especialidadesData.nombre.isEmpty || especialidadesData.imagen.isEmpty{
                print("Invalid data for specialty, skipping.")
                continue
            }
            let especialidad = listaEspecialidades(id: document.documentID, data: especialidadesData)
            especialidades.append(especialidad)
        }

        completion(especialidades, nil)
        print("Number of specialties fetched: \(especialidades.count)")
    }
        
    }
        
}

