import SwiftUI

struct ContentView: View {
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
                BtnPlay()
            }
            VStack {
                Spacer()
                Image("Land")
            }.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("Cat")
                    .scaledToFit()
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

struct BtnPlay: View {
    var body: some View {
        ZStack {
            //            Circle()
            //                .fill(Color("Orange"))
            //                .frame(width: 140)
            //                .shadow(color: Color("OrangeShadow").opacity(0.8),radius: 10)
            //            Image(systemName: "play.fill")
            //                .resizable()
            //                .scaledToFill()
            //                .frame(width: 50, height: 50)
            //                .foregroundColor(.white)
            
            Circle()
                .frame(width: 140, height: 140)
                .foregroundColor(.white)
                .shadow(color: Color("OrangeShadow").opacity(0.8),radius: 10)
            Image(systemName: "play.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .foregroundColor(Color("Orange"))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
