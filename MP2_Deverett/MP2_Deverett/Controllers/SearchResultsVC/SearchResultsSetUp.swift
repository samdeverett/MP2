//
//  SearchResultsSetUp.swift
//  MP2_Deverett
//
//  Created by Sam Deverett on 5/29/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

func setImage(cell: SearchedPokemonCollectionViewCell, pokemon: Pokemon) {
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

extension SearchResultsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedPokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchedPokemonCell", for: indexPath) as! SearchedPokemonCollectionViewCell
        let rowNum = indexPath.row
        setImage(cell: cell, pokemon: searchedPokemon[rowNum])
        cell.pokemonName.text = searchedPokemon[rowNum].name
        cell.pokemonNumber.text = String(searchedPokemon[rowNum].number)
        return cell
    }
    
}

extension SearchResultsViewController: UICollectionViewDelegate {}
