import Foundation
import SwiftUI

struct Screen: Identifiable, Equatable {
    var id: String
    var nextScreen: AnyView
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

struct ScreensStack {
    private var stack: [Screen] = []
    
    func top() -> Screen? {
        return stack.last
    }
    
    mutating func push(_ newScreen: Screen) {
        stack.append(newScreen)
    }
    
    mutating func pop() {
        _ = stack.popLast()
    }
    
    mutating func popToRoot() {
        stack.removeAll()
    }
}

final class NavViewModel : ObservableObject {
    
    private var easing: Animation
    
    private var screenStack = ScreensStack() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    var navigationType: NavType = .push
    
    @Published var currentScreen: Screen?
    
    init(easing: Animation) {
        self.easing = easing
    }
    
    func push<S: View>(_ screenView: S) {
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, nextScreen: AnyView(screenView))
            screenStack.push(screen)
        }
    }
    
    func pop(to: PopDestination = .previous) {
        withAnimation(easing) {
            navigationType = .pop
            switch to {
            case .root:
                screenStack.popToRoot()
            case .previous:
                screenStack.pop()
            }
        }
    }
}

struct NavControllerView<Content>: View where Content: View {
    
    @ObservedObject private var viewModel: NavViewModel
   
    
    private let content: Content
    private let transition: (push: AnyTransition, pop: AnyTransition)
    
    init(transition: NavTransiton, easing: Animation = .easeInOut(duration: 0.77), @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = NavViewModel(easing: easing)
        self.content = content()
        
        switch transition {
        case .custom(let transition):
            self.transition = (.scale, .slide)
        case .none:
            self.transition = (.opacity, .opacity)
        }
    }
    
    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                content
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            } else {
                viewModel.currentScreen!.nextScreen
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
    
}
