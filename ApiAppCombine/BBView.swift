//
//  BBView.swift
//  ApiAppCombine
//
//  Created by Екатерина Чернова on 20.01.2021.
//

import SwiftUI

struct BBView: View {
    @ObservedObject private var BViewModel = BBViewModel()
    
    var body: some View {
        VStack {
            List(BViewModel.character, id:\.charID) { item in
                Text(item.name ?? "")
            }
        }
        .onAppear {
            BViewModel.fetchData()
        }
    }
}

struct BBView_Previews: PreviewProvider {
    static var previews: some View {
        BBView()
    }
}
