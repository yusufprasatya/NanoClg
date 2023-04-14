import Foundation

var questionData: [Question] = [
    Question(
        id: 1,
        fullQuestion: "Si Garong mempunyai 4 buah bola wol berwarna merah di dalam keranjang mainannya. Kemudian Temannya datang dan memberinya 2 buah bola wol berwarna hijau. Berapa banyak bola wol yang dimiliki Si Garong sekarang?",
        stepQuestion: [
            "Si Garong mempunyai 4 buah bola wol berwarna merah di dalam keranjang mainannya.",
            "Si Garong mempunyai 4 buah bola wol berwarna merah di dalam keranjang mainannya.",
            "Temannya datang dan memberinya 2 buah bola wol berwarna hijau.",
            "Temannya datang dan memberinya 2 buah bola wol berwarna hijau.",
            "Temannya datang dan memberinya 2 buah bola wol berwarna hijau.",
            "Berapa banyak bola wol yang dimiliki Si Garong sekarang?",
        ],
        options: [
            ["2", "4", "6", "1"],
            ["3", "1", "9", "2"],
            ["+", "-"],
            ["6", "8", "4", "3"]
        ],
        anwar: [4, 2, 6],
        operatorAnwar: "+"
    ),
]
