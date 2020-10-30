//
//  OrderList.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 10/29/20.
//

import SwiftUI

struct OrderList: View {
    var dataSource: [Model]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<dataSource.count) { index in
                    NavigationLink(destination: Text("Destination")) {
                        Row(model: dataSource[index])
                    }
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
    
    struct Row: View {
        var model: Model
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .shadow(color: .init(white: 0, opacity: 0.4), radius: 3, x: 0, y: 2)
                HStack {
                    VStack {
                        HStack {
                            VStack {
                                HStack {
                                    Text(model.type.description)
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                        .padding(.leading)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "arrow.left.circle")
                                        .foregroundColor(.gray)
                                    Text(model.dateString)
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                        .padding(.trailing)
                                }
                            }
                        }
                        .padding(.top)
                        
                        HStack {
                            VStack {
                                Image(model.status.imageName)
                                    .renderingMode(.template)
                                Text(model.status.description)
                                    .font(.system(size: 12))
                            }
                            .accentColor(model.status.accentColor)
                            .padding(.horizontal)
                            
                            VStack {
                                Image("person")
                                    .renderingMode(.template)
                                Text("人员")
                                    .font(.system(size: 12))
                            }
                            .accentColor(.init(hex: 0x59A0FF))
                            .padding(.horizontal)
                        }
                        .padding(.bottom)
                    }
                    
                    Text("查看详情")
                        .font(.system(size: 14))
                        .foregroundColor(.init(hex: 0xFF8500))
                    Image(systemName: "chevron.right")
                        .padding(.trailing)
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    struct Model {
        private static let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd H:mm"
            return dateFormatter
        }()
        
        private static let shortDateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "H:mm"
            return dateFormatter
        }()
        
        var id: Int
        var type: OrderType
        var startDate: Date
        var endDate: Date
        var status: Status
        
        var dateString: String {
            var result = Model.dateFormatter.string(from: startDate)
            if Calendar.current.compare(startDate, to: endDate, toGranularity: .day) == .orderedSame {
                result += "~\(Model.shortDateFormatter.string(from: endDate))"
            } else {
                result += "~\(Model.dateFormatter.string(from: endDate))"
            }
            return result
        }
        
        enum Status: Int, CustomStringConvertible {
            case pending, ongoing, done
            
            var imageName: String {
                switch self {
                case .pending:
                    return "loudspeaker"
                case .ongoing:
                    return "doublearrow.right"
                case .done:
                    return "donemark"
                }
            }
            
            var accentColor: Color {
                switch self {
                case .pending:
                    return .init(hex: 0xECD664)
                case .ongoing:
                    return .init(hex: 0xEF0F0F)
                case .done:
                    return .init(hex: 0x2EC259)
                }
            }
            
            var description: String {
                switch self {
                case .pending:
                    return "等待接单"
                case .ongoing:
                    return "正在进行"
                case .done:
                    return "已完成"
                }
            }
        }
    }
}

struct OrderList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderList(dataSource: [
                .init(id: 0, type: .barber, startDate: .init(), endDate: .init(timeIntervalSinceNow: 60 * 60), status: .pending),
                .init(id: 1, type: .barber, startDate: .init(timeIntervalSinceNow: -60 * 60), endDate: .init(), status: .ongoing),
                .init(id: 2, type: .barber, startDate: .init(timeIntervalSinceNow: -120 * 60), endDate: .init(timeIntervalSinceNow: -60 * 60), status: .done)
            ])
            .navigationBarTitle("Navigation")
        }
    }
}
