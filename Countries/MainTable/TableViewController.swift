//
//  TableViewController.swift
//  Countries
//
//  Created by Артем Соловьев on 29.11.2021.
//

import UIKit
import RealmSwift

protocol ContinentDelegate: AnyObject {
    func update(numberOfContinent: Int)
}

final class TableViewController: UITableViewController {
    
    private var continents: Results<Continent>!
    private var continent = Continent()
    private var array = [Country]()
    var currectContinent: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continents = realm.objects(Continent.self)
        viewControllerToPresent.ContinentDelegate = self
        
        // Save in first downloud
        let userDefaults = UserDefaults.standard
        let appWasViewed = userDefaults.bool(forKey: "firstDownload")
        if appWasViewed == false{
            print("Save first data")
            userDefaults.set(true, forKey: "firstDownload")
            DispatchQueue.main.async {
                self.continent.saveContinent()
            }
        }
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        array = []
        print("currectContinent", currectContinent)
        continents[currectContinent].arrayOfCountry.forEach {array.append($0)}
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continents.isEmpty ? 0 : array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        cell.object = self.array[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let elementToMove = array[fromIndexPath.row]
        array.remove(at: fromIndexPath.row)
        array.insert(elementToMove, at: to.row)
    }

}

extension TableViewController: ContinentDelegate{
    
    func update(numberOfContinent: Int) {
        self.currectContinent = numberOfContinent
    }
    
}
