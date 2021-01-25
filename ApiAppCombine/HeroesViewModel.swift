import SwiftUI
import Foundation
import Combine

class  HeroesViewModel: ObservableObject {
    @Published var heroes: [Hero] = []
    
    // Врапер @Published позволяет Swift следить за любыми изменениями этой переменной. Если что-то поменяется, то все свойства body во всех представлениях, где используется переменная heroes будут обновлены.
    
    
    private var cansellation: [AnyCancellable] = []
    private let service = HeroesService()
    
    
    
    func fetchHeroes() {
        service
            .fetch()
            .receive(on: DispatchQueue.main)
            .mapError({(error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: {_ in }, receiveValue: {heroes in
                self.heroes = heroes
            })
            .store(in: &cansellation)
    }
    
}
// .sink - тот самый сабскрайбер, который получает значения через замыкания.
//  self.heroes = heroes - присваивает значение переменной, помеченной @Published. В View эти изменения заставят обновиться var body: some View и 
