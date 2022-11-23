//
//  CartManager.swift
//  SweaterShop
//
//  Created by Jayce Sagvold on 11/22/22.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func AddToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func RemoveFromCart(product: Product) {
        products = products.filter { $0.id != product.id}
        total -= product.price
    }
}
