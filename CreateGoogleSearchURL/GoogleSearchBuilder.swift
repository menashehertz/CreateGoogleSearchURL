//
//  GoogleSearchBuilder.swift
//  CreateGoogleSearchURL
//
//

import Foundation


// use it to convert a true or false into "y" or "n"
extension Bool {
    var ynString: String {
        return self == true ? "y" : "n"
    }
}


// define a special type to for the number of responses, use it to supply default if nil
typealias GoogleNbrResults = Int

extension Optional where Wrapped == GoogleNbrResults {
    var nbrOrDefault: Int {
        return self == nil ? 100 : self!
    }
}


struct GoogleSearchBuilder {
    
    // enum for the literals
    enum Literals {
        enum GoogleUrl {
            static var scheme = "https"
            static var path = "/search"
            static var host = "www.google."
        }
    }
    
    // enum for the google date range options
    enum DateRange: String {
        case past24Hours = "d"
        case pastWeek = "w"
        case pastMonth = "n"
        case pastYear = "y"
    }
    
    // enum for the google domain search options
    enum HostDomains: String {
        case usa = "com", uk = "co.uk", brazil = "co.br", france = "fr"
    }
    
    var url: URL?
    
    /*
     it should look like this
     https://www.google.com/search?q=pictures%20of%20landscape&num=100&as_qdr=y&newwindow=y
     scheme  host--------- path---query
     */
    
    init(searchTerm: String,
         domain: HostDomains = HostDomains.france,
         dateRange: DateRange = DateRange.pastYear,
         nbrOfResults: GoogleNbrResults? = nil,
         newWindow: Bool = true
        ) {
        
        var urlComponents = URLComponents()
        
        // set the scheme
        urlComponents.scheme = Literals.GoogleUrl.scheme
        
        // set the path
        urlComponents.path = Literals.GoogleUrl.path
        
        // set host
        urlComponents.host = Literals.GoogleUrl.host + domain.rawValue
        
        /*
         - query pieces
         - q= query text
         - num = number of results
         - as_qdr = when
         - newwindow = if it should be in a new window
         - ampersand between each part
         */
        urlComponents.query = [
            "q=\(searchTerm)",
            "num=\(nbrOfResults.nbrOrDefault)",
            "as_qdr=\(dateRange)",
            "newwindow=\(newWindow.ynString)"
            ].joined(separator: "&")
        
        if let url = urlComponents.url {
            print(url)
        }
    }
    
}
