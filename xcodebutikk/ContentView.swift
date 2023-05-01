//
//  ContentView.swift
//  xcodebutikk
//
//  Created by Magnus Holth Nysveen on 30/04/2023.
//

import SwiftUI

 

struct ContentView: View {

       

    @State private var products: [Product] = []

 

    var body: some View {

            NavigationStack{

                List (products) { product in

                    NavigationLink(destination: ProductView(product: product)) {

                        Text(product.title)

        }

    }

            .navigationTitle("Produkter")

}

            .task {

                do {

                    products = try await getProducts(urlString: "https://dummyjson.com/products")

                }

                catch {

                    print(error.localizedDescription)

                }

            }

            .refreshable {

                do {

                    products = try await getProducts(urlString: "https://dummyjson.com/products")

                }

                catch {

                    print(error.localizedDescription)

                }

            }

        }

    }

 

struct ProductView: View {

    

    var product: Product

    var body: some View {

        ZStack {  LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)

            VStack {

                Text(product.title).font(.title)

                Text(product.price, format: .currency(code: "NOK")).font(.body)

                AsyncImage(url: URL(string: product.thumbnail ?? "#")) { image in

                    image

                        .resizable()

                        .aspectRatio(contentMode: .fill)

                    

                } placeholder: {

                    Color.gray

                }

                .frame(width: 250, height: 250)

            }

            .padding()

        }

    }

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        ContentView()

    }

}
