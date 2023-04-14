import Foundation

struct Question: Hashable, Codable, Identifiable {
    var id: Int
    var fullQuestion: String
    var stepQuestion: [String]
    var options: [[String]]
    var anwar: [Int]
    var operatorAnwar: String
}
