//
//  SearchViewController.swift
//  MP2_Deverett
//
//  Created by Sam Deverett on 5/28/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var selectedTypes: [String] = []
    
    var filteredPokemon: [Pokemon]!
    
    func categoryButtonPressed(button: UIButton, category: String) {
        if button.isSelected {
            button.isSelected = false
            selectedTypes.remove(at: selectedTypes.firstIndex(of: category)!)
        } else {
            selectedTypes.append(category)
            button.isSelected = true
        }
    }
    
    func filterByText() {
        let searchText = searchBar.text?.lowercased()
        filteredPokemon = filteredPokemon.filter {
            pokemon in
            
            let isMatchingSearchText = pokemon.name.lowercased().contains(searchText!.lowercased()) || searchText?.lowercased().count == 0
            let isMatchingSearchNumber = pokemon.number == Int(searchText!)
            
            return isMatchingSearchText || isMatchingSearchNumber
        }
    }
    
    func filterByType() {
        filteredPokemon = filteredPokemon.filter {
            pokemon in
            
            let intersection = pokemon.types.filter(selectedTypes.contains)
            let isMatchingType = intersection.count > 0
            
            return isMatchingType
        }
    }
    
    func filterByPoints() {
        filteredPokemon = filteredPokemon.filter {
            pokemon in
            
            let enoughAttackPoints = pokemon.attack >= Int(minAttackPtsSlider.value)
            let enoughDefensePoints = pokemon.defense >= Int(minDefensePtsSlider.value)
            let enoughHealthPoints = pokemon.health >= Int(minHealthPtsSlider.value)
            
            return enoughAttackPoints && enoughDefensePoints && enoughHealthPoints
        }
    }
    
    func getRandomTwenty() {
        let shuffledPokemon = filteredPokemon.shuffled()
        let randomTwentyPokemon = Array(shuffledPokemon.prefix(20))
        filteredPokemon = randomTwentyPokemon
    }
    
    func filterPokemon() {
        filteredPokemon = PokemonGenerator.getPokemonArray()
        filterByText()
        if selectedTypes.count > 0 {
            filterByType()
        }
        filterByPoints()
        if randomButton.isSelected {
            getRandomTwenty()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var bugButton: UIButton!
    
    @IBOutlet weak var grassButton: UIButton!
    
    @IBOutlet weak var darkButton: UIButton!
    
    @IBOutlet weak var groundButton: UIButton!
    
    @IBOutlet weak var dragonButton: UIButton!
    
    @IBOutlet weak var iceButton: UIButton!
    
    @IBOutlet weak var electricButton: UIButton!
    
    @IBOutlet weak var normalButton: UIButton!
    
    @IBOutlet weak var fairyButton: UIButton!
    
    @IBOutlet weak var poisonButton: UIButton!
    
    @IBOutlet weak var fightingButton: UIButton!
    
    @IBOutlet weak var psychicButton: UIButton!
    
    @IBOutlet weak var fireButton: UIButton!
    
    @IBOutlet weak var rockButton: UIButton!
    
    @IBOutlet weak var flyingButton: UIButton!
    
    @IBOutlet weak var steelButton: UIButton!
    
    @IBOutlet weak var ghostButton: UIButton!
    
    @IBOutlet weak var waterButton: UIButton!

    @IBOutlet weak var minAttackPtsSlider: UISlider!
    
    @IBOutlet weak var minDefensePtsSlider: UISlider!
    
    @IBOutlet weak var minHealthPtsSlider: UISlider!
    
    @IBOutlet weak var minAttackPtsLabel: UILabel!
    
    @IBOutlet weak var minDefensePtsLabel: UILabel!
    
    @IBOutlet weak var minHealthPtsLabel: UILabel!
    
    @IBOutlet weak var randomButton: UIButton!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func bugButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: bugButton, category: "Bug")
    }
    
    @IBAction func grassButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: grassButton, category: "Grass")
    }

    @IBAction func darkButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: darkButton, category: "Dark")
    }

    @IBAction func groundButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: groundButton, category: "Ground")
    }

    @IBAction func dragonButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: dragonButton, category: "Dragon")
    }

    @IBAction func iceButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: iceButton, category: "Ice")
    }

    @IBAction func electricButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: electricButton, category: "Electric")
    }

    @IBAction func normalButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: normalButton, category: "Normal")
    }

    @IBAction func fairyButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: fairyButton, category: "Fairy")
    }

    @IBAction func poisonButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: poisonButton, category: "Poison")
    }

    @IBAction func fightingButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: fightingButton, category: "Fighting")
    }

    @IBAction func psychicButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: psychicButton, category: "Psychic")
    }

    @IBAction func fireButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: fireButton, category: "Fire")
    }

    @IBAction func rockButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: rockButton, category: "Rock")
    }

    @IBAction func flyingButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: flyingButton, category: "Flying")
    }

    @IBAction func steelButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: steelButton, category: "Steel")
    }

    @IBAction func ghostButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: ghostButton, category: "Ghost")
    }

    @IBAction func waterButtonPressed(_ sender: Any) {
        categoryButtonPressed(button: waterButton, category: "Water")
    }
    
    @IBAction func minAttackPtsChanged(_ sender: UISlider) {
        let minAttackPts = Int(sender.value)
        minAttackPtsLabel.text = "\(minAttackPts)"
    }
    
    @IBAction func minDefensePtsChanged(_ sender: UISlider) {
        let minDefensePts = Int(sender.value)
        minDefensePtsLabel.text = "\(minDefensePts)"
    }
    
    @IBAction func minHealthPtsChanged(_ sender: UISlider) {
        let minHealthPts = Int(sender.value)
        minHealthPtsLabel.text = "\(minHealthPts)"
    }
    
    @IBAction func randomButtonPressed(_ sender: Any) {
        if randomButton.isSelected {
            randomButton.isSelected = false
        } else {
            randomButton.isSelected = true
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        filterPokemon()
        self.performSegue(withIdentifier: "toSearchResultsVC", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SearchResultsViewController
        destinationVC.searchedPokemon = filteredPokemon
    }

}
