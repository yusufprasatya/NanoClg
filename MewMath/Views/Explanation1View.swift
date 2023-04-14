//
//  Explanation1View.swift
//  MewMath
//
//  Created by Muhammad Yusuf on 14/04/23.
//

import SwiftUI

struct Explanation1View: View {
    @Environment(\.dismiss) private var dismiss
    private let data = questionData
    var isNabigate: Bool = false
    @State var step: Int = 0
    
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
                            VStack{
                                HStack{
                                    Image("BallFill")
                                    Image("BallFill")
                                }
                                HStack{
                                    Image("BallFill")
                                    Image("BallFill")
                                }
                            }
                            Text("=")
                                .font(.system(size: 40, design: .rounded))
                                .padding(.horizontal, 30)
                            Text("4")
                                .font(.system(size: 40, design: .rounded))
                            
                        }
                        .padding(.top, 70)
                        
                        Spacer()
                        Spacer()
                        HStack{
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder( Color("PinkShadow"), lineWidth: 3)
                                    .foregroundColor(Color("SemiGray"))
                                    .frame(width: 57, height: 57)
                                Text("4")
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
                                    .foregroundColor(Color("SemiGray"))
                                    .frame(width: 57, height: 57)
                                Text("")
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

struct BtnNext: View {
    var body: some View {
        Button {
            
            print("Di klik nihh...")
        } label: {
            Text("LANJUT")
                .font(.system(size: 12, design: .rounded))
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.white)
                .frame(width: 300)
                .background(

                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .continuous
                    )
                    .fill(.pink)

                )
        }
    }
}

struct BtnNextOutline: View {
    var body: some View {
        Button {
                        
        } label: {
            Text("REPLAY")
                .font(.system(size: 12, design: .rounded))
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.pink)
                .frame(width: 300)
                .background(
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .continuous
                    )
                    .stroke(.pink, lineWidth: 2)

                )
        }
    }
}


//source: https://stackoverflow.com/questions/60104922/swiftui-text-justified-alignment
struct LabelAlignment: UIViewRepresentable {
    var text: String
    var textAlignmentStyle : TextAlignmentStyle
    var width: CGFloat
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.textAlignment = NSTextAlignment(rawValue: textAlignmentStyle.rawValue)!
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = width
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .vertical)
        
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
}

enum TextAlignmentStyle : Int{
    case left = 0 ,center = 1 , right = 2 ,justified = 3 ,natural = 4
}


struct Explanation1View_Previews: PreviewProvider {
    static var previews: some View {
        Explanation1View()
    }
}
