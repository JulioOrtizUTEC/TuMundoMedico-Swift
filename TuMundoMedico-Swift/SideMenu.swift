//
//  registrarUsuario.swift
//  TuMundoMedico-Swift
//
//  Created by Enmanuel on 18/10/23.
//

import Foundation
import SwiftUI


struct SideMenu: View {
    
    @State var isSignedOff:Bool = false;
    @State var optionSelected:Int? = 0;
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            /*VStack(){
             Button{
             Inicio().showMenu.toggle();
             }label:{
             Image(systemName: "chevron.left")
             .font(.title)
             .foregroundColor(.white)
             }
             
             }
             .padding(.leading, 260)
             .padding(.bottom, 80)
             */
            VStack(alignment: .leading, spacing: 15){
                //Imagen
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 138, height: 138)
                    .background(
                        Image("Usu")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 138, height: 138)
                            .clipped()
                    )
                //Title
                Text("Usuario")
                    .font(
                        Font.custom("Inter Bold", size: 22)
                            .weight(.bold)
                    )
                    .padding(.leading, -20)
                    .foregroundColor(.white)
                    .frame(width: 163, height: 27, alignment: .top)
            }
            .padding(.horizontal)
            .padding(.leading, 60)
            //Opciones
            NavigationLink(destination: Inicio(), tag: 1, selection: $optionSelected) {
                EmptyView()
            }
            NavigationLink(destination: Medicos(), tag: 2, selection: $optionSelected) {
                EmptyView()
            }
            NavigationLink(destination: Perfil(), tag: 3, selection: $optionSelected) {
                EmptyView()
            }
            Spacer()
                .frame(height: 60)
            //Opciones
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading, spacing: 5){
                        
                        //Todas las opciones
                        //Inicio
                        TabButton("Inicio","home",1)
                        TabButton("Medicos","medics",2)
                        TabButton("Perfil","profile",3)
                        
                    }
                    .padding()
                    .padding(.leading)
                }
            Divider()
            VStack{
                //Boton de cerrar sesion
                NavigationLink(destination: ContentView(), isActive: $isSignedOff) {
                    EmptyView()
                }
                Button("Cerrar Sesion"){
                    self.isSignedOff = true
                }
                .padding(.top, 15)
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .padding(.bottom, 16)
                .frame(width: 221, height: 30, alignment: .center)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color(red: 0.15, green: 0.17, blue: 0.38).opacity(0.2), radius: 10.5, x: 0, y: 7)
                .shadow(color: Color(red: 0.53, green: 0.56, blue: 0.76).opacity(0.25), radius: 4, x: 0, y: 3)
                .font(Font.custom("Lato", size: 14)
                    .weight(.bold))
                .foregroundColor(Color(red: 0.95, green: 0.02, blue: 0.02).opacity(0.75))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.95, green: 0.02, blue: 0.02).opacity(0.75), lineWidth: 1.5)
                    
                )
            }
            .padding(.leading, 40)
            
        }
        //Max Width
        .frame(width: getRect().width - 90)
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(
            Color(red: 0.04, green: 0.46, blue: 0.38)
                .ignoresSafeArea(.container, edges: .vertical)
        .shadow(color: Color(red: 0.53, green: 0.56, blue: 0.76).opacity(0.50), radius: 10, x: 5, y: 0)
        )
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    
    @ViewBuilder
    func TabButton(_ title: String, _ image:String, _ option: Int)->some View{
        
        NavigationLink(destination: Inicio(), tag: 1, selection: $optionSelected) {}
        NavigationLink(destination: Medicos(), tag: 2, selection: $optionSelected) {}
        NavigationLink(destination: Perfil(), tag: 3, selection: $optionSelected) {}
        
        Button{
            self.optionSelected = option
        } label:{
            HStack(spacing: 13){
                //Icon
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 25, height: 25)
                    .background(
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25, height: 25)
                            .clipped()
                    )
                //Text
                Text(title)
                    .font(
                        Font.custom("Lato", size: 16)
                            .weight(.bold)
                    )
                    .foregroundColor(.white)
                    .frame(width: 147, height: 23, alignment: .topLeading)
                    .padding(.top, 5)
            }
        }
    }
}


struct SideMenu_Previews: PreviewProvider{
    static var previews: some View{
        SideMenu()
    }
}


extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
