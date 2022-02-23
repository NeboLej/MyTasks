import Foundation

class DataHandler {
    
//    static func getCurrentWeek() -> [Date] {
//        let date = Date()
//        let calendar = Calendar.current
//        var week: [Date] = []
//        let weekDay = calendar.component(.weekday, from: date) - 2
//
//        for dayt in 1...7 {
//            let data = calendar.date(byAdding: .day, value: dayt-weekDay, to: date)!
//            week.append(data)
//        }
//        return week
//    }
    

    
    static func getCurrentWeek() -> [Date] {
        var week: [Date] = []
        let dateNow = Date()
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: dateNow) - 1
        
        for day in 1...7  {
            let date = calendar.date(byAdding: .day, value: day-weekDay, to: dateNow)
            let dateComponents = calendar.dateComponents([.year, .month, .day, .hour], from: date!)
            week.append(calendar.date(from: dateComponents)!)
        }
        
        return week
    }
    
    static func getCurrentDay() -> Date {
        
        let dateNow = Date()
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.day, .month, .year, .hour], from: dateNow)
        return calendar.date(from: dateComponents)!
    }
    
    
 
}
    
