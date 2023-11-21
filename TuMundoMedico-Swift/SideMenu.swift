//
//  registrarUsuario.swift
//  TuMundoMedico-Swift
//
//  Created by Enmanuel on 18/10/23.
//

import Foundation
import SwiftUI


struct MenuContent: View {
    var body: some View {
        ZStack{
            GeometryReader{
                _ in EmptyView()
            }
            .background(Color(red: 0.04, green: 0.46, blue: 0.38))
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture{
                //self.toggleMenu()
            }
        }
        .padding()
    }
}

struct SideMenu: View {
    
    let width: CGFloat;
    var menuOpened: Bool;
    let toggleMenu: () -> Void;
    
    var body: some View {
        ZStack{
            //Se coloca el color al fondo de pantalla
            Color(red: 0.04, green: 0.46, blue: 0.38)
            //se le coloca esta propiedad para rellenar toda la pantalla
                .ignoresSafeArea()
            //Alineamiento vertical de los elementos
            VStack {
                
            }
        }
        .padding()
    }
}



