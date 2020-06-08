//
//  searchedPokemonCollectionViewCell.swift
//  MP2_Deverett
//
//  Created by Sam Deverett on 5/28/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class SearchedPokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var pokemonNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
