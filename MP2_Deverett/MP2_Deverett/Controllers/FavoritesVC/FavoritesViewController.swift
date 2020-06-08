//
//  FavoritesViewController.swift
//  
//
//  Created by Sam Deverett on 6/4/20.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailsViewController, let index = tableView.indexPathsForSelectedRows?.first {
            let favoritedPokemonNumber = UserDefaults.standard.array(forKey: "favoritedPokemon")![index.row]
            destinationVC.pokemon = getPokemonFromNumber(number: favoritedPokemonNumber as! Int)
        }
    }

}
