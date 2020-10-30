//
//  CreateWalkingOrder.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 10/28/20.
//

import SwiftUI
import DispatchCommon

struct CreateWalkingOrder: View {
    @State var startDate: Date = .init()
    @State var endDate: Date = .init()
    @State var orderOptions: Set<OptionType> = .init([])
    @State var petCount: String = ""
    @State var fixedPay: String = ""
    
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
            
            Section(header: Text("订单属性")) {
                MultiSelectView(
                    options: OptionType.allCases,
                    selected: $orderOptions
                ) {
                    Text(orderOptions.isEmpty ? "请选择" :"已选择:")
                }
            }
            
            Section(header: Text("付费模式")) {
                HStack {
                    Text("宠物数量")
                    Spacer()
                    TextField("请输入数量", text: $petCount)
                        .multilineTextAlignment(.trailing)
                    Text("只")
                }
                
                HStack {
                    Text("一口价")
                    Spacer()
                    TextField("请输入价格", text: $fixedPay)
                        .multilineTextAlignment(.trailing)
                    Text("元")
                }
            }
        }
    }
    
    enum OptionType: Int, CaseIterable, Hashable, Identifiable, CustomStringConvertible {
        case cageWashing, dropIn, reptile
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue)
        }
        
        var id: OptionType {
            return self
        }
        
        var description: String {
            switch self {
            case .cageWashing:
                return "清洗笼舍"
            case .dropIn:
                return "小区上门"
            case .reptile:
                return "有爬行类"
            }
        }
    }
}

struct CreateWalkingDogOrder_Previews: PreviewProvider {
    static var previews: some View {
        CreateWalkingOrder()
    }
}
