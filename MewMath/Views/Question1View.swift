import SwiftUI

struct Question1View: View {
    @Environment(\.dismiss) private var dismiss
    
    private let ballSize: CGFloat = 100
    @State var basketPool: [Bool] = Array(repeating: false, count: 6)
    @State var basketPos: [CGFloat] = [215, 400]
    @State var balls: [[CGFloat]] = [
        [90, 500, 0.7],
        [170, 500, 0.7],
        [250, 500, 0.7],
        [330, 500, 0.7],
    ]
    @State var currentBoxPos: Int = 0
    @State var answers = [
        0: "",
        1: "",
        2: "",
        3: ""
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image("BgQuest")
                        .resizable()
                        .ignoresSafeArea(.all)
                }
                VStack {
                    QuestionBox()
                    Spacer()
                }
                Image("Cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .position(x: 90, y: 210)
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
                VStack {
                    Spacer()
                    InfoBox()
                }
                VStack {
                    Spacer()
                    AnswerBox(
                        currentBoxPos: $currentBoxPos,
                        answers: $answers
                    )
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
                UINotificationFeedbackGenerator().notificationOccurred(.success)
            })
    }
    
    /** This function check ball potion on baskert
     * absolute of x axis of ball not over than half width of basket
     * absolute of y axis of ball not over than half height of basket
     */
    func onBasket(position: [CGFloat]) -> Bool {
        let xOver = abs(basketPos[0] - position[0])
        let yOver = abs(basketPos[1] - 25 - position[1])
        return (xOver < 130 && yOver < 54)
    }
    
    func ballCounter(_ arr: [Bool]) -> Int {
        return arr.reduce(0) { $1 ? $0 + 1 : $0 }
    }
}

struct QuestionBox: View {
    var body: some View {
        ZStack {
            Image("QuestionBox")
                .resizable()
                .scaledToFit()
                .frame(height: 110)
        }.padding()
    }
}

struct AnswerBox: View {
    @Binding var currentBoxPos: Int
    @Binding var answers: [Int: String]
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(currentBoxPos == 0 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answers[0] ?? "")
                    .font(.system(size: 40, design: .rounded))
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(currentBoxPos == 1 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answers[1] ?? "")
                    .font(.system(size: 40, design: .rounded))
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(currentBoxPos == 2 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answers[2] ?? "")
                    .font(.system(size: 40, design: .rounded))
            }
            Text("=")
                .font(.system(size: 40, design: .rounded))
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(currentBoxPos == 3 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answers[3] ?? "")
                    .font(.system(size: 40, design: .rounded))
            }
        }
    }
}

struct InfoBox: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color("Green"))
            .frame(height: 50)
            .overlay(
                HStack {
                    Image("HintIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                    
                    Text("Masukkan bola kedalam keranjang!")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                }
            )
            .padding(.horizontal, 30)
            .padding(.bottom, 90)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        Question1View()
    }
}
