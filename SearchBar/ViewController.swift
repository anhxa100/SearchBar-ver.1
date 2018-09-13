//
//  ViewController.swift
//  SearchBar
//
//  Created by anhxa100 on 9/6/18.
//  Copyright © 2018 anhxa100. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var data = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
//    var data = Array(1...10)
//    var data = [1,2,3,4,5,6,7,8,9,10]
    var filtered:[String] = []

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup delegate
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        filtered = data
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filtered[indexPath.row]
        return cell
    }

    //MARK: func searchBar
    func searchBar (_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = searchText.isEmpty ? data : data.filter { item in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
}

