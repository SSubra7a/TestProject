//
//  ContentView.swift
//  DemoProject
//
//  Created by Subrata Sutradhar on 2/7/23.
//

import SwiftUI

extension Color {
    static var appBackground: Color = Color(red: 0.5, green: 1, blue: 0.2)
}

struct ContentView: View {
    var body: some View {
        
        VStack{
            Text("Demo view ")
                .font(.largeTitle)
                .foregroundColor(.appBackground)
                .padding()
                .background(Color.blue)
                .cornerRadius(60)
                .padding()
            
            Spacer()
            List {
                Text("a")
                Text("b")
                Text("cccc")
            }
//            ScrollView {
//                ForEach(1..<10) {_ in
//                    Circle()
//                        .fill(.cyan)
//                        .frame(width: 300)
//                }
//
//            }
                
            Spacer()
            
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
                Spacer()
                
                Text("Hello, world!")
            }
            .padding()
        }
        
    }
}

struct Product: Hashable, Identifiable {
    var title : String
    var type : ScreenType
    var id: String { title }
}

struct ProductView : View {
    var product : Product
    var body: some View{
        
        Image(systemName: "flame.fill")
        Text(product.title)
        
    }
}

enum ScreenType: Hashable {
    case monitor
    case laptop
}

struct ShopContainerView: View {
    @State private var path = NavigationPath()
    
    @State private var products: [Product] = [
        Product(title: "Monitor", type: .monitor),
        Product(title: "Laptop", type: .laptop)
    ]
    

    var body: some View {
        NavigationStack(path: $path) {
            List(products) { product in
                NavigationLink(product.title, value: product.type)
            }
            .navigationDestination(for: ScreenType.self) { screen in
                switch screen {
                case .monitor:
                    Text("Monitor View")
                default:
                    ProductView(product: Product(title: "b", type: .monitor))
                        
                }
            }
        }
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
////        ContentView()
//        
//    }
//}
