//
//  PlaylistDetailViewController.swift
//  BetDeez
//
//  Created by Paul-Anatole CLAUDOT on 02/05/2018.
//  Copyright © 2018 Paul-Anatole CLAUDOT. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AlamofireImage

class PlaylistDetailViewController: UIViewController {
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerTableView: UIView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    // Dependencies
    var viewModel: PlaylistDetailViewModel!
    private let disposeBag = DisposeBag()
    
    // Other
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        bindModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Set square header view for cover
        headerTableView.frame.size.height = headerTableView.frame.size.width
    }
    
    //MARK: Private
    private func setupView() {
        
        tableView.register(UINib.init(nibName: "TrackCell", bundle: nil), forCellReuseIdentifier: TrackCell.reusableIdentifier)
    }
    
    private func bindModel() {
        // Bind tracks to the tableVIewCell
        // Use RxDatasource for more complexe layout
        viewModel.tracks.bind(to: tableView.rx.items) {
            (tableView, row, track) in
                let cell = tableView.dequeueReusableCell(withIdentifier: TrackCell.reusableIdentifier) as! TrackCell
                cell.titleAndArtistLabel.text = "\(track.title) - \(track.artistName)"
                cell.durationLabel.text = track.duration.formattedTime()
                return cell
            }
            .disposed(by: disposeBag)
        
        // Bind title
        viewModel.title.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        
        // Bind duration
        viewModel.duration.bind(to: durationLabel.rx.text).disposed(by: disposeBag)
        
        // Bind coverImageView
        // Todo implement Error subscribe
        _ = viewModel.cover.subscribe(onNext: { [weak self] (cover) in
            if let coverUrl = URL(string: cover) {
                self?.coverImageView.af_setImage(withURL: coverUrl)
            }
            else {
                // Set placeholder
            }
        })
    }
    
    private func showError(error: Error) {
        // Todo show error with toaster or alertView
    }
}

