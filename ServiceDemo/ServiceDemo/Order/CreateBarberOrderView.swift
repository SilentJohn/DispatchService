//
//  CreateBarberOrder.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 10/25/20.
//

import SwiftUI
import DispatchCommon

enum PayMode: Int, CaseIterable, Hashable, Identifiable {
    case baseOnly, bonusOnly, mix
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
    
    var id: PayMode {
        return self
    }
}

enum OrderOption: Int, CaseIterable, Hashable, Identifiable, CustomStringConvertible {
    case cat, dog, tooth, reptile, bird
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
    
    var id: OrderOption {
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

struct CreateBarberOrder: View {
    @State var startDate: Date = .init()
    @State var endDate: Date = .init()
    @State var orderOptions: Set<OrderOption> = .init([])
    
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
                    options: OrderOption.allCases,
                    selected: $orderOptions
                ) {
                    Text(orderOptions.isEmpty ? "请选择" :"已选择:")
                }
            }
            
            Section(header: Text("付费模式（勾选后即可供接单者选择）")) {
                ForEach(PayMode.allCases) {
                    PayTypeRow($0)
                }
            }
        }
    }
    
    struct PayTypeRow: View {
        var payType: PayMode
        @State var isSelected: Bool = false
        @State var base: String = ""
        @State var bonus: String = ""
        
        init(_ type: PayMode) {
            payType = type
        }
        
        var body: some View {
            switch payType {
            case .baseOnly:
                HStack {
                    Button(action: {
                        self.isSelected.toggle()
                    }, label: {
                        Image(systemName: isSelected ? "checkmark.square" : "square")
                    })
                    Text("纯底薪模式")
                    Spacer()
                    TextField("请输入底薪", text: $base)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                    Text("元")
                }
            case .bonusOnly:
                HStack {
                    Button(action: {
                        self.isSelected.toggle()
                    }, label: {
                        Image(systemName: isSelected ? "checkmark.square" : "square")
                    })
                    Text("纯提成模式")
                    Spacer()
                    TextField("请输入提成", text: $base)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                    Text("%")
                }
            case .mix:
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            self.isSelected.toggle()
                        }, label: {
                            Image(systemName: isSelected ? "checkmark.square" : "square")
                        })
                        Text("混合模式")
                    }
                    HStack {
                        TextField("请输入底薪", text: $base)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                        Text("元")
                        Spacer()
                        TextField("请输入提成", text: $base)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                        Text("%")
                    }
                }
            }
        }
    }
}

struct CreateBarberOrderView_Previews: PreviewProvider {
    static var previews: some View {
        CreateBarberOrder()
    }
}
