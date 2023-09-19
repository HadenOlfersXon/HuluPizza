//
//  MenuItemView.swift
//  HuluPizza
//
//  Created by Haden Olfers on 9/12/23.
//

import SwiftUI

struct MenuItemView: View {
    @State private var addedItem:Bool = false
    @Binding var item: MenuItem
    @State var presentAlert:Bool = false
    @State private var newOrder:Bool = true
    @State private var order = noOrderItem
    @ObservedObject var orders:OrderModel
    var body: some View {
        VStack {
            if let image = UIImage(named: "\(item.id)_lg") {
                Image("\(item.id)_lg")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
            } else {
                Image("surfboard_lg")
            }
            VStack(alignment:.leading,spacing:5) {
                Text(item.name)
                    .bold()
                ScrollView {
                    Text(item.description)
                        .font(.footnote)
                }
            }
            Button {
                order = OrderItem(id: -999, item: item)
                presentAlert = true
            } label: {
                Spacer()
                Text(item.price,format:.currency(code: "USD")).bold()
                Image(systemName: addedItem ? "cart.fill.badge.plus": "cart.badge.plus")
                Spacer()
            }
            .disabled(item.id < 0)
            .padding()
            .background(.red,in:Capsule())
            .foregroundStyle(.white)
            .padding(5)
//            .alert("Buy a \(item.name)",isPresented: $presentAlert){
//                Button("No", role: .cancel){}
//                Button("Yes") {
//                    addedItem = true
//                    orders.addOrder(item, quantity: 1)
//                }
//                Button("Make it a double!"){
//                    addedItem = true
//                    orders.addOrder(item, quantity: 2)
//                }
//            }
            .sheet(isPresented: $presentAlert) {
                addedItem = true } content: {
                OrderDetailView(orderItem: $order,presentSheet: $presentAlert, newOrder: $newOrder)
            }
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: .constant(testMenuItem), orders: OrderModel())
    }
}
