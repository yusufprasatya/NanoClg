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
    
    @State var step: Int = 1
    @State var rectanglePosition: [CGFloat] = [20, 0]
    
    var body: some View {
        NavigationStack{
            ZStack{
                GeometryReader { geo in
                    Group{
                        Color("BgSemiBlue")
                            .ignoresSafeArea()
                        
                        Image("Flower")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .position(x: geo.size.width / 1.2, y: geo.size.height / 50)
                        
                        Image("Flower")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .position(x: geo.size.width / 1.13, y: geo.size.height / 1.01)
                    }
                    
                    RoundedRectangle(cornerRadius: 45)
                        .fill(Color.white)
                        .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.95)
                        .position(x: geo.size.width / 2,
                                  y: geo.size.height / 2)
                    
                    VStack {
                        HStack {
                            Button(action: {
                                if step == 1 {
                                    dismiss()
                                }
                                if step <= 4 && step > 1{
                                    step -= 1
                                }
                            }, label: {
                                BtnBack()
                            }).padding(.horizontal,20)
                            Spacer()
                        }
                        
                        VStack {
                            PembahasanSoal()
                            
                            if step == 1 {
                                ExplanationStep1()
                            }
                            
                            if step == 2 {
                                ExplanationStep2()
                            }
                            if step == 3 {
                                ExplanationStep3()
                            }
                            
                            if step == 4{
                                ExplanationStep4()
                            }
                            Button {
                                step += 1
                                if step >= 4 {
                                    step = 4
                                }
                                print(step)
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
                                        .fill(.pink))
                            }
                            Spacer()
                        }
                    }
                }.navigationBarBackButtonHidden(true)
            }
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
                    .stroke(.pink, lineWidth: 2))
        }
    }
}

struct PembahasanSoal: View{
    var body: some View{
        Text("PEMBAHASAN1")
            .font(.system(size: 21, design: .rounded))
            .foregroundColor(Color.red)
            .fontWeight(.bold)
            .padding(.vertical, -10)
        
        HStack{
            
            Text("Si Garong mempunyai")
                .font(.system(size: 21, design: .rounded))
            + Text(" 4 buah bola wol berwarna merah").fontWeight(.bold)
                .font(.system(size: 21, design: .rounded))
            + Text(" di dalam keranjang mainannya. Kemudian Temannya datang dan").font(.system(size: 21, design: .rounded))
            + Text(" memberinya").font(.system(size: 21, design: .rounded)).foregroundColor(.pink)
            + Text(" 2 buah bola wol berwarna hijau. Berapa banyak bola wol yang dimiliki Si Garong sekarang?").font(.system(size: 21, design: .rounded))
            
        }.frame(width: 300)
            .padding(.top, 40)
            .padding(.bottom, 2)
    }
}

struct ExplanationStep1: View{
    var body: some View{
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
                    .fill(Color("SemiGray"))
                
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder( Color("PinkShadow"), lineWidth: 3)
                Text("4")
                    .font(.system(size: 25, design: .rounded))
                
            }.frame(width: 57, height: 57)
                .padding(.horizontal, 2)
            
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
    }
}

struct ExplanationStep2: View{
    var body: some View{
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
                    .fill((Color("SemiGray")))
                
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder( Color("PinkShadow"), lineWidth: 3)
                Text("2")
                    .font(.system(size: 25, design: .rounded))
                
            }.frame(width: 57, height: 57)
                .padding(.horizontal, 2)
            
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
    }
}

struct ExplanationStep3: View{
    var body: some View{
        HStack{
            Text("memberi")
                .font(.system(size: 30))
                .foregroundColor(.pink)
            
            Text("=")
                .font(.system(size: 40, design: .rounded))
                .padding(.horizontal, 30)
            Text("+")
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
                    .fill(Color("SemiGray"))
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder( Color("PinkShadow"), lineWidth: 3)
                
                Text("+")
                    .font(.system(size: 25, design: .rounded))
                
            }.frame(width: 57, height: 57)
                .padding(.horizontal, 2)
            
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
    }
}

struct ExplanationStep4: View{
    var body: some View{
        HStack{
            Text("4")
                .font(.system(size: 40, design: .rounded))
            Text("+")
                .font(.system(size: 40, design: .rounded))
            
            Text("2")
                .font(.system(size: 40, design: .rounded))
            
            Text("=")
                .font(.system(size: 40, design: .rounded))
            
            Text("?")
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
                Text("4")
                    .font(.system(size: 25, design: .rounded))
                
            }.padding(.horizontal, 2)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("SemiGray"))
                    .frame(width: 57, height: 57)
                Text("+")
                    .font(.system(size: 25, design: .rounded))
                
            }.padding(.horizontal, 2)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("SemiGray"))
                    .frame(width: 57, height: 57)
                Text("2")
                    .font(.system(size: 25, design: .rounded))
                
            }.padding(.horizontal, 2)
            
            Text("=")
                .font(.system(size: 25, design: .rounded))
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("SemiGray"))
                
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder( Color("PinkShadow"), lineWidth: 3)
                Text("6")
                    .font(.system(size: 25, design: .rounded))
                
            }
            .frame(width: 57, height: 57)
            .padding(.horizontal, 2)
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
