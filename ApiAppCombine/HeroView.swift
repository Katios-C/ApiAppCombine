//
//  HeroView.swift
//  ApiAppCombine
//
//  Created by Екатерина Чернова on 18.01.2021.
//

import SwiftUI

struct HeroView: View {
    var id: Int?
    @ObservedObject var viewModel = HeroesViewModel()
    
    
    var body: some View {
        HStack {
            Text("")
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
