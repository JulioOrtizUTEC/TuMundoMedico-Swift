//
//  registrarUsuario.swift
//  TuMundoMedico-Swift
//
//  Created by Enmanuel on 18/10/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct EspecialidadData: Codable {
    let nombre: String
    let imagen: String
}

struct listaEspecialidades: Codable, Identifiable {
    @DocumentID var id: String?
    //var id = UUID() // Add an id property of type UUID
    let nombre: String
    let imagen: String
    let data: EspecialidadData //[String: Any]
    
    init(id: String, data: EspecialidadData) {
        self.id = id
        self.nombre = data.nombre
        self.imagen = data.imagen
        self.data = data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let idString = try container.decode(String.self, forKey: .id)
        //id = UUID(uuidString: idString) ?? UUID()
        nombre = try container.decode(String.self, forKey: .nombre)
        imagen = try container.decode(String.self, forKey: .imagen)
        data = try container.decode(EspecialidadData.self, forKey: .data)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(nombre, forKey: .nombre)
        try container.encode(imagen, forKey: .imagen)
        try container.encode(data, forKey: .data)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, nombre, imagen, data
    }
    
    static func allSpecialties(completion: @escaping ([listaEspecialidades]?, Error?) -> Void) {
        DataSourceEspecialidades().getEspecialidades { specialties, error in
            if let error = error {
                completion(nil, error)
            } else {
                completion(specialties, nil)
            }
        }
    }
}

struct SpecialtyCardView: View {
    let especialidad: listaEspecialidades
    
    var body: some View {
        ZStack {
            Color(hex: 0xFFEBEBEB)
                .shadow(radius: 4)
            
            HStack {
                if especialidad.data != nil {
                    GroupBox {
                        AsyncImage(url: URL(string: especialidad.imagen)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 144, height: 94)
                                    .clipped()
                                    .background(Color.white)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 144, height: 94)
                                    .clipped()
                                    .background(Color.white)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        Text(especialidad.nombre)
                            .font(Font.custom("Inter", size: 11).weight(.bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 120, height: 24, alignment: .top)
                    }
                    .foregroundColor(.clear)
                    .frame(width: 144, height: 131)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    
                    Spacer().frame(width: 25)
            }
             
            }
            .padding()
        
        }
        .padding(.vertical, 20)
    }
}


struct Inicio: View {
    
    @State var showMenu:Bool = false;
    @State var search:String = "";
    @State var filteredSpecialties: [listaEspecialidades] = []
    @State var allSpecialties: [listaEspecialidades] = []
    
    func getSpecialties() {
        DataSourceEspecialidades().getEspecialidades { specialties, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let specialties = specialties else {
                print("Error getting specialties")
                return
            }
            filteredSpecialties = specialties
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
                            Text("Especialidades")
                                .font(
                                    Font.custom("Inter", size: 30)
                                        .weight(.bold)
                                )
                                .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                                .frame(width: 280, height: 27, alignment: .topTrailing)
                            
                            // Get all Specialties when the view appears
                                .onAppear {
                                    getSpecialties()
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
                        
                        TextField("Busca un médico o una especialidad",text: $search)
                        //Muestra todos las especialidades al inicio de la carga
                            .onChange(of: search) { _ in
                                searchSpecialties()
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
                        .frame(height: 40)
                    
                    ZStack {
                        Color(hex: 0xFFF2F2F2)
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            // Doctor list
                            List {
                                // Header padding
                                Spacer().frame(height: 5)
                                
                                ForEach(filteredSpecialties) { specialty in
                                    SpecialtyCardView(especialidad: specialty)
                                }
                            }
                            .padding(.top, 24)
                        }
                        
                    }
                   
                    
                    
                }
                //Menu Code
                .toolbar{
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
    
    private func searchSpecialties() {
        listaEspecialidades.allSpecialties { specialties, error in
            if let error = error {
                print("Error fetching specialties: \(error.localizedDescription)")
            } else if let specialties = specialties {
                // Use the filteredDoctors array based on the search criteria
                let lowercaseSearchText = search.lowercased()
                if lowercaseSearchText.isEmpty {
                    // If search text is empty, display all doctors
                    filteredSpecialties = specialties
                } else {
                    // Filter doctors based on the search text
                    filteredSpecialties = specialties.filter { specialty in
                        let especialidadString = String(specialty.nombre)
                        return specialty.nombre.lowercased().contains(lowercaseSearchText)
                    }
                }
            }
        }
    }
    
}


struct Inicio_Previews: PreviewProvider{
    static var previews: some View{
        Inicio()
    }
}
