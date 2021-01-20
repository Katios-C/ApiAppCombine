import Foundation
import Combine

class BBViewModel: ObservableObject {
    private var network = NetworkService()
    private var subs: [AnyCancellable] = []
    
    @Published var character:[BBCharacterElement] = []
    @Published var username: String = ""
    @Published var password: String = ""
    
    func fetchData() {
        network
            .loadData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: onCompleteOrError, receiveValue: onValue)
            .store(in: &subs)
    }
    
    func onValue(value: BBCharacter ) {
        character = value
    }
    
    func onCompleteOrError(res: Subscribers.Completion<Error>) {
        switch res {
        case .finished:
            print("finished")
        case .failure(let error):
            print(error)
        }
    }
}


