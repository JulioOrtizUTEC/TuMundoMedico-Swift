//
//  registrarUsuario.swift
//  TuMundoMedico-Swift
//
//  Created by Enmanuel on 18/10/23.
//

import Foundation
import SwiftUI


struct Perfil: View {
    @State var nombres:String = "";
    @State var apellidos:String = "";
    @State var correo:String = "";
    @State var direccion:String = "";
    @State var departamento:String = "";
    @State var edad:String = "";
    
    // Definir arreglo de departamentos
    let departamentos = ["Seleccionar Departamento","Ahuachapan", "Cabañas", "Chalatenango", "Cuscatlán", "La Libertad", "Morazán", "La Paz", "Santa Ana", "San Miguel", "San Salvador", "San Vicente", "Sonsonate", "La Unión", "Usulután"];
    
    var body: some View {
        ZStack{
            //Se coloca el color al fondo de pantalla
            Color(.white)
            //se le coloca esta propiedad para rellenar toda la pantalla
                .ignoresSafeArea()
            //Alineamiento vertical de los elementos
            VStack {
                HStack{
                    Spacer()
                        .frame(width:60)
                    VStack{
                        //Mensaje de bienvenido - Titulo
                        Text("Perfil")
                            .font(
                                Font.custom("Inter", size: 30)
                                    .weight(.bold)
                            )
                            .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                            .frame(width: 280, height: 27, alignment: .topTrailing)
                    }
                }
                Spacer()
                    .frame(height: 60)
                HStack{
                    //Nombre Usuario
                    Text("Nombre Usuario")
                        .font(
                            Font.custom("Inter", size: 24)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.05, green: 0.36, blue: 0.45))
                    
                        .frame(width: 120, height: 80, alignment: .topLeading)
                    Spacer()
                        .frame(width:60)
                    Image("Usu")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 108, height: 108)
                        .clipped()
                    
                }
                Spacer()
                    .frame(height: 40)
                //Información General
                HStack{
                    Text("Información General")
                        .font(
                            Font.custom("Inter", size: 16)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                        .frame(width: 160, height: 27, alignment: .topLeading)
                    Spacer()
                        .frame(width: 130)
                }
                //Campos de nombres y apellidos
                HStack{
                    //Nombres
                    TextField("Ingrese sus Nombres",text: $nombres)
                        .frame(width: 130, height: 25)
                        .keyboardType(.emailAddress)
                        .labelStyle(DefaultLabelStyle())
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(
                            Font.custom("Inter", size: 13)
                                .weight(.bold)
                        )
                        .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    //Apellidos
                    TextField("Ingrese sus Apellidos",text: $apellidos)
                        .frame(width: 130, height: 25)
                        .keyboardType(.emailAddress)
                        .labelStyle(DefaultLabelStyle())
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(
                            Font.custom("Inter", size: 13)
                                .weight(.bold)
                        )
                        .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                }
                //Campo de Correo
                HStack{
                    //Correo
                    TextField("Ingrese su Correo Electronico",text: $correo)
                        .frame(width: 290, height: 25)
                        .keyboardType(.emailAddress)
                        .labelStyle(DefaultLabelStyle())
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(
                            Font.custom("Inter", size: 13)
                                .weight(.bold)
                        )
                        .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                        .cornerRadius(15)
                        .padding(.top, 10)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                }
                //Campo de Direccion
                HStack{
                    //Correo
                    TextField("Ingrese su Dirección",text: $correo)
                        .frame(width: 290, height: 25)
                        .keyboardType(.emailAddress)
                        .labelStyle(DefaultLabelStyle())
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(
                            Font.custom("Inter", size: 13)
                                .weight(.bold)
                        )
                        .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                        .cornerRadius(15)
                        .padding(.top, 10)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                }
                //Campos de Departamento y Edad
                HStack{
                    //Departamento
                    VStack{
                        Picker("Seleccionar Departamento", selection: $departamento) {
                            ForEach(departamentos, id: \.self) { departamento in
                                Text(departamento)
                            }
                        }
                        .frame(width: 190, height: 25)
                        .keyboardType(.emailAddress)
                        .labelStyle(DefaultLabelStyle())
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(
                            Font.custom("Inter", size: 10)
                                .weight(.bold)
                        )
                        .accentColor(.gray)
                        .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                        .cornerRadius(15)
                        .padding(.top, 10)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                    //Edad
                    TextField("Edad",text: $edad)
                        .frame(width: 70, height: 25)
                        .keyboardType(.emailAddress)
                        .labelStyle(DefaultLabelStyle())
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(
                            Font.custom("Inter", size: 13)
                                .weight(.bold)
                        )
                        .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                        .cornerRadius(15)
                        .padding(.top, 10)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                }
                VStack{
                    //Boton iniciar sesión
                    Button("Actualizar Perfil"){
                        
                    }
                        .padding(.top, 15)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 16)
                        .padding(.bottom, 16)
                        .frame(width: 221, height: 30, alignment: .center)
                        .background(Color(red: 0.05, green: 0.36, blue: 0.45))
                        
                        .cornerRadius(4)
                        .shadow(color: Color(red: 0.15, green: 0.17, blue: 0.38).opacity(0.2), radius: 10.5, x: 0, y: 7)
                        .shadow(color: Color(red: 0.53, green: 0.56, blue: 0.76).opacity(0.25), radius: 4, x: 0, y: 3)
                        .font(Font.custom("Lato", size: 14)
                            .weight(.bold))
                        .foregroundColor(.white)
                        .padding(.top,40)
                    //Boton iniciar sesión
                    Spacer()
                        .frame(height: 30)
                    Button("Actualizar Contraseña"){
                        
                    }
                        .padding(.top, 15)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 16)
                        .padding(.bottom, 16)
                        .frame(width: 221, height: 30, alignment: .center)
                        .background(Color(red: 0.53, green: 0.56, blue: 0.76))
                        .cornerRadius(4)
                        .shadow(color: Color(red: 0.15, green: 0.17, blue: 0.38).opacity(0.2), radius: 10.5, x: 0, y: 7)
                        .shadow(color: Color(red: 0.53, green: 0.56, blue: 0.76).opacity(0.25), radius: 4, x: 0, y: 3)
                        .font(Font.custom("Lato", size: 14)
                            .weight(.bold))
                        .foregroundColor(.white)
                }
                
            }
        }
        .padding()
    }
}



