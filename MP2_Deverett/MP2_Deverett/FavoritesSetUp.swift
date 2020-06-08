//
//  FavoritesSetUp.swift
//  
//
//  Created by Sam Deverett on 6/4/20.
//

import UIKit

func getPokemonFromNumber(number: Int) -> Pokemon? {
    let allPokemon = PokemonGenerator.getPokemonArray()
    for pokemon in allPokemon {
        if pokemon.number == number {
            return pokemon
        }
    }
    return nil
}

func setImage(cell: FavoritesTableViewCell, pokemon: Pokemon) {
    guard let imageURL = URL(string: pokemon.imageUrl) else {
        DispatchQueue.main.async {
            cell.pokemonImage.image = UIImage(named: "questionMark")
        }
        return
    }
    DispatchQueue.global().async {
        if let imageData = try? Data(contentsOf: imageURL) {
            DispatchQueue.main.async {
                cell.pokemonImage.image = UIImage(data: imageData)
            }
        } else {
            DispatchQueue.main.async {
                cell.pokemonImage.image = UIImage(named: "questionMark")
            }
        }
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let favoritedPokemon = UserDefaults.standard.array(forKey: "favoritedPokemon") {
            return favoritedPokemon.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesTableViewCell
        let rowNum = indexPath.row
        let favoritedPokemonNumber = UserDefaults.standard.array(forKey: "favoritedPokemon")![rowNum]
        if let favoritedPokemon = getPokemonFromNumber(number: favoritedPokemonNumber as! Int) {
            setImage(cell: cell, pokemon: favoritedPokemon)
            cell.pokemonName.text = favoritedPokemon.name
        }
        return cell
    }
    
}
