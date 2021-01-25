import Foundation
import SwiftUI


enum NavType {
    case push
    case pop
}

enum PopDestination {
    case previous
    case root
}

enum NavTransiton {
    case none
    case custom(AnyTransition)
}
