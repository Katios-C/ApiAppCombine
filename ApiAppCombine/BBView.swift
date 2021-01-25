
import SwiftUI

struct BBView: View {
    @ObservedObject private var bViewModel = BBViewModel()
    @EnvironmentObject var nav: NavViewModel
    
    var body: some View {
        NavigationView {
            
            
            List(bViewModel.character, id:\.charID) { item in
                
                Text(item.name ?? "")
                Text(item.birthday?.rawValue ?? "")
                    
                    
                    .onTapGesture {
                        nav.push(BbDetail(item))
                        
                    }
            }
            
        }
        .onAppear {
            bViewModel.fetchData()
        }
    }
}

struct BBView_Previews: PreviewProvider {
    static var previews: some View {
        BBView()
    }
}
