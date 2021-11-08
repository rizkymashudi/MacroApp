//
//  DateFormatter.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 04/11/21.
//

import Foundation

class DateShortFormat {
    
    func DateToShort(_ date: String) -> String {
        
        let string = "2017-01-27T18:36:36Z"
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let date = dateFormatter.date(from: string)!
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.locale = tempLocale // reset the locale
        
        let dateString = dateFormatter.string(from: date)

        
        return  dateFormatter.string(from: date)
        
    }
    
    func DateReverse(_ date: String) -> String {
        

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        let showDate = inputFormatter.date(from: date)
        inputFormatter.dateFormat = "dd-MM-yyyyy"
        let resultString = inputFormatter.string(from: showDate!)
        
        return resultString
    }
    
}


