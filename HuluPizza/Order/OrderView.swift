import SwiftUI

struct OrderView: View {
    @ObservedObject var orders: OrderModel
    var body: some View {
        VStack {
            //            HStack {
            //                HStack {
            //                    Text("Order Pizza")
            //                        .font(.title3)
            //                        .foregroundColor(Color.white)
            //                        .bold()
            //                    Spacer()
            //                }
            //            }.padding().background(Color("Surf")).cornerRadius(20)
            
            NavigationStack {
                List {
                    ForEach($orders.orderItems){ $order in
                        //Text(order.item.name)
                        NavigationLink(value:order){
                            OrderRowView(order:$order)
                                .padding(4)
                                .background(in:RoundedRectangle(cornerRadius: 20))
                            //.shadow(radius: 10)
                                .padding(.bottom, 5)
                                .padding([.leading,.trailing],7)
                        }.navigationDestination(for:OrderItem.self) {
                            order in OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                        }.navigationTitle("Your Order")
                    }
                    .onDelete { indexSet in
                        orders.orderItems.remove(atOffsets: indexSet)
                    }
                    .onMove { source, destination in
                        orders.orderItems.move(fromOffsets: source, toOffset: destination)
                    }
                }
            }
//            .padding(.top,70).background(.regularMaterial).cornerRadius(15)
//            Button("Delete Order"){
//                if !orders.orderItems.isEmpty{orders.removeLast()}
//            }
//            .padding(15).background(Color("Surf"),in: Capsule()).padding(7).foregroundColor(.white)
        }//.background(.thickMaterial).cornerRadius(15)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: OrderModel())
    }
}
