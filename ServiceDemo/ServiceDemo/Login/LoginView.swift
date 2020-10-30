//
//  LoginView.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 10/15/20.
//

import SwiftUI
import DispatchCommon

struct LoginView: View {
    static private let backgroundColor = Color(.init(gray: 0.96, alpha: 1))
    
    @State private var phone: String = ""
    @State private var code: String = ""
    
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack(spacing: 20) {
            PageView((0...2).map {
                Image(uiImage: UIImage(imageLiteralResourceName: "login-cycle-\($0).jpg"))
                    .resizable()
                    .scaledToFit()
            })
            .frame(height: 213)
            .frame(minWidth: 0, maxWidth: .infinity)
            
            ZStack {
                HStack {
                    Image("phone")
                    Divider()
                        .frame(width: 1, height: 14)
                    TextField("请输入手机号码", text: $phone)
                        .font(.system(size: 16.0))
                        .keyboardType(.phonePad)
                }
                .padding()
                .background(
                    Capsule()
                        .fill(LoginView.backgroundColor)
                )
            }
            .padding(.horizontal)
            
            ZStack(alignment: .trailing) {
                HStack {
                    Image("password")
                    Divider()
                        .frame(width: 1, height: 14)
                    TextField("请输入验证码", text: $code)
                        .font(.system(size: 16.0))
                        .keyboardType(.numberPad)
                }
                .padding()
                .background(
                    Capsule()
                        .fill(LoginView.backgroundColor)
                )
                
                Button(action: {
                    // 请求验证码
                    
                }, label: {
                    Text("获取验证")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(8)
                })
                .background(
                    Capsule()
                        .fill(Color.black)
                )
                .padding(.trailing)
            }
            .padding(.horizontal)
            
            Button(action: {
                // 登录
                userSettings.needLogin = false
            }, label: {
                Text("登录")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
            })
            .background(
                Capsule()
                    .fill(Color.init(white: 16.0 / 255.0))
            )
            .padding(.horizontal)
            .disabled(phone.isEmpty || code.isEmpty)
            
            Spacer()
            
            HStack {
                Image(uiImage: UIImage(imageLiteralResourceName:"logo.jpg"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 84, height: 73)
                
                VStack(alignment: .leading) {
                    Text("XXX")
                        .font(.headline)
                    Text("宠物界的？？？")
                        .font(.subheadline)
                }
            }
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var isPresenting = false
    
    static var previews: some View {
        LoginView()
    }
}
