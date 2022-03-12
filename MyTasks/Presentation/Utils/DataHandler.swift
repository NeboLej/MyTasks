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
    
    static func getCurrentMount() -> [Date] {
        var month: [Date] = []
        let dateNow = Date()
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour], from: dateNow)
        
        //end date mount
        dateComponents.day = 1
        dateComponents.hour = 12
        let monthStartDate = calendar.date(from: dateComponents)!

        dateComponents.month! += 1
        dateComponents.day! -= 1
        let monthEndDate = calendar.date(from: dateComponents)!
        let dc = calendar.dateComponents([.year, .month, .day, .hour], from: monthEndDate)
        
        for i in 0...dc.day!-1 {
            month.append(calendar.date(byAdding: .day, value: i, to: monthStartDate)!)
        }
        return month
    }
    
    static func getCurrentYaer() -> [Date] {
        var year: [Date] = []
        let dateNow = Date()
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour], from: dateNow)
        
        //end date mount
        dateComponents.day = 1
        dateComponents.month = 1
        dateComponents.hour = 12
        let yearStartDate = calendar.date(from: dateComponents)!


        dateComponents.month! += 2
        dateComponents.day! -= 1
        let yearFebruaryDate = calendar.date(from: dateComponents)!
        let dc = calendar.dateComponents([.year, .month, .day, .hour], from: yearFebruaryDate)
        
        var daysCount = 0
        if dc.day == 28 {
            daysCount = 365
        } else {
            daysCount = 366
        }
                
        for i in 0...daysCount-1 {
            year.append(calendar.date(byAdding: .day, value: i, to: yearStartDate)!)
        }
        return year
    }
    
    
//    // MARK: - Common date analysis
//
//    public func monthDateRange(_ date: Foundation.Date) -> (countOfWeeks: NSInteger,
//        monthStartDate: Foundation.Date, monthEndDate: Foundation.Date) {
//            var calendar = self.calendarView.delegate?.calendar?() ?? Calendar.current
//            calendar.firstWeekday = starterWeekday
//
//            let units = (yearUnit.union(monthUnit).union(weekUnit))
//            var components = (calendar as NSCalendar).components(units, from: date)
//
//            // Start of the month.
//            components.day = 1
//            let monthStartDate = calendar.date(from: components)!
//
//            // End of the month.
//            components.month! += 1
//            components.day! -= 1
//            let monthEndDate = calendar.date(from: components)!
//
//            // Range of the month.
//            let range = (calendar as NSCalendar).range(of: weekUnit, in: monthUnit, for: date)
//            let countOfWeeks = range.length
//
//            return (countOfWeeks, monthStartDate, monthEndDate)
//    }
    
    
    
    
//    static func getDates(for interval: Interval, dates: [Date]) -> [Double] {
//
//        var resultDates = [Double]()
//
//        let week = DataHandler.getCurrentWeek()
//        for myDay in dates {
//            for day in week {
//                if day == myDay {
//                    let calendar = Calendar.current
//                    let dateComponents = calendar.dateComponents([.day, .month, .year, .hour], from: day)
//                    resultDates.append(Double(dateComponents.day!))
//                }
//            }
//        }
//
//
//        return resultDates
//    }
    
    
 
}
    
