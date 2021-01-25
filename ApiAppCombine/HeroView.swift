
import SwiftUI

struct HeroView: View {
    
    var id: Int?
    @ObservedObject var viewModel = HeroesViewModel()
    @EnvironmentObject var nav: NavViewModel
    
    var body: some View {
        NavigationView {
            
            List(viewModel.heroes, id: \.id) { hero in
                
                Text(hero.name )
                    .onTapGesture {
                        nav.push(HeroDetail(hero))
                        
                    }
            }
            .onAppear {
                viewModel.fetchHeroes()
            }
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
