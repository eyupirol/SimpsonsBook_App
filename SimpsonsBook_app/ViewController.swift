//
//  ViewController.swift
//  SimpsonsBook_app
//
//  Created by Eyüp Ensar Pirol on 13.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var mySimpsons = [simpsons]()
    var chosenSimpson : simpsons?

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //simpsons objects
        let homer = simpsons(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety", simpsonImage: UIImage(named: "homer")!)
        let marge = simpsons(simpsonName: "Marge Simpson", simpsonJob: "House Wife", simpsonImage: UIImage(named: "marge")!)
        let bart = simpsons(simpsonName: "Bart Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "bart")!)
        let lisa = simpsons(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "lisa")!)
        let maggie = simpsons(simpsonName: "Maggie Simpson", simpsonJob: "Babyyy!", simpsonImage: UIImage(named: "maggie")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            chosenSimpson = mySimpsons[indexPath.row]
            self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetailsVC" {
                let destinationVC = segue.destination as! detailsVC
                destinationVC.selectedSimpson = chosenSimpson
            }
        }

}

