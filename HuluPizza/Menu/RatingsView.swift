//
//  RatingsView.swift
//  HuluPizza
//
//  Created by Haden Olfers on 9/12/23.
//

import SwiftUI

struct RatingsView: View {
    var rating:Int
    var body: some View {
        HStack(spacing:1){
            ForEach(1...5,id: \.self){ circle in
                Image(systemName: (circle <= rating) ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView(rating: 4)
    }
}
