//
//  MenuRowView.swift
//  HuluPizza
//
//  Created by Haden Olfers on 9/12/23.
//

import SwiftUI

struct MenuRowView: View {
    var item:MenuItem
    var body: some View {
        HStack {
            if let image = UIImage(named: "\(item.id)_sm") {
                Image("\(item.id)_sm")
                    .resizable()
                    .frame(width: 100,height: 75)
                    .cornerRadius(2.5)
            } else {
                Rectangle()
                    .frame(width: 100,height: 100)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
            }
            VStack(alignment: .leading,spacing:5) {
                HStack {
                    Text(item.name)
                        .bold()
                    Spacer()
                    Text(item.price, format: .currency(code: "USD"))
                }
                RatingsView(rating: item.rating).font(.footnote)
            }.padding(5)
            Spacer()
        }
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(item: testMenuItem)
    }
}
