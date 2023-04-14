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
    Question(
        id: 2,
        fullQuestion: "Si Garong mempunyai 6 potong ikan di mangkuk makanannya. Kemudian Garong memakan 2 potong ikan. Berapa banyak potong ikan yang tersisa?",
        stepQuestion: [
            "Si Garong mempunyai 6 potong ikan di mangkuk makanannya.",
            "Si Garong mempunyai 6 potong ikan di mangkuk makanannya.",
            "Kemudian Garong memakan 2 potong ikan.",
            "Kemudian Garong memakan 2 potong ikan.",
            "Kemudian Garong memakan 2 potong ikan.",
            "Berapa banyak potong ikan yang tersisa?",
        ],
        options: [
            ["6", "4", "7", "2"],
            ["5", "4", "2", "3"],
            ["+", "-"],
            ["6", "8", "4", "2"]
        ],
        anwar: [6, 2, 4],
        operatorAnwar: "-"
    )
]
