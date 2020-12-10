//
//  MyInfoView.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 10/30/20.
//

import SwiftUI

struct MyInfoView: View {
    var body: some View {
        Form {
            HStack {
                Image("avatar")
                    .resizable()
                    .frame(width: 54, height: 54)
            }
        }
    }
}

struct MyInfo_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
    }
}
