import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders: OrderModel
    @Environment(\.verticalSizeClass) var vSizeClass:UserInterfaceSizeClass?
    var body: some View {
        VStack {
            if (vSizeClass ?? .regular) != .compact {
                HStack {
                    Text("Hulu Pizza")
                    Spacer()
                }
                .font(.title).bold().foregroundStyle(.thickMaterial)
                .padding(.leading)
                .background(.linearGradient(colors: [Color("Surf"),.white.opacity(0.1)], startPoint: .leading, endPoint: .trailing), in: Capsule())
                .shadow(radius: 5)
            } else {
                HStack {
                    Image("surfBanner")
                        .resizable()
                    .scaledToFit()
                    Text("Huli Pizza Company")
                        .font(.title)
                        .bold()
                }
                
            } 
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView().environmentObject(OrderModel())
    }
}
