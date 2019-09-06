//
//  ConcertAPIHelper.swift
//  ConcertDates
//
//  Created by C4Q on 9/6/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation

class ConcertAPIHelper {
    private init () {}
    
    static let shared = ConcertAPIHelper()
    let urlStr = "https://api.seatgeek.com/2/events?type=concert&client_id=MTgyMzc4MDF8MTU2NzYxNTA4My4xMQ"
    
    func getConcerts(completionHandler: @escaping (Result<[Concert], AppError>) -> ()) {
        
        NetworkManager.shared.fetchData(urlString: urlStr) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(.badUrl))
            case .success(let data):
                do {
                    let concertInfo = try JSONDecoder().decode(ConcertWrapper.self, from: data)
                    completionHandler(.success(concertInfo.events))
                } catch {
                    completionHandler(.failure(.noDataError))
                    
                }
            }
        }
        
    }
    
}
