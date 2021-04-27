//
//  CustomDivider.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 26/04/2021.
//

import SwiftUI

struct CustomDivider: View {
    var color: Color = .white
    let width: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
