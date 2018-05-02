//
//  PlaylistsViewController.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AlamofireImage

class PlaylistsViewController: UIViewController {
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    // Dependencies
    private var viewModel: PlaylistsViewModel!
    private let disposeBag = DisposeBag()
    
    // Other
    private let numberItemPerLine:CGFloat = 3.0
    private let spaceBetweenItems:CGFloat = 8.0
    private let collectionViewLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = PlaylistsViewModel.init(userId: "5")
        setupView()
        bindModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Compute width relative to screen size
        let width = ((collectionView.frame.size.width - (spaceBetweenItems * (numberItemPerLine + 1.0))) / numberItemPerLine)
        
        // Add 30.0 for label, we could also compute a dynamic size
        collectionViewLayout.itemSize = CGSize(width: width, height: width + 30.0)
        collectionViewLayout.minimumLineSpacing = spaceBetweenItems
        collectionViewLayout.minimumInteritemSpacing = spaceBetweenItems
    }
    
    //MARK: Private
    private func setupView() {
        // Setup title
        self.title = NSLocalizedString("playlist_controller_title", comment: "Title playlist")
        
        collectionView.delegate = self
        collectionView.setCollectionViewLayout(collectionViewLayout, animated: false)
        collectionView.register(UINib.init(nibName: "PlaylistCell", bundle: nil), forCellWithReuseIdentifier: PlaylistCell.reusableIdentifier)
    }
    
    private func bindModel() {
        // Bind playlists to the collectionView
        // Use RxDatasource for more complexe layout
        viewModel.playlists.bind(to: collectionView.rx.items) { (collectionView, row, playlist) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistCell.reusableIdentifier, for: indexPath) as! PlaylistCell
            
                cell.titleLabel.text = playlist.title
                if let thumbnailURL = URL(string: playlist.thumbnail) {
                    cell.imageView.af_setImage(withURL: thumbnailURL)
                }
                else {
                    // Set placeholder if no image available
                }
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    private func showError(error: Error) {
        // Todo show error with toaster or alertView
    }
}

extension PlaylistsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        
        let detailVC = PlaylistDetailViewController()
        let detailViewModel = PlaylistDetailViewModel(playlist: viewModel.playlists.flatMap({ (playlists) -> Observable<Playlistable> in
            return Observable.from(optional: playlists[indexPath.row])
        }))
        detailVC.viewModel = detailViewModel
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
