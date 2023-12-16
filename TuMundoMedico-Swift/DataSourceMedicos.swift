//
//  DataSourceMedicos.swift
//  TuMundoMedico-Swift
//
//  Created by Ernesto Rosales on 5/12/23.
//

import Foundation
import FirebaseFirestore
//import FirebaseFirestoreSwift

final class DataSourceMedicos{
    private let database = Firestore.firestore()
    private let collection = "medicos"
    
    func getDoctors(completion: @escaping ([listaMedicos]?, Error?) -> Void) {
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
        var doctors: [listaMedicos] = []
        for document in documents {
            let data = document.data()
            print("Document Data: \(data)")
            
            let doctorData = DoctorData(
                nombres: data["nombres_medico"] as? String ?? "",
                apellidos: data["apellidos_medico"] as? String ?? "",
                especialidad: data["nombre_especialidad"] as? String ?? "",
                direccion: data["direccion_medico"] as? String ?? "",
                tel: data["telefono_medico"] as? String ?? "",
                precio: data["precio_consulta"] as? Double ?? 0.0
                
                
            )
            // Check if the data is valid before creating a doctor
            if doctorData.nombres.isEmpty || doctorData.apellidos.isEmpty || doctorData.especialidad.isEmpty {
                print("Invalid data for doctor, skipping.")
                continue
            }
            let doctor = listaMedicos(id: document.documentID, data: doctorData)
            doctors.append(doctor)
        }

        completion(doctors, nil)
        print("Number of doctors fetched: \(doctors.count)")
    }
        
    }
        
}
