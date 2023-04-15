//
//  Explanation2.swift
//  MewMath
//
//  Created by Muhammad Yusuf on 15/04/23.
//

import SwiftUI

struct Explanation2View: View {
    @Environment(\.dismiss) private var dismiss
    private let data = questionData
    private let fishSize: CGFloat = 130
    
    @State var step: Int = 1
    
    var fishs: [[CGFloat]] = [
        [75, 460, 0.7],
        [155, 460, 0.7],
        [235, 460, 0.7],
        [315, 460, 0.7],
        [150, 500, 0.7],
        [250, 500, 0.7],
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                    GeometryReader { geo in
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
                        PembahasanSoal2()
                        
                        if step == 1 {
                            HStack{
                                VStack{
                                    Image("Ikan")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: fishSize * fishs[0][2], height: fishSize * fishs[3][2])
                                    Image("Ikan")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: fishSize * fishs[0][2], height: fishSize * fishs[3][2])
                                    Image("Ikan")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: fishSize * fishs[0][2], height: fishSize * fishs[3][2])
                                }
                                VStack{
                                    Image("Ikan")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: fishSize * fishs[0][2], height: fishSize * fishs[3][2])
                                    Image("Ikan")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: fishSize * fishs[0][2], height: fishSize * fishs[3][2])
                                    Image("Ikan")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: fishSize * fishs[0][2], height: fishSize * fishs[3][2])
                                }
                                
                                Text("=")
                                    .font(.system(size: 40, design: .rounded))
                                    .padding(.horizontal, 30)
                                Text("6")
                                    .font(.system(size: 50, design: .rounded))
                                
                            }
                            
                            Spacer()
                            
                            HStack{
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color("SemiGray"))
                                    RoundedRectangle(cornerRadius: 15)
                                        .strokeBorder( Color("PinkShadow"), lineWidth: 3)
                                    Text("6")
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
                        if step == 2 {
                            HStack{
                                HStack {
                                    Image("Cat")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 120)
                                    VStack{
                                        Image("fishbone")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80)
                                        Image("fishbone")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80)
                                    }
                                    
                                }
                                
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
                                        .fill(Color("SemiGray"))
                                    RoundedRectangle(cornerRadius: 15)
                                        .strokeBorder( Color("PinkShadow"), lineWidth: 3)
                                    Text("2")
                                        .font(.system(size: 25, design: .rounded))
                                    
                                }
                                .frame(width: 57, height: 57)
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
                        if step == 3 {
                            HStack{
                                Text("memakan")
                                    .font(.system(size: 20))
                                    .foregroundColor(.pink)
                                
                                Text("=")
                                    .font(.system(size: 40, design: .rounded))
                                    .padding(.horizontal, 30)
                                Text("-")
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
                                    Text("-")
                                        .font(.system(size: 25, design: .rounded))
                                    
                                }
                                .frame(width: 57, height: 57)
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
                        
                        if step == 4{
                            HStack{
                                Text("6")
                                    .font(.system(size: 40, design: .rounded))
                                Text("-")
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
                                    Text("6")
                                        .font(.system(size: 25, design: .rounded))
                                    
                                }.padding(.horizontal, 2)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(Color("SemiGray"))
                                        .frame(width: 57, height: 57)
                                    Text("-")
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
                                    Text("4")
                                        .font(.system(size: 25, design: .rounded))
                                }.frame(width: 57, height: 57)
                                    .padding(.horizontal, 2)
                            }
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
                                    .fill(.pink)
                                )
                        }
                        Spacer()
                    }
                }
            }.navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct PembahasanSoal2: View{
    var body: some View{
        Text("PEMBAHASAN2")
            .font(.system(size: 21, design: .rounded))
            .foregroundColor(Color.red)
            .fontWeight(.bold)
            .padding(.vertical, -10)
        HStack{
            Text("Si Garong ").font(.system(size: 21, design: .rounded))
            + Text("mempunyai 6 potong ikan").font(.system(size: 21, design: .rounded)).fontWeight(.bold)
            + Text(" di mangkuk makanannya. Kemudian Garong").font(.system(size: 21, design: .rounded))
            + Text(" memakan 2 potong ikan. ").font(.system(size: 21, design: .rounded)).foregroundColor(.pink)
            + Text("Berapa banyak potong ikan yang tersisa?").font(.system(size: 21, design: .rounded))
        }.frame(width: 300)
            .padding(.bottom,30)
            .padding(.top, 40)
    }
}

struct Explanation2_Previews: PreviewProvider {
    static var previews: some View {
        Explanation2View()
    }
}
