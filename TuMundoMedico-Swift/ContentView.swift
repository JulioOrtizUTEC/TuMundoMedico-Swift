//
//  ContentView.swift
//  TuMundoMedico-Swift
//
//  Created by Enmanuel on 18/10/23.
//
import Foundation
import SwiftUI
// Importando las librerias para Firebase
import FirebaseCore
import FirebaseAuth

struct ContentView: View {
    
    @State var user:String = "";
    @State var password:String = "";
    @State var action:Bool = false;
    @State var isSigned:Bool = false;
    
    var body: some View {
        NavigationView {
            ZStack{
                //Se coloca el color al fondo de pantalla
                Color(red: 0.76, green: 0.91, blue: 0.96)
                //se le coloca esta propiedad para rellenar toda la pantalla
                    .ignoresSafeArea()
                //Alineamiento vertical de los elementos
                VStack {
                    HStack{
                        
                        VStack{
                            //Mensaje de bienvenido - Titulo
                            Text("¡Bienvenido/a!")
                                .font(
                                    Font.custom("Inter", size: 26)
                                        .weight(.bold)
                                )
                                .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                                .frame(width: 230, height: 27, alignment: .topLeading)
                            //Subtitulo
                            Text("Nos encanta verte de nuevo")
                                .font(
                                    Font.custom("Inter", size: 18)
                                        .weight(.bold)
                                )
                                .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                                .frame(width: 230, height: 27, alignment: .topLeading)
                        }
                        Spacer()
                            .frame(width:60)
                        
                    }
                    Spacer()
                        .frame(height: 120)
                    //Imagen
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 100, height: 100)
                        .background(
                            Image("Usu")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipped()
                        )
                    
                    //Seccion de los textfields
                    //Usuario
                    HStack{
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 5)
                        
                        TextField("Ingrese su Usuario",text: $user)
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
                    .padding(.top,40)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
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
                    //Olvidaste tu contrasenia
                    Button("¿Olvidaste tu contraseña?"){
                        
                    }
                    .foregroundColor(Color(red: 0.05, green: 0.68, blue: 0.56))
                    .padding(.top, 21)
                    .font(
                        Font.custom("Lato", size: 16)
                            .weight(.bold)
                    )
                    .padding(.bottom, 15)
                    NavigationLink(destination: Inicio(), isActive: $isSigned) {
                        EmptyView()
                    }
                    .hidden()
                    //Boton iniciar sesión
                    Button("Iniciar Sesion"){
                        
                        if(user != "" && password != ""){
                            Auth.auth().signIn(withEmail: user, password: password){ authResult, error in
                                
                                if let error = error {
                                    print(error)
                                    return
                                }
                                
                                if let authResult = authResult{
                                    print(authResult)
                                    isSigned.toggle()
                                }
                                
                            }
                        }else{
                            print("Debe llenar todos los campos solicitados")
                        }
                        
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
                    Spacer()
                        .frame(height: 25)
                    NavigationLink(destination: registrarUsuario(), isActive: $action) {
                    }
                    .hidden()
                    //Boton registrarte
                    Button("Registrate"){
                        self.action = true;
                    }
                    .padding(.top, 15)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                    .padding(.bottom, 16)
                    .frame(width: 221, height: 30, alignment: .center)
                    .background(.white)
                    .cornerRadius(4)
                    .shadow(color: Color(red: 0.15, green: 0.17, blue: 0.38).opacity(0.2), radius: 10.5, x: 0, y: 7)
                    .shadow(color: Color(red: 0.53, green: 0.56, blue: 0.76).opacity(0.25), radius: 4, x: 0, y: 3)
                    .font(Font.custom("Lato", size: 14)
                        .weight(.bold))
                    .foregroundColor(Color(red: 0.05, green: 0.68, blue: 0.56))
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
