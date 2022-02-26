import Foundation

class HomeVM {
    
    lazy var taskList: [TaskModel] = [
        .init(name: "Читать", color: .systemRed, discription: "", periodicity: 7, dates: testDate()),
        .init(name: "Фыр-Фыр", color: .systemTeal, discription: "", periodicity: 1, dates: []),
        .init(name: "Бегать по утрам", color: .systemYellow, discription: "", periodicity: 2, dates: []),
//        .init(name: "Читать", color: .systemPink, periodicity: 3, dates: []),
//        .init(name: "Фыр-Фыр", color: .systemGreen, periodicity: 1, dates: testDate()),
//        .init(name: "Бегать по утрам", color: .systemPink, periodicity: 2, dates: []),
//        .init(name: "Читать", color: .systemBlue, periodicity: 3, dates: []),
//        .init(name: "Фыр-Фыр", color: .systemTeal, periodicity: 1, dates: []),
//        .init(name: "Бегать по утрам", color: .systemIndigo, periodicity: 2, dates: [])
    ]
    
    private func testDate() -> [Date] {
        var week: [Date] = []
        let dateNow = Date()
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: dateNow) - 1
        
        for day in 1...3  {
            let date = calendar.date(byAdding: .day, value: day-weekDay, to: dateNow)
            var dateComponents = calendar.dateComponents([.year, .month, .day, .hour], from: date!)
            dateComponents.hour = 12
            week.append(calendar.date(from: dateComponents)!)
        }
        
        return week
    }
}
