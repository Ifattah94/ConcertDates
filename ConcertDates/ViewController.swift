//
//  ViewController.swift
//  ConcertDates
//
//  Created by C4Q on 9/6/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
    

    @IBOutlet weak var concertTableView: UITableView!
    
    var concerts = [Concert]() {
        didSet {
            concertTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func loadData() {
        ConcertAPIHelper.shared.getConcerts { (result) in
            DispatchQueue.main.async {
                
                
                switch result {
                case .success(let concertsFromOnline):
                    self.concerts = concertsFromOnline
                case .failure(let error) :
                    print(error)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concerts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = concertTableView.dequeueReusableCell(withIdentifier: "concertCell", for: indexPath)
        let concert = concerts[indexPath.row]
        cell.textLabel?.text = concert.title
        cell.detailTextLabel?.text = concert.dateTimeLocal
        return cell
    }

}

