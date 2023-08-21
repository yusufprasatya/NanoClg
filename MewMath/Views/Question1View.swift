import SwiftUI

struct Question1View: View {
    @Environment(\.dismiss) private var dismiss
    
    private let ballSize: CGFloat = 100
    private let data = questionData
    
    @State var basketPool: [Bool] = Array(repeating: false, count: 6)
    @State var basketPos: [CGFloat] = [0, 0]
    @State var balls: [[CGFloat]] = [
        [0, 0, 0.7],
        [0, 0, 0.7],
        [0, 0, 0.7],
        [0, 0, 0.7],
        [0, 0, 0.7],
        [0, 0, 0.7],
    ]
    @State var answers = [0: "?", 1: "?", 2: "?", 3: "?"]
    @State var showAlert = false
    @State var showAlertSuccess = false
    
    @State private var redBall = ["dragable": true, "show": true]
    @State private var greenBall = ["dragable": true, "show": true]
    @State private var step = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BgQuest")
                    .resizable()
                    .ignoresSafeArea(.all)
                VStack {
                    QuestionBox(
                        questionNumber: data[0].id,
                        question: data[0].stepQuestion[step]
                    ).padding(.top, 15)
                    HStack {
                        Image("Cat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(y: -10)
                        Spacer()
                        if step >= 2 {
                            Image("CatFemale")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120)
                                .offset(y: -10)
                        }
                    }
                    .padding()
                    Spacer()
                }
                Image("basket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 260)
                    .position(x: basketPos[0], y: basketPos[1])
                VStack {
                    Spacer()
                    [0,2].contains(step) ? InfoBox() : nil
                    if step == 1 {
                        OptionsBox(
                            step: $step,
                            answer: $answers,
                            showAlert: $showAlert,
                            showAlartSuccess: $showAlertSuccess,
                            correctAnswer: "\(data[0].anwar[0])",
                            answerFor: 0,
                            opts: data[0].options[0]
                        )
                    } else if step == 3 {
                        OptionsBox(
                            step: $step,
                            answer: $answers,
                            showAlert: $showAlert,
                            showAlartSuccess: $showAlertSuccess,
                            correctAnswer: "\(data[0].anwar[1])",
                            answerFor: 2,
                            opts: data[0].options[1],
                            text: "Berapa jumlah bola wol hijau yang diberikan?"
                        )
                    } else if step == 4 {
                        OptionsBox(
                            step: $step,
                            answer: $answers,
                            showAlert: $showAlert,
                            showAlartSuccess: $showAlertSuccess,
                            correctAnswer: "\(data[0].operatorAnwar)",
                            answerFor: 1,
                            opts: data[0].options[2],
                            text: "Menurut kamu, operasi apa yang cocok untuk soal tersebut?"
                        )
                    } else if step == 5 {
                        OptionsBox(
                            step: $step,
                            answer: $answers,
                            showAlert: $showAlert,
                            showAlartSuccess: $showAlertSuccess,
                            correctAnswer: "\(data[0].anwar[2])",
                            answerFor: 3,
                            opts: data[0].options[3]
                        )
                    }
                    AnswerBox(currentBoxPos: step, answers: $answers)
                }
                GeometryReader { gr in
                    Image("Basket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 260)
                        .position(x: basketPos[0], y: basketPos[1])
                        .onAppear {
                            basketPos = [gr.size.width * 1/2, gr.size.height * 4/9]
                        }
                    if redBall["show"]! {
                        Group {
                            Image("BallFill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: ballSize * balls[0][2], height: ballSize * balls[0][2])
                                .position(x: balls[0][0], y: balls[0][1])
                                .gesture(dragGesture(ballNum: 0, dragable: redBall["dragable"]!))
                                .onAppear {
                                    balls[0] = [
                                        gr.size.width * 1/5,
                                        gr.size.height * 4/7,
                                        balls[0][2]
                                    ]
                                }
                            Image("BallFill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: ballSize * balls[1][2], height: ballSize * balls[1][2])
                                .position(x: balls[1][0], y: balls[1][1])
                                .gesture(dragGesture(ballNum: 1, dragable: redBall["dragable"]!))
                                .onAppear {
                                    balls[1] = [
                                        gr.size.width * 2/5,
                                        gr.size.height * 4/7,
                                        balls[1][2]
                                    ]
                                }
                            Image("BallFill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: ballSize * balls[2][2], height: ballSize * balls[2][2])
                                .position(x: balls[2][0], y: balls[2][1])
                                .gesture(dragGesture(ballNum: 2, dragable: redBall["dragable"]!))
                                .onAppear {
                                    balls[2] = [
                                        gr.size.width * 3/5,
                                        gr.size.height * 4/7,
                                        balls[2][2]
                                    ]
                                }
                            Image("BallFill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: ballSize * balls[3][2], height: ballSize * balls[3][2])
                                .position(x: balls[3][0], y: balls[3][1])
                                .gesture(dragGesture(ballNum: 3, dragable: redBall["dragable"]!))
                                .onAppear {
                                    balls[3] = [
                                        gr.size.width * 4/5,
                                        gr.size.height * 4/7,
                                        balls[3][2]
                                    ]
                                }
                        }
                    }
                    if step >= 2 {
                        if greenBall["show"]! {
                            Group {
                                Image("BallFillGreen")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: (ballSize - 14) * balls[4][2], height: ballSize * balls[4][2])
                                    .position(x: balls[4][0], y: balls[4][1])
                                    .gesture(dragGesture(ballNum: 4, dragable: greenBall["dragable"]!))
                                    .onAppear {
                                        balls[4] = [
                                            gr.size.width * 2/5,
                                            gr.size.height * 3/5,
                                            balls[4][2]
                                        ]
                                    }
                                Image("BallFillGreen")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: (ballSize - 14) * balls[5][2], height: ballSize * balls[5][2])
                                    .position(x: balls[5][0], y: balls[5][1])
                                    .gesture(dragGesture(ballNum: 5, dragable: greenBall["dragable"]!))
                                    .onAppear {
                                        balls[5] = [
                                            gr.size.width * 3/5,
                                            gr.size.height * 3/5,
                                            balls[5][2]
                                        ]
                                    }
                            }
                        }
                    }
                }
                VStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }, label: {
                            BtnBack()
                        })
                        Spacer()
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                if showAlert {
                    VStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color("BrokenWhite"))
                            .frame(height: 150)
                            .overlay(VStack {
                                Text("Maaf dik kamu salah, coba lagi!!!")
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 30)
                                    .fontWeight(.bold)
                                    .font(.system(size: 22))
                            })
                            .padding(.all, 100)
                    }
                }
                if showAlertSuccess {
                    SuccessfulMessage()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func dragGesture(ballNum: Int, dragable: Bool) -> some Gesture {
        return DragGesture()
            .onChanged({ val in
                let ball = [val.location.x, val.location.y, self.balls[ballNum][2]]
                self.balls[ballNum] = dragable ? ball : self.balls[ballNum]
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    self.balls[ballNum][2] = 1.0
                }
            })
            .onEnded({ val in
                self.basketPool[ballNum] = onBasket(position: self.balls[ballNum])
                
                let countBall = ballCounter(self.basketPool)
                if step == 0 && countBall == 4 {
                    step += 1
                } else if step == 2 && countBall == 6 {
                    step += 1
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
        
        print("Calcualate XOver \(basketPos[0]) Position \(position[0])")
        print("Calcualate YOver\(basketPos[1]) Position \(position[1])")

        print("XOver \(xOver) yOver \(yOver)")
        return (xOver < 130 && yOver < 54)
    }
    
    func ballCounter(_ arr: [Bool]) -> Int {
        return arr.reduce(0) { $1 ? $0 + 1 : $0 }
    }
}

struct QuestionBox: View {
    var questionNumber: Int
    var question: String
    
    var body: some View {
        ZStack {
            Image("QuestionBox")
                .resizable()
                .scaledToFit()
                .frame(height: 110)
            VStack {
                Text("Soal \(questionNumber)")
                    .font(.system(size: 14, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 1.0, green: 0.41, blue: 0.403))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 2)
                Text(question)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 320)
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
}

struct AnswerBox: View {
    var currentBoxPos: Int
    @Binding var answers: [Int: String]
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(currentBoxPos == 1 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answers[0]!)
                    .font(.system(size: 40, design: .rounded))
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(currentBoxPos == 4 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answers[1]!)
                    .font(.system(size: 40, design: .rounded))
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(currentBoxPos == 3 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answers[2]!)
                    .font(.system(size: 40, design: .rounded))
            }
            Text("=")
                .font(.system(size: 40, design: .rounded))
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(currentBoxPos == 5 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answers[3]!)
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
    }
}

struct OptionsBox: View {
    @Binding var step: Int
    @Binding var answer: [Int: String]
    @Binding var showAlert: Bool
    @Binding var showAlartSuccess: Bool
    var correctAnswer: String
    var answerFor: Int
    var opts: [String] = Array(repeating: "0", count: 4)
    var text: String = "Berapa jumlah wol yang ada dikeranjang saat ini?"
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(Color("Green"))
            .frame(height: 150)
            .overlay(VStack {
                Text(text)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                HStack {
                    ForEach(Array(opts.enumerated()), id: \.offset) { i, e in
                        Button(action: {
                            answer[answerFor] = "\(e)"
                            if e == correctAnswer {
                                showAlert = false
                                if step == 5 {
                                    showAlartSuccess = true
                                } else {
                                    step = step < 5 ? (step + 1) : step
                                }
                            } else {
                                showAlert = true
                            }
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("BrokenWhite"))
                                    .frame(width: 70, height: 60)
                                    .offset(y: 5)
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.white)
                                    .frame(width: 70, height: 60)
                                Text("\(e)")
                                    .font(.system(size: 40, design: .rounded))
                            }.padding(.horizontal, 2)
                        })
                    }
                }
            })
            .padding(.horizontal)
    }
}

struct SuccessfulMessage: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 24)
                    .strokeBorder(Color("Pink"), lineWidth: 7)
                    .background(RoundedRectangle(cornerRadius: 24).fill(Color.white))
                    .frame(height: 375)
                    .overlay(
                        VStack {
                            Text("Yeay!")
                                .foregroundColor(Color("Pink"))
                                .fontWeight(.bold)
                                .font(.system(size: 24, design: .rounded))
                                .padding(.top, 10)
                            Spacer()
                            HStack(alignment: .bottom) {
                                Image("BallFillGreen2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .offset(y: -5)
                                Image("Cat")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110)
                                Image("BallFill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .offset(y: -20)
                            }
                            Spacer()
                            Text("Kamu berhasil menjawab soal cerita tentang pertambahan")
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 30)
                                .font(.system(size: 16))
                            Spacer()
                            Spacer()
                            NavigationLink(destination: Explanation1View(), label: {
                                Text("PEMBAHASAN")
                                    .padding(.vertical, 14)
                                    .padding(.horizontal, 60)
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, design: .rounded))
                                    .fontWeight(.bold)
                                    .background(
                                        RoundedRectangle(
                                            cornerRadius: 12,
                                            style: .continuous
                                        )
                                        .fill(Color("Pink"))
                                    )
                            })
                            
                            Button {
                                dismiss()
                            } label: {
                                Text("KEMBALI")
                                    .foregroundColor(Color("Grey"))
                                    .font(.system(size: 12, design: .rounded))
                                    .fontWeight(.bold)
                            }
                            Spacer()
                        }
                            .padding(.vertical))
                
                    .padding(.horizontal, 40)
                
                Image("Medali")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .offset(x: -10, y: -40)
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        Question1View()
    }
}
