//
//  OrderDetail.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 10/31/20.
//

import SwiftUI
import MapKit

struct OrderDetail: View {
    var order: Order
    
    var body: some View {
        ScrollView {
            VStack {
                Text(order.type.description)
                    .font(.title)
                    .padding(.vertical)
                
                VStack(alignment: .leading) {
                Text("店面位置")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                Spacer()
                    
                Text(order.site)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                }
            }
        }
        .navigationBarTitle("订单详情", displayMode: .inline)
    }
    
    struct Order {
        var type: OrderType
        var site: String
        var time: Date
        var duration: TimeInterval
        var content: [OrderOption]
        var mode: [PayMode]
    }
}

struct OrderDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderDetail(order: .init(type: .barber, site: "上海徐汇区虹漕路999号佳佳宠物美容中心", time: .init(), duration: 2 * 60 * 60, content: [.cat, .dog, .tooth], mode: [.baseOnly, .bonusOnly]))
        }
    }
}
