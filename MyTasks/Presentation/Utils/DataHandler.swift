import Foundation

class DataHandler {
    
    static func getCurrentWeek() -> [Date] {
        let date = Date()
        let calendar = Calendar.current
        var week: [Date] = []
        let weekDay = calendar.component(.weekday, from: date) - 2

        for dayt in 1...7 {
            let data = calendar.date(byAdding: .day, value: dayt-weekDay, to: date)!
//            let day = calendar.component(.day, from: data)
            week.append(data)
        }
        week.forEach { date in
            print(calendar.component(.day, from: calendar.date(byAdding: .day, value: -1, to: date)!))
        }
        return week
    }
    
    static func getCurrenDay() -> Date {
        return Date()
    }
    
    
    static func getDate() {
        let date = NSDate()
        let calendar = Calendar.current
        
    }
 
}
    
