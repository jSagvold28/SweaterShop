
import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    var collums = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: collums, spacing: 20) {
                    ForEach(productList, id: \.id) { Product in
                        ProductCard(product: Product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle("Sweater Shop")
            .toolbar {
                NavigationLink {
                    CartView()
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // to silence bug
        .toolbar {
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
