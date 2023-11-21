//
//  registrarUsuario.swift
//  TuMundoMedico-Swift
//
//  Created by Enmanuel on 18/10/23.
//

import Foundation
import SwiftUI


struct recuContra: View {
    @State var password:String = "";
    @State var confPassword:String = "";
    
    var body: some View {
        ZStack{
            //Se coloca el color al fondo de pantalla
            Color(red: 0.76, green: 0.91, blue: 0.96)
                //se le coloca esta propiedad para rellenar toda la pantalla
                .ignoresSafeArea()
            //Alineamiento vertical de los elementos
            VStack {
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                    Spacer()
                        .frame(width:60)
                    VStack{
                        //Mensaje de bienvenido - Titulo
                        Text("Recupera tu contraseña")
                          .font(
                            Font.custom("Inter", size: 26)
                              .weight(.bold)
                          )
                          .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                          .frame(width: 280, height: 27, alignment: .topTrailing)
                        //Subtitulo
                        Text("Sigue los pasos de la aplicación")
                          .font(
                            Font.custom("Inter", size: 18)
                              .weight(.bold)
                          )
                          .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                          .frame(width: 280, height: 27, alignment: .topTrailing)
                    }
                }
                Spacer()
                    .frame(height: 120)
                //Imagen
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 100, height: 100)
                  .background(
                    Image("Recuperar")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 130, height: 130)
                      .clipped()
                  )
                Spacer()
                    .frame(height: 30)
                //Seccion de los textfields
                //Contrasenia
                HStack{
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 16, height: 21)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 5)
                    SecureField("Ingrese su Contraseña",text: $password)
                }
                .frame(width: 268, height: 35)
                .keyboardType(.emailAddress)
                .labelStyle(DefaultLabelStyle())
                .disableAutocorrection(true)
                .padding(8)
                .font(.headline)
                .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                .cornerRadius(15)
                .padding(.horizontal,68)
                .padding(.top,21)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                //Confirmar Contrasenia
                HStack{
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 16, height: 21)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 5)
                    SecureField("Confirme su Contraseña",text: $confPassword)
                }
                .frame(width: 268, height: 35)
                .keyboardType(.emailAddress)
                .labelStyle(DefaultLabelStyle())
                .disableAutocorrection(true)
                .padding(8)
                .font(.headline)
                .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                .cornerRadius(15)
                .padding(.horizontal,68)
                .padding(.top,21)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                Spacer()
                    .frame(height: 30)
                //Boton iniciar sesión
                Button("Recuperar Contraseña"){
                    
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
            }
            .padding()
        }
    }
}

