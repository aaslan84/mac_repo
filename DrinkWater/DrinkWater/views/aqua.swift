//
//  aqua.swift
//  DrinkWater
//
//  Created by aslan on 6.03.2022.
//

import SwiftUI

struct aqua: View {
    @State private var mainViewIndex: String? = nil
    @State var showCupAddPopUp: Bool = false
    
    var body: some View {
        NavigationView{
            VStack(spacing:0){
                //Spacer()
                ZStack(alignment: .bottomTrailing){
                    Image("aqua")
                        .resizable()
                    //.aspectRatio(contentMode: .fit)
                        .padding(0)
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        NavigationLink(destination: WaterDiary())
                        {
                        Image(systemName: "note.text")
                            .foregroundColor(Color.black)
                        }
                        Spacer()
                        //NavigationLink(destination: WaterDiary<<#Content: View#>>())
                        //{
                            Image(systemName: "plus")
                                .foregroundColor(Color.black)
                                .onTapGesture {
                                    showCupAddPopUp.toggle()
                                }
                        //}
                        Spacer()
                        NavigationLink(destination: Settings())
                        {
                            Image(systemName: "gearshape")
                                .foregroundColor(Color.black)
                        }
                        Spacer()
                            .frame(width: 50)
                    }
                    .offset(y: -10)
                    //.padding(0)
                }
                //.aspectRatio(contentMode: .fit)
                Rectangle()
                    .frame(width: .infinity, height: 50, alignment: .center)
                    .padding(0.0)
                //.foregroundColor(Color.yellow)
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
            
        }
        //.frame(width: .infinity, height: .infinity, alignment: .leading)
        //.padding(0.0)
        //.background(Color.blue)
        .cupAddSheet(showSheet: $showCupAddPopUp) {
            Text("Add Cup")
        } onEnd: {
            print("Dismissed")
        }
    }
}

struct aqua_Previews: PreviewProvider {
    static var previews: some View {
        aqua()
    }
}
