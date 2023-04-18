import SwiftUI

struct ContentView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        Group {
            if isActive {
                Main()
            } else {
                Splash()
                    .navigationBarBackButtonHidden(true)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isActive = true
                            }
                        }
                    }
            }
        }
        
    }
}

struct Splash: View{
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color("BgBlue").edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Image("Cloud")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 210, maxHeight: 120)
                        .offset(x: -170)
                    Image("Cloud")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 170, maxHeight: 110)
                        .offset(y: 80)
                    Image("Cloud")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 230, maxHeight: 100)
                        .offset(x: 150, y: -30)
                }.padding(.top, 40)
                Spacer()
            }
            VStack {
                Image("Title")
                    .resizable()
                    .shadow(color: Color(red: 255 / 255, green: 104 / 255, blue: 103 / 255).opacity(0.5),radius: 10)
                    .frame(width: 149, height: 26)
                    .scaleEffect(isAnimating ? 2 : 1)
                    .onAppear() {
                        withAnimation(.easeInOut(duration: 1.5))
                        {
                            isAnimating = true
                        }
                    }
            }
            VStack {
                Spacer()
                Image("Land")
                    .resizable()
                    .scaledToFit()
            }.edgesIgnoringSafeArea(.all)
        }
    }
    
}

struct Main: View{
    
    @State var rotateHead: CGFloat = 5
    
    var body: some View{
        NavigationStack() {
            ZStack {
                Color("BgBlue").edgesIgnoringSafeArea(.all)
                VStack {
                    ZStack {
                        Image("Cloud")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 210, maxHeight: 120)
                            .offset(x: -170)
                        Image("Cloud")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 170, maxHeight: 110)
                            .offset(y: 80)
                        Image("Cloud")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 230, maxHeight: 100)
                            .offset(x: 150, y: -30)
                    }.padding(.top, 40)
                    Spacer()
                }
                VStack {
                    NavigationLink(destination: MapView(), label: {
                        BtnPlay()
                    })
                }
                VStack {
                    Spacer()
                    Image("LandMain")
                        .resizable()
                        .scaledToFit()
                }.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    ZStack{
                        
                        Image("Cat-body")
                            .resizable()
                            .frame(width: 235, height: 225)
                        Image("Cat-head")
                            .resizable()
                            .frame(width: 235, height: 225)
                            .rotationEffect(.degrees(rotateHead))
                            .onAppear{
                                withAnimation(
                                    .easeInOut(duration: 1.0)
                                    .repeatForever(autoreverses: true))
                                {
                                    rotateHead = -5
                                }
                            }
                    }
                }
                VStack {
                    HStack {
                        Image("Ballon1")
                            .scaledToFit()
                            .padding(.leading, 30)
                        Spacer()
                        Image("Ballon2")
                            .scaledToFit()
                            .padding(.trailing, 35)
                    }.padding(.top, 250)
                }
            }
        }
    }
}

struct BtnPlay: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 140, height: 140)
                .foregroundColor(.white)
                .shadow(color: Color("PinkShadow").opacity(0.8),radius: 10)
            Image(systemName: "play.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .foregroundColor(Color("Pink"))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
