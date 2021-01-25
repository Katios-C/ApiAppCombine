
import SwiftUI

struct HeroDetail: View {
    
    @EnvironmentObject var nav: NavViewModel
    
    let hero: Hero
    
    init(_ i: Hero) {
        hero = i
    }
    
    var body: some View {
        Text(hero.name)
            
            .onTapGesture {
                nav.pop()
        }
    }
}
