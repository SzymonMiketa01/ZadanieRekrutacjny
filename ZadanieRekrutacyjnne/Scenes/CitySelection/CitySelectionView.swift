//
//  CitySelectionView.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 26/04/2021.
//

import SwiftUI

struct CitySelectionView: View {
    @ObservedObject var viewModel: CitySelectionViewModel
    
    var body: some View {
            //Text("a~")
            // Text("A")
            Form {
                Section(header: Text("Miasto"), content: {
                    TextField("Miasto", text: $viewModel.temporaryCity)
                })
                Section(header: Text("Opis"), content: {
                    HStack {
                        Text("Wersja")
                        Spacer()
                        Text("1.0.0")
                    }
                    HStack {
                        Text("Autor")
                        Spacer()
                        Text("Szymon Miketa")
                    }
                    
                })
                Section
                {
                    Button(action: {
                        viewModel.city = viewModel.temporaryCity
                    }, label: {
                        Text("Zapisz")
                    })
                }
            }
            .navigationTitle("Ustawienia")
//            .navigationBarTitleDisplayMode(.large)
//            .toolbar(content: {
//                ToolbarItem(placement: .automatic, content: {
//                    Text("Ustawienia")
//                })
//            })
    }
}

//struct CitySelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CitySelectionView(viewModel: CitySelectionViewModel(isPresented: <#Binding<Bool>#>, city: <#Binding<String>#>))
//    }
//}
