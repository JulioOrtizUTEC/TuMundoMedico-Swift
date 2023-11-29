//
//  registrarUsuario.swift
//  TuMundoMedico-Swift
//
//  Created by Enmanuel on 18/10/23.
//

import Foundation
import SwiftUI


struct Inicio: View {
    
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
                    //Linea 1 de especialidades
                    HStack{
                        Section {
                            GroupBox() {
                                Image("MedicinaGeneral")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 144, height: 94)
                                    .clipped()
                                    .background(.white)
                                Text("Medicina General")
                                    .font(
                                        Font.custom("Inter", size: 11)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                    .frame(width: 120, height: 24, alignment: .top)
                            }
                            .foregroundColor(.clear)
                            .frame(width: 144, height: 131)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            Spacer()
                                .frame(width: 25)
                            GroupBox() {
                                Image("Urologia")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 144, height: 94)
                                    .clipped()
                                    .background(.white)
                                Text("Urologia")
                                    .font(
                                        Font.custom("Inter", size: 11)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                    .frame(width: 120, height: 24, alignment: .top)
                            }
                            .foregroundColor(.clear)
                            .frame(width: 144, height: 131)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        }
                    }.padding()
                    //Linea 2 de especialidades
                    HStack{
                        Section {
                            GroupBox() {
                                Image("Cirujanos")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 144, height: 94)
                                    .clipped()
                                    .background(.white)
                                Text("Cirujanos")
                                    .font(
                                        Font.custom("Inter", size: 11)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                    .frame(width: 120, height: 24, alignment: .top)
                            }
                            .foregroundColor(.clear)
                            .frame(width: 144, height: 131)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            Spacer()
                                .frame(width: 25)
                            GroupBox() {
                                Image("Cardiologia")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 144, height: 94)
                                    .clipped()
                                    .background(.white)
                                Text("Cardiologia")
                                    .font(
                                        Font.custom("Inter", size: 11)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                    .frame(width: 120, height: 24, alignment: .top)
                            }
                            .foregroundColor(.clear)
                            .frame(width: 144, height: 131)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        }
                    }.padding()
                    //Linea 3 de especialidades
                    HStack{
                        Section {
                            GroupBox() {
                                Image("CirujiaPlastica")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 144, height: 94)
                                    .clipped()
                                    .background(.white)
                                Text("Cirujia Plastica")
                                    .font(
                                        Font.custom("Inter", size: 11)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                    .frame(width: 120, height: 24, alignment: .top)
                            }
                            .foregroundColor(.clear)
                            .frame(width: 144, height: 131)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            Spacer()
                                .frame(width: 25)
                            GroupBox() {
                                Image("Dermatologo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 144, height: 94)
                                    .clipped()
                                    .background(.white)
                                Text("Dermatologia")
                                    .font(
                                        Font.custom("Inter", size: 11)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                    .frame(width: 120, height: 24, alignment: .top)
                            }
                            .foregroundColor(.clear)
                            .frame(width: 144, height: 131)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        }
                    }.padding()
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


struct Inicio_Previews: PreviewProvider{
    static var previews: some View{
        Inicio()
    }
}
