import SwiftUI

struct Question1View: View {
    @Environment(\.dismiss) private var dismiss
    
    private let ballSize: CGFloat = 100
    @State var basketPool: [Bool] = Array(repeating: false, count: 6)
    @State var basketPos: [CGFloat] = [190, 400]
    @State var balls: [[CGFloat]] = [
        [80, 500, 0.7],
        [160, 500, 0.7],
        [240, 500, 0.7],
        [320, 500, 0.7],
    ]
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image("BgQuest")
                        .resizable()
                        .frame(width: .infinity)
                        .ignoresSafeArea(.all)
                }
                VStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            BtnBack()
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                VStack {
                    Image("Basket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 260)
                        .position(x: basketPos[0], y: basketPos[1])
                }
                Group {
//                    ForEach(balls, id: \.self) { ball in
//                        Image("BallFill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: ballSize * ball[2], height: ballSize * ball[2])
//                            .position(x: ball[0], y: ball[1])
//                            .gesture(dragGesture(ballNum: 0)))
//                    }
                    Image("BallFill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: ballSize * balls[0][2], height: ballSize * balls[0][2])
                        .position(x: balls[0][0], y: balls[0][1])
                        .gesture(dragGesture(ballNum: 0))
                    Image("BallFill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: ballSize * balls[1][2], height: ballSize * balls[1][2])
                        .position(x: balls[1][0], y: balls[1][1])
                        .gesture(dragGesture(ballNum: 1))
                    Image("BallFill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: ballSize * balls[2][2], height: ballSize * balls[2][2])
                        .position(x: balls[2][0], y: balls[2][1])
                        .gesture(dragGesture(ballNum: 2))
                    Image("BallFill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: ballSize * balls[3][2], height: ballSize * balls[3][2])
                        .position(x: balls[3][0], y: balls[3][1])
                        .gesture(dragGesture(ballNum: 3))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func dragGesture(ballNum: Int) -> some Gesture {
        return DragGesture()
            .onChanged({ val in
                let ball = [val.location.x, val.location.y, self.balls[ballNum][2]]
                self.balls[ballNum] = ball
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    self.balls[ballNum][2] = 1.0
                }
            })
            .onEnded({ val in
                let ball = [val.location.x, val.location.y, self.balls[ballNum][2]]
                self.basketPool[ballNum] = onBasket(position: ball)
                let countBall = ballCounter(self.basketPool)
                
                if countBall == 4 {
                    print("Bola masuk semua")
                } else {
                    print("Bola masuk ada: \(countBall)")
                }
                
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    self.balls[ballNum][2] = 0.7
                }
            })
    }
    
    /** This function check ball potion on baskert
     * absolute of x axis of ball not over than half width of basket
     * absolute of y axis of ball not over than half height of basket
     */
    func onBasket(position: [CGFloat]) -> Bool {
        let xOver = abs(basketPos[0] - position[0])
        let yOver = abs(basketPos[1] - position[1])
        return (xOver < 130 && yOver < 54)
    }
    
    func ballCounter(_ arr: [Bool]) -> Int {
        return arr.reduce(0) { $1 ? $0 + 1 : $0 }
    }
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        Question1View()
    }
}
