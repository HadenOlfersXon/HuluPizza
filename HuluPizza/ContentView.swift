import SwiftUI

struct ContentView: View {
    var menu:[MenuItem]
    @StateObject var orders:OrderModel = OrderModel() 
    @State private var showOrders:Bool = false
    @State private var selectedItem:MenuItem = noMenuItem
    @State private var presentGrid:Bool = false
    var body: some View {
        TabView { 
            VStack {
                HeaderView()
                //.environment(\.colorScheme, .light)
                StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)
                MenuItemView(item:$selectedItem, orders: orders)
                    .padding(5)
                    .background(.thickMaterial, in: RoundedRectangle(cornerRadius:10))
                    .shadow(radius: 5)
                if presentGrid {
                    MenuGridView(menu: menu, selectedItem: $selectedItem)
                } else {
                    MenuView(menu:menu, selectedItem: $selectedItem)
                }
//                MenuView2(menu: menu)
            }.tabItem(){
                Label("Menu", systemImage: "list.bullet")
            }
            VStack {
                HeaderView()
                //.environment(\.colorScheme, .light)
                StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)
                //            if showOrders {
                OrderView(orders: orders)
            }.tabItem{
                Label("Order", systemImage: "cart")
            }
        }.padding([.leading,.trailing],15).environmentObject(orders)//.background(.linearGradient(colors: [Color("Surf"),.cyan,.gray], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menu: MenuModel().menu)
    }
}
