
import SwiftUI

struct BbDetail: View  {
   
    @EnvironmentObject var nav: NavViewModel
    
    let character: BBCharacterElement
    
    init(_ i: BBCharacterElement) {
        character = i
    }
    
    var body: some View {
        Text(character.nickname ?? "")
  
                .onTapGesture {
                    nav.pop()
            }
        
    }
    
}
