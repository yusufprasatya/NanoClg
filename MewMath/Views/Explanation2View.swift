//
//  Explanation2View.swift
//  MewMath
//
//  Created by Muhammad Yusuf on 14/04/23.
//

import SwiftUI

struct Explanation2View: View {
    @Environment(\.dismiss) private var dismiss
    private let data = questionData
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("BgBlue")
                    .ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 45)
                    .fill(Color.white)
                    .frame(width: 352)
                
                VStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }, label: {
                            BtnBack()
                        }).padding(.horizontal,20)
                        Spacer()
                    }
                    
                    VStack {
                        Text("PEMBAHASAN1")
                            .font(.system(size: 21, design: .rounded))
                            .foregroundColor(Color.red)
                            .fontWeight(.bold)
                            .padding(.vertical, -10)
                        
                        Text(data[0].fullQuestion)
                            .font(.system(size: 21, design: .rounded))
                            .padding(.bottom, 2)
                            .frame(width: 300)
                            .padding(.top, 40)
                        
                        
                        HStack{
                            Image("BallFillGreen")
                            Image("BallFillGreen")
                            
                            Text("=")
                                .font(.system(size: 40, design: .rounded))
                                .padding(.horizontal, 30)
                            Text("2")
                                .font(.system(size: 40, design: .rounded))
                            
                        }
                        .padding(.top, 70)
                        
                        Spacer()
                        Spacer()
                        HStack{
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                   
                                    .foregroundColor(Color("SemiGray"))
                                    .frame(width: 57, height: 57)
                                Text("")
                                    .font(.system(size: 25, design: .rounded))
                                
                            }.padding(.horizontal, 2)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("SemiGray"))
                                    .frame(width: 57, height: 57)
                                Text("")
                                    .font(.system(size: 25, design: .rounded))
                                
                            }.padding(.horizontal, 2)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder( Color("PinkShadow"), lineWidth: 3)
                                    .foregroundColor(Color("SemiGray"))
                                    .frame(width: 57, height: 57)
                                Text("2")
                                    .font(.system(size: 25, design: .rounded))
                                
                            }.padding(.horizontal, 2)
                            
                            Text("=")
                                .font(.system(size: 25, design: .rounded))
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("SemiGray"))
                                    .frame(width: 57, height: 57)
                                Text("")
                                    .font(.system(size: 25, design: .rounded))
                                
                            }.padding(.horizontal, 2)
                        }
                        BtnNext()
                        BtnNextOutline()
                        Spacer()
                        
                    }
                }
            }
        }
    }
}

struct Explanation2View_Previews: PreviewProvider {
    static var previews: some View {
        Explanation2View()
    }
}
