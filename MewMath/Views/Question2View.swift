import SwiftUI

struct Question2View: View {
    @Environment(\.dismiss) private var dismiss
    
    private let fishSize: CGFloat = 130
    private let data = questionData
    
    @State var basketPool: [Bool] = Array(repeating: false, count: 6)
    @State var basketPos: [CGFloat] = [195, 380]
    @State var fishs: [[CGFloat]] = [
        [75, 460, 0.7],
        [155, 460, 0.7],
        [235, 460, 0.7],
        [315, 460, 0.7],
        [150, 500, 0.7],
        [250, 500, 0.7],
    ]
    @State var answers = [0: "?", 1: "?", 2: "?", 3: "?"]
    @State var showAlert = false
    
    @State private var fishstart = ["dragable": true, "show": true]
    @State private var step = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BgQuest")
                    .resizable()
                    .ignoresSafeArea(.all)
                VStack {
                    QuestionBox(
                        questionNumber: data[1].id,
                        question: data[1].stepQuestion[step]
                    ).padding(.top, 15)
                    HStack {
                        Image("Cat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(y: -10)
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                Image("bowl")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240)
                    .position(x: basketPos[0], y: basketPos[1])
                VStack {
                    Spacer()
                    
                    [0,2].contains(step) ? InfoBox2() : nil
                    if step == 1 {
                        OptionsBox2(
                            answer2: $answers,
                            correctAnswer2: "\(data[1].anwar[0])",
                            answerFor2: 0,
                            opts: data[1].options[0],
                            text: "Berapa jumlah ikan yang ada di mangkuk?",
                            showAlert: $showAlert,
                            step: $step
                        )
                    } else if step == 3 {
                        OptionsBox2(
                            answer2: $answers,
                            correctAnswer2: "\(data[1].anwar[1])",
                            answerFor2: 2,
                            opts: data[1].options[1],
                            text: "Berapa banyak ikan yang kamu berikan ke Garong?",
                            showAlert: $showAlert,
                            step: $step
                        )
                    } else if step == 4 {
                        OptionsBox2(
                            answer2: $answers,
                            correctAnswer2: "\(data[1].operatorAnwar)",
                            answerFor2: 1,
                            opts: data[1].options[2],
                            text: "Menurut kamu, operasi apa yang cocok untuk soal tersebut?",
                            showAlert: $showAlert,
                            step: $step
                        )
                    } else if step == 5 {
                        OptionsBox2(
                            answer2: $answers,
                            correctAnswer2: "\(data[1].anwar[2])",
                            answerFor2: 3,
                            opts: data[1].options[3],
                            text: "Berapa jumlah ikan yang belum dimakan?",
                            showAlert: $showAlert,
                            step: $step
                        )
                    }
                    AnswerBox2(currentBoxPos: step, answers: $answers)
                }
                
                if fishstart["show"]! {
                    Group {
                        Image("Ikan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: fishSize * fishs[0][2], height: fishSize * fishs[0][2])
                            .position(x: fishs[0][0], y: fishs[0][1])
                            .gesture(dragGesture2(fishNum: 0, dragable: fishstart["dragable"]!))
                        Image("Ikan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: fishSize * fishs[1][2], height: fishSize * fishs[1][2])
                            .position(x: fishs[1][0], y: fishs[1][1])
                            .gesture(dragGesture2(fishNum: 1, dragable: fishstart["dragable"]!))
                        Image("Ikan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: fishSize * fishs[2][2], height: fishSize * fishs[2][2])
                            .position(x: fishs[2][0], y: fishs[2][1])
                            .gesture(dragGesture2(fishNum: 2, dragable: fishstart["dragable"]!))
                        Image("Ikan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: fishSize * fishs[3][2], height: fishSize * fishs[3][2])
                            .position(x: fishs[3][0], y: fishs[3][1])
                            .gesture(dragGesture2(fishNum: 3, dragable: fishstart["dragable"]!))
                        Image("Ikan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: fishSize * fishs[4][2], height: fishSize * fishs[4][2])
                            .position(x: fishs[4][0], y: fishs[4][1])
                            .gesture(dragGesture2(fishNum: 4, dragable: fishstart["dragable"]!))
                        Image("Ikan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: fishSize * fishs[5][2], height: fishSize * fishs[5][2])
                            .position(x: fishs[5][0], y: fishs[5][1])
                            .gesture(dragGesture2(fishNum: 5, dragable: fishstart["dragable"]!))
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
                                Text("Maaf dick kamu salah, coba lagi!!!")
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 30)
                                    .fontWeight(.bold)
                                    .font(.system(size: 22))
                            })
                            .padding(.all, 100)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func dragGesture2(fishNum: Int, dragable: Bool) -> some Gesture {
        return DragGesture()
            .onChanged({ val in
                let ball = [val.location.x, val.location.y, self.fishs[fishNum][2]]
                self.fishs[fishNum] = dragable ? ball : self.fishs[fishNum]
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    self.fishs[fishNum][2] = 1.0
                }
            })
            .onEnded({ val in
                self.basketPool[fishNum] = onBasket(position: self.fishs[fishNum])
                
                let countBall = ballCounter(self.basketPool)
                if step == 0 && countBall == 6 {
                    step += 1
                } else if step == 2 && countBall == 4 {
                    step += 1
                }
                
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    self.fishs[fishNum][2] = 0.7
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
        return (xOver < 130 && yOver < 84)
    }
    
    func ballCounter(_ arr: [Bool]) -> Int {
        return arr.reduce(0) { $1 ? $0 + 1 : $0 }
    }
}

struct Question2Box: View {
    var questionNumber2: Int
    var question2: String
    
    var body: some View {
        ZStack {
            Image("QuestionBox")
                .resizable()
                .scaledToFit()
                .frame(height: 110)
            VStack {
                Text("Soal \(questionNumber2)")
                    .font(.system(size: 12, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 2)
                Text(question2)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 320)
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
}

struct AnswerBox2: View {
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

struct InfoBox2: View {
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
                    Text("Masukkan Ikan kedalam mangkuk!")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                }
            )
            .padding(.horizontal, 30)
    }
}

struct OptionsBox2: View {
    @Binding var answer2: [Int: String]
    var correctAnswer2: String
    var answerFor2: Int
    var opts: [String] = Array(repeating: "0", count: 4)
    var text: String = "Pilih Jawaban Dibawah!"
    @Binding var showAlert: Bool
    @Binding var step: Int
    
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
                            answer2[answerFor2] = "\(e)"
                            if e == correctAnswer2 {
                                showAlert = false
                                step = step < 5 ? (step + 1) : step
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

struct Question2View_Previews: PreviewProvider {
    static var previews: some View {
        Question2View()
    }
}
