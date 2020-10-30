//
//  CreateBarberOrder.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 10/25/20.
//

import SwiftUI

struct OrderOptions: OptionSet {
    let rawValue: Int
    
    static let cat = OrderOptions(rawValue: 1 << 0)
    static let dog = OrderOptions(rawValue: 1 << 1)
    static let tooth = OrderOptions(rawValue: 1 << 2)
    static let reptile = OrderOptions(rawValue: 1 << 3)
    static let bird = OrderOptions(rawValue: 1 << 4)
    
    static let all: OrderOptions = [.cat, .dog, .tooth, .reptile, .bird]
}

struct CreateBarberOrderView: View {
    @State var startDate: Date = .init()
    @State var endDate: Date = .init()
    @State var orderOptions: OrderOptions = []
    
    var body: some View {
        Form {
            Section(header: Text("时间")) {
                DatePicker(selection: $startDate, in: .init()...) {
                    Text("从")
                }
                .datePickerStyle(CompactDatePickerStyle())
                
                DatePicker(selection: $endDate, in: startDate...) {
                    Text("到")
                }
                .datePickerStyle(CompactDatePickerStyle())
            }
            
            Section(header: Text("订单类型")) {
                Text("选择订单类型")
            }
        }
    }
}

struct CreateBarberOrder_Previews: PreviewProvider {
    static var previews: some View {
        CreateBarberOrderView()
    }
}
