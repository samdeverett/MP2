//
//  DetailsViewController.swift
//  MP2_Deverett
//
//  Created by Sam Deverett on 6/1/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var webSearchButton: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var pokemonNumberLabel: UILabel!
    
    @IBOutlet weak var pokemonAttackLabel: UILabel!
    
    @IBOutlet weak var pokemonDefenseLabel: UILabel!
    
    @IBOutlet weak var pokemonHealthLabel: UILabel!
    
    @IBOutlet weak var pokemonSpecialAttackLabel: UILabel!
    
    @IBOutlet weak var pokemonSpecialDefenseLabel: UILabel!
    
    @IBOutlet weak var pokemonSpeciesLabel: UILabel!
    
    @IBOutlet weak var pokemonSpeedLabel: UILabel!
    
    @IBOutlet weak var pokemonTotalLabel: UILabel!
    
    @IBOutlet weak var pokemonTypesLabel: UILabel!
    
    @IBAction func webSearchButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://google.com/search?q=" + pokemon.name) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        if var favoritedPokemon = UserDefaults.standard.array(forKey: "favoritedPokemon") as? [Int] {
            if favoritedPokemon.contains(pokemon.number) {
                favoriteButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
                let pokemonIndex = favoritedPokemon.firstIndex(of: pokemon.number)!
                favoritedPokemon.remove(at: pokemonIndex)
                UserDefaults.standard.set(favoritedPokemon, forKey: "favoritedPokemon")
            } else {
                    favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
                    favoritedPokemon.append(pokemon.number)
                    UserDefaults.standard.set(favoritedPokemon, forKey: "favoritedPokemon")
            }
        } else {
            let favoritedPokemon = [pokemon.number]
            UserDefaults.standard.set(favoritedPokemon, forKey: "favoritedPokemon")
        }
    }
    
    func setImage(pokemon: Pokemon) {
        guard let imageURL = URL(string: pokemon.imageUrl) else { return }
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    self.pokemonImage.image = UIImage(data: imageData)
                }
            } else {
                DispatchQueue.main.async {
                    self.pokemonImage.image = UIImage(named: "questionMark")
                }
            }
        }
    }
    
    func setTypes(pokemon: Pokemon) {
        let types = pokemon.types
        let typesText = types.joined(separator: ", ")
        self.pokemonTypesLabel.text = typesText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage(pokemon: pokemon)
        pokemonNameLabel.text = pokemon.name
        pokemonNumberLabel.text = String(pokemon.number)
        pokemonAttackLabel.text = String(pokemon.attack)
        pokemonDefenseLabel.text = String(pokemon.defense)
        pokemonHealthLabel.text = String(pokemon.health)
        pokemonSpecialAttackLabel.text = String(pokemon.specialAttack)
        pokemonSpecialDefenseLabel.text = String(pokemon.specialDefense)
        pokemonSpeciesLabel.text = pokemon.species
        pokemonSpeedLabel.text = String(pokemon.speed)
        pokemonTotalLabel.text = String(pokemon.total)
        setTypes(pokemon: pokemon)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let favoritedPokemon = UserDefaults.standard.array(forKey: "favoritedPokemon") as? [Int] {
            if favoritedPokemon.contains(pokemon.number) {
                favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
            } else {
                favoriteButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
            }
        }
    }

}
