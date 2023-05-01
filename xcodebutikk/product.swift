//
//  Product.swift
//  xcodebutikk
//
//  Created by Magnus Holth Nysveen on 30/04/2023.
//

import Foundation

 

struct Product: Codable, Identifiable{

    var id: Int

    var title: String

    var price: Double

    var thumbnail: String?

}

 

struct Products: Codable {

    var products: [Product]

}

 

func getProducts(urlString: String) async throws -> [Product] {

    let url = URL(string: urlString)!

    let urlrequest = URLRequest(url: url)

    

    let (data, _) = try await URLSession.shared.data(for: urlrequest)

    let svar = try JSONDecoder().decode(Products.self, from: data)

    return svar.products

}
