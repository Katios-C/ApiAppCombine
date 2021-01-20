import Foundation
import Combine

struct NetworkService {
    
    func loadData() -> AnyPublisher<BBCharacter, Error> {
        let url = URL(string: "https://www.breakingbadapi.com/api/characters")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap {
                print($0.data)
                return try JSONDecoder().decode(BBCharacter.self, from: $0.data)
            }
            .eraseToAnyPublisher()
    }
    
}
