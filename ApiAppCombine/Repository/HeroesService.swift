import Foundation
import Combine

class HeroesService {
    
    func fetch() -> AnyPublisher<[Hero], Error> {
        
        let url = URL(string: "https://api.openbrewerydb.org/breweries")!
        
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap {
                print($0.data)
                return try JSONDecoder().decode([Hero].self, from: $0.data)
            }
            .eraseToAnyPublisher()
    }
}
