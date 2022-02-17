import Foundation

class DataHandler {
    
    static func getCurrentWeek() -> [Int] {
        let date = Date()
        let calendar = Calendar.current
        var week: [Int] = []
        let weekDay = calendar.component(.weekday, from: date) - 1

        for dayt in 1...7 {
            let data = calendar.date(byAdding: .day, value: dayt-weekDay, to: date)!
            let day = calendar.component(.day, from: data)
            week.append(day)
        }
        print(week)
        return week
    }
    
    static func getCurrenDay() -> Int {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(.day, from: date)
    }
 
}
    
