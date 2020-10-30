//
//  DispatchView.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 10/25/20.
//

import SwiftUI

enum OrderType: Int, CaseIterable {
    case barber, walk
}
extension OrderType: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}

extension OrderType: Identifiable {
    var id: OrderType {
        return self
    }
}

extension OrderType: CustomStringConvertible {
    var description: String {
        switch self {
        case .barber:
            return "洗剪吹"
        case .walk:
            return "遛狗"
        }
    }
}

struct DispatchView: View {
    @State private var orderType: OrderType = .barber
    @Environment(\.presentationMode) private var mode: Binding<PresentationMode>
    @Binding var tabSelectedIndex: MainView.TabType
    
    var body: some View {
        VStack {
            Picker(selection: $orderType, label: Text("OrderType")) {
                ForEach(OrderType.allCases) {
                    Text($0.description)
                        .tag($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            switch orderType {
            case .barber:
                CreateBarberOrder()
            case .walk:
                CreateWalkingOrder()
            }
        }
        .navigationBarTitle("派单", displayMode: .inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    self.mode.wrappedValue.dismiss()
                                    self.tabSelectedIndex = .order
                                }, label: {
                                    Image("send")
                                })
        )
    }
}

struct DispatchView_Previews: PreviewProvider {
    @State static var tabSelectedIndex: MainView.TabType = .order
    
    static var previews: some View {
        DispatchView(tabSelectedIndex: $tabSelectedIndex)
    }
}
