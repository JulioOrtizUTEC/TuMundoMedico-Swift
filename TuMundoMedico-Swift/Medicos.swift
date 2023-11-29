//
//  registrarUsuario.swift
//  TuMundoMedico-Swift
//
//  Created by Enmanuel on 18/10/23.
//

import Foundation
import SwiftUI


struct Medicos: View {
    @State var showMenu:Bool = false;
    @State var search:String = "";
    
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
                            .padding(.leading, 50)
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
                    //Carta 1
                    HStack{
                        Section {
                            GroupBox() {
                                HStack{
                                    Image("Usu")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 42, height: 38)
                                        .clipped()
                                    Spacer()
                                        .frame(width: 20)
                                    VStack{
                                        //Titulo
                                        Text("Dr. Ramos Jose Vasquez")
                                            .font(
                                                Font.custom("Inter", size: 14)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Especialidad
                                        Text("Medicina General")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Direccion
                                        Text("Col. Medica, San Salvador, El Salvador")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38).opacity(0.75))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Telefono
                                        Text("Tel. 2275-5063")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38).opacity(0.75))
                                            .frame(width: 200, alignment: .topLeading)
                                    }
                                    Text("$25.00")
                                        .font(
                                            Font.custom("Inter", size: 16)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Color(red: 0.05, green: 0.68, blue: 0.56))
                                }
                            }
                            .foregroundColor(.clear)
                            .frame(width: 500, height: 70)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        }
                    }.padding()
                    //Carta 2
                    HStack{
                        Section {
                            GroupBox() {
                                HStack{
                                    Image("Usu")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 42, height: 38)
                                        .clipped()
                                    Spacer()
                                        .frame(width: 20)
                                    VStack{
                                        //Titulo
                                        Text("Dra. Jocelyn Vasquez")
                                            .font(
                                                Font.custom("Inter", size: 14)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Especialidad
                                        Text("Medicina General")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Direccion
                                        Text("Col. Medica, San Salvador, El Salvador")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38).opacity(0.75))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Telefono
                                        Text("Tel. 7855-0631")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38).opacity(0.75))
                                            .frame(width: 200, alignment: .topLeading)
                                    }
                                    Text("$35.00")
                                        .font(
                                            Font.custom("Inter", size: 16)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Color(red: 0.05, green: 0.68, blue: 0.56))
                                }
                            }
                            .foregroundColor(.clear)
                            .frame(width: 500, height: 70)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        }
                    }
                    //Carta 3
                    HStack{
                        Section {
                            GroupBox() {
                                HStack{
                                    Image("Usu")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 42, height: 38)
                                        .clipped()
                                    Spacer()
                                        .frame(width: 20)
                                    VStack{
                                        //Titulo
                                        Text("Dr. David Guzmán Molina")
                                            .font(
                                                Font.custom("Inter", size: 14)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Especialidad
                                        Text("Medicina General")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Direccion
                                        Text("Calle Arce, San Miguel, El Salvador")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38).opacity(0.75))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Telefono
                                        Text("Tel. 6840-6792")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38).opacity(0.75))
                                            .frame(width: 200, alignment: .topLeading)
                                    }
                                    Text("$40.00")
                                        .font(
                                            Font.custom("Inter", size: 16)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Color(red: 0.05, green: 0.68, blue: 0.56))
                                }
                            }
                            .foregroundColor(.clear)
                            .frame(width: 500, height: 70)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        }
                    }
                    //Carta 4
                    HStack{
                        Section {
                            GroupBox() {
                                HStack{
                                    Image("Usu")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 42, height: 38)
                                        .clipped()
                                    Spacer()
                                        .frame(width: 20)
                                    VStack{
                                        //Titulo
                                        Text("Dr. Rutilio Villavisencio")
                                            .font(
                                                Font.custom("Inter", size: 14)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Especialidad
                                        Text("Medicina General")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Direccion
                                        Text("Santa Tecla, La Libertad, El Salvador")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38).opacity(0.75))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Telefono
                                        Text("Tel. 2270-3303")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38).opacity(0.75))
                                            .frame(width: 200, alignment: .topLeading)
                                    }
                                    Text("$15.00")
                                        .font(
                                            Font.custom("Inter", size: 16)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Color(red: 0.05, green: 0.68, blue: 0.56))
                                }
                            }
                            .foregroundColor(.clear)
                            .frame(width: 500, height: 70)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        }
                    }.padding()
                    //Carta 5
                    HStack{
                        Section {
                            GroupBox() {
                                HStack{
                                    Image("Usu")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 42, height: 38)
                                        .clipped()
                                    Spacer()
                                        .frame(width: 20)
                                    VStack{
                                        //Titulo
                                        Text("Dra. Maria Antonieta Aguirre")
                                            .font(
                                                Font.custom("Inter", size: 14)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Especialidad
                                        Text("Medicina General")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.01, green: 0.01, blue: 0.26))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Direccion
                                        Text("Sonsonate, El Salvador")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38).opacity(0.75))
                                            .frame(width: 200, alignment: .topLeading)
                                        //Telefono
                                        Text("Tel. 7518-9921")
                                            .font(
                                                Font.custom("Inter", size: 10)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38).opacity(0.75))
                                            .frame(width: 200, alignment: .topLeading)
                                    }
                                    Text("$15.00")
                                        .font(
                                            Font.custom("Inter", size: 16)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Color(red: 0.05, green: 0.68, blue: 0.56))
                                }
                            }
                            .foregroundColor(.clear)
                            .frame(width: 500, height: 70)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        }
                    }
                    //Menu Code
                    .toolbar{
                        ToolbarItem(placement: ToolbarItemPlacement.topBarLeading) {
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
}

struct Medicos_Previews: PreviewProvider{
    static var previews: some View{
        Medicos()
    }
}

