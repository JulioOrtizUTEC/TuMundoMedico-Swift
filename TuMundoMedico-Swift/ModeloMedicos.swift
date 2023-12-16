//
//  ModeloMedicos.swift
//  TuMundoMedico-Swift
//
//  Created by Juan Rosales on 4/12/23.
//

import Foundation
import FirebaseFirestore
//import FirebaseFirestoreSwift

struct ModeloMedicos: Decodable, Identifiable{
    @DocumentID var id: String?
    let nombres: String
    let apellidos: String
    let especialidad: String
    let direccion: String
    let tel: String
    let precio: Double
}
