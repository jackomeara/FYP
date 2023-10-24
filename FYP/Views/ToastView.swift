//
//  ToastView.swift
//  FYP
//
//  Created by Jack O'Meara on 23/10/2023.
//

import SwiftUI

struct ToastView: View {
    var style: ToastStyle
    var message: String
    var width = CGFloat.infinity
    var onCancelTapped: (() -> Void)
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
          Image(systemName: style.icon)
            .foregroundColor(style.themeColor)
          Text(message)
            .font(Font.caption)
            .foregroundColor(Color("toastForeground"))
          
          Spacer(minLength: 10)
          
          Button {
            onCancelTapped()
          } label: {
            Image(systemName: "xmark")
              .foregroundColor(style.themeColor)
          }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: width)
        .background(Color("toastBackground"))
        .cornerRadius(8)
        .overlay(
          RoundedRectangle(cornerRadius: 8)
            .opacity(0.6)
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    ToastView(style: ToastStyle.success, message: "Successful operation complete", onCancelTapped: <#T##(() -> Void)##(() -> Void)##() -> Void#>)
}
