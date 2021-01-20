// кажется это лишняя вью

//import SwiftUI
//
//struct HeroesView: View {
//    @ObservedObject private var viewModel = HeroesViewModel()
//    
//    var body: some View {
//        VStack {
//            ForEach(viewModel.heroes, id: \.name) {
//                item in
//                Text(item.name)
//            }
//        }
//    }
//}
//
////Добавляем врапер @ObservedObject чтобы отлавливать все изменения объекта viewModel. Вот тут List(viewModel.heroes) { movie in мы пробегаем по всему списку с героями. Позже, этот список будет сам престраиваться, при получении данных по сети.
//
//struct HeroesView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeroesView()
//    }
//}
