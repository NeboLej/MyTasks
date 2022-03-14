import UIKit

class TaskModel: Codable {
    var name: String
    @CodableColor var color: UIColor
    var discription: String
    var periodicity: Int
    var dates: [Date] = []
    var isActive = true
    
    init(name: String, color: UIColor, discription: String, periodicity: Int) {
        self.name = name
        self.color = color
        self.discription = discription
        self.periodicity = periodicity
    }
}

@propertyWrapper
struct CodableColor {
    var wrappedValue: UIColor
}

extension CodableColor: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let data = try container.decode(Data.self)
        guard let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid color")
        }
        wrappedValue = color
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let data = try NSKeyedArchiver.archivedData(withRootObject: wrappedValue, requiringSecureCoding: true)
        try container.encode(data)
    }
    
}
