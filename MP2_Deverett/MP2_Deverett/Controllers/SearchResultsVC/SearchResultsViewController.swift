//
//  SearchResultsViewController.swift
//  MP2_Deverett
//
//  Created by Sam Deverett on 5/28/20.
//  Copyright © 2020 Sam Deverett. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {

    var searchedPokemon: Array<Pokemon>!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 90)
        collectionView.collectionViewLayout = layout
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailsViewController, let index = collectionView.indexPathsForSelectedItems?.first {
                destinationVC.pokemon = searchedPokemon[index.row]
        }
    }
    
}
