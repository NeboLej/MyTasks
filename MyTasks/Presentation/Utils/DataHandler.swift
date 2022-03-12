import Foundation

class DataHandler {
    
    static func getCurrentWeek() -> [Date] {
        var week: [Date] = []
        let dateNow = Date()
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: dateNow) - 1
        
        for day in 1...7  {
            let date = calendar.date(byAdding: .day, value: day-weekDay, to: dateNow)
            var dateComponents = calendar.dateComponents([.year, .month, .day, .hour], from: date!)
            dateComponents.hour = 12
            week.append(calendar.date(from: dateComponents)!)
        }
        
        return week
    }
    
    static func getCurrentDay() -> Date {
        
        let dateNow = Date()
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.day, .month, .year, .hour], from: dateNow)
        dateComponents.hour = 12
        return calendar.date(from: dateComponents)!
    }
    
    
    static func getDates(for interval: Interval, dates: [Date]) -> [Double] {
        
        var resultDates = [Double]()
        
        let week = DataHandler.getCurrentWeek()
        for myDay in dates {
            for day in week {
                if day == myDay {
                    let calendar = Calendar.current
                    let dateComponents = calendar.dateComponents([.day, .month, .year, .hour], from: day)
                    resultDates.append(Double(dateComponents.day!))
                }
            }
        }
        
        
        return resultDates
    }
    
    
 
}
    
