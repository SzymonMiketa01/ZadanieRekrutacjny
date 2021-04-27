//
//  CitySelectionView.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 26/04/2021.
//

import SwiftUI

struct CitySelectionView: View {
    @ObservedObject var viewModel: CitySelectionViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(viewModel: CitySelectionViewModel) {
        self.viewModel = viewModel
        
        UITableView.appearance().backgroundColor = UIColor.systemGroupedBackground
    }
    
    var body: some View {
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
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Zapisz")
                    })
                }.accentColor(.blue)
            }
            .navigationBarItems(leading: backButton)
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Ustawienia")
    }
    
    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                Text("Wróć")
            }
        }
    }
}
