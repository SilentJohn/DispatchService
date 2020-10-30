//
//  CreateWalkingDogOrder.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 10/28/20.
//

import SwiftUI

struct CreateWalkingOrder: View {
    @State var startDate: Date = .init()
    @State var endDate: Date = .init()
    
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
//                MultiSelectView(
//                    options: OptionType.allCases,
//                    selected: $orderOptions
//                ) {
//                    Text("已选择:")
//                }
            }
            
            Section(header: Text("付费模式")) {
                
            }
        }
    }
    
    enum OptionType: Int, CaseIterable, Hashable, Identifiable, CustomStringConvertible {
        case cat, dog, tooth, reptile, bird
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue)
        }
        
        var id: OptionType {
            return self
        }
        
        var description: String {
            switch self {
            case .cat:
                return "有猫"
            case .dog:
                return "中型犬"
            case .tooth:
                return "需要洁牙"
            case .reptile:
                return "有爬行类"
            case .bird:
                return "鸟类"
            }
        }
    }
}

struct CreateWalkingDogOrder_Previews: PreviewProvider {
    static var previews: some View {
        CreateWalkingOrder()
    }
}
