//
//  registrarUsuario.swift
//  TuMundoMedico-Swift
//
//  Created by Enmanuel on 18/10/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore
//import FirebaseFirestoreSwift
extension Color {
    init(hex: UInt32) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

struct DoctorData: Codable {
    let nombres: String
    let apellidos: String
    let especialidad: String
    let direccion: String
    let tel: String
    let precio: Double
}

struct listaMedicos: Codable, Identifiable {
    @DocumentID var id: String?
    //var id = UUID() // Add an id property of type UUID
    let nombres: String
    let apellidos: String
    let especialidad: String
    let direccion: String
    let tel: String
    let precio: Double
    let data: DoctorData //[String: Any]
    
    init(id: String, data: DoctorData) {
        self.id = id
        self.nombres = data.nombres
        self.apellidos = data.apellidos
        self.especialidad = data.especialidad
        self.direccion = data.direccion
        self.tel = data.tel
        self.precio = Double(data.precio)
        self.data = data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let idString = try container.decode(String.self, forKey: .id)
        //id = UUID(uuidString: idString) ?? UUID()
        nombres = try container.decode(String.self, forKey: .nombres)
        apellidos = try container.decode(String.self, forKey: .apellidos)
        especialidad = try container.decode(String.self, forKey: .especialidad)
        direccion = try container.decode(String.self, forKey: .direccion)
        tel = try container.decode(String.self, forKey: .tel)
        precio = try container.decode(Double.self, forKey: .precio)
        data = try container.decode(DoctorData.self, forKey: .data)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(nombres, forKey: .nombres)
        try container.encode(apellidos, forKey: .apellidos)
        try container.encode(especialidad, forKey: .especialidad)
        try container.encode(direccion, forKey: .direccion)
        try container.encode(tel, forKey: .tel)
        try container.encode(precio, forKey: .precio)
        try container.encode(data, forKey: .data)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, nombres, apellidos, especialidad, direccion, tel, precio, data
    }
    
    static func allDoctors(completion: @escaping ([listaMedicos]?, Error?) -> Void) {
        DataSourceMedicos().getDoctors { doctors, error in
            if let error = error {
                completion(nil, error)
            } else {
                completion(doctors, nil)
            }
        }
    }
}

struct DoctorCardView: View {
    let doctor: listaMedicos
    
    var body: some View {
        ZStack {
            //Color(0xFFEBEBEB as! CGColor)
            Color(hex: 0xFFEBEBEB)
                .shadow(radius: 4)
            HStack {
                
                // Doctor image
                
                Image("imagen-usuario")
                    .resizable()
                    .frame(width: 42, height: 38)
                    .padding(.leading, 20)
                Spacer()
                // Doctor information
                
                VStack(alignment: .leading) {
                    Text("Dr. \(doctor.nombres) \(doctor.apellidos)")
                        .font(.system(size: 15))
                        .foregroundColor(Color(UIColor(hex: 0xFF616161)))
                    //.foregroundColor(Color(0xFF616161 as! CGColor))
                    Text(String(doctor.especialidad))
                        .font(.system(size: 11))
                        .foregroundColor(Color(UIColor(hex: 0xFF040243)))
                    //.foregroundColor(Color(0xFF040243 as! CGColor))
                    Text(doctor.direccion)
                        .font(.system(size: 11))
                        .foregroundColor(Color(UIColor(hex: 0xFF616161)))
                    //.foregroundColor(Color(0xFF616161 as! CGColor))
                    Text("Tel.: \(doctor.tel)")
                        .font(.system(size: 11))
                        .foregroundColor(Color(UIColor(hex: 0xFF616161)))
                    //.foregroundColor(Color(0xFF616161 as! CGColor))
                }
                .padding(.top, 5)
                .padding(.leading, 10)
                .padding(.trailing, 20)
                
                Spacer()
                // Doctor price
                Text("USD \(NumberFormatter.localizedString(from: doctor.precio as NSNumber, number: .currency))")
                //Text("USD \(doctor.precio.toStringAsFixed(2))")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(Color(UIColor(hex: 0xFF0CAE90)))
                //.foregroundColor(Color(0xFF0CAE90 as! CGColor))
                    .padding(.trailing, 20)
            }
        }
        .padding(.vertical, 20)
    }
}


struct Medicos: View {
    @State var showMenu:Bool = false;
    @State var searchText:String = "";
    @State var filteredDoctors: [listaMedicos] = []
    @State var allDoctors: [listaMedicos] = []
    
    func getDoctors() {
        DataSourceMedicos().getDoctors { doctors, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let doctors = doctors else {
                print("Error getting doctors")
                return
            }
            filteredDoctors = doctors
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                //Se coloca el color al fondo de pantalla
                Color(.white)
                //se le coloca esta propiedad para rellenar toda la pantalla
                    .ignoresSafeArea()
                //Menu Code
                //Embend the menu
                GeometryReader{ _ in
                    HStack{
                        SideMenu()
                            .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width)
                            .animation(.easeInOut)
                            .padding(.leading, 20)
                    }
                    
                }
                .zIndex(1)
                //Alineamiento vertical de los elementos
                VStack {
                    HStack{
                        Spacer()
                            .frame(width:40)
                        VStack{
                            //Mensaje de bienvenido - Titulo
                            Text("Médicos")
                                .font(
                                    Font.custom("Inter", size: 30)
                                        .weight(.bold)
                                )
                                .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                                .frame(width: 280, height: 27, alignment: .topTrailing)
                            
                            // Get all doctors when the view appears
                                .onAppear {
                                    getDoctors()
                                }
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    //Usuario
                    HStack{
                        Image("Buscar")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 5)
                        
                        TextField("Busca un médico o una especialidad",text: $searchText)
                        //Muestra todos los medicos al inicio de la carga
                            .onChange(of: searchText) { _ in
                                searchDoctors()
                            }
                    }
                    .frame(width: 290, height: 30)
                    .keyboardType(.emailAddress)
                    .labelStyle(DefaultLabelStyle())
                    .disableAutocorrection(true)
                    .padding(8)
                    .font(Font.custom("Inter", size: 14)
                        .weight(.bold))
                    .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                    .cornerRadius(15)
                    .padding(.horizontal,68)
                    .padding(.top,40)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    Spacer()
                        .frame(height: 15)
                    
                    //Menu Code
                    ZStack {
                        Color(hex: 0xFFF2F2F2)
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            // Doctor list
                            List {
                                // Header padding
                                Spacer().frame(height: 5)
                                
                                ForEach(filteredDoctors) { doctor in
                                    DoctorCardView(doctor: doctor)
                                }
                            }
                            .padding(.top, 24)
                        }
                        
                    }
                    
                    
                    
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                            //Button Menu
                            Button{
                                self.showMenu.toggle()
                            }label:{
                                if showMenu == true {
                                    Image(systemName:"chevron.left")
                                        .font(.title)
                                        .foregroundColor(.white)
                                }else{
                                    Image(systemName:"text.justify")
                                        .font(.title)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    private func searchDoctors() {
        listaMedicos.allDoctors { doctors, error in
            if let error = error {
                print("Error fetching doctors: \(error.localizedDescription)")
            } else if let doctors = doctors {
                // Use the filteredDoctors array based on the search criteria
                let lowercaseSearchText = searchText.lowercased()
                if lowercaseSearchText.isEmpty {
                    // If search text is empty, display all doctors
                    filteredDoctors = doctors
                } else {
                    // Filter doctors based on the search text
                    filteredDoctors = doctors.filter { doctor in
                        let especialidadString = String(doctor.especialidad)
                        return doctor.nombres.lowercased().contains(lowercaseSearchText) ||
                        doctor.apellidos.lowercased().contains(lowercaseSearchText) ||
                        especialidadString.lowercased().contains(lowercaseSearchText) ||
                        doctor.direccion.lowercased().contains(lowercaseSearchText) ||
                        doctor.tel.lowercased().contains(lowercaseSearchText)
                    }
                }
            }
        }
    }
}


struct Medicos_Previews: PreviewProvider{
    static var previews: some View{
        Medicos()
    }
}

