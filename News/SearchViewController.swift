//
//  SearchViewController.swift
//  News
//
//  Created by Vinicius Andrade on 2022-12-20.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {
    
    @IBOutlet weak var notFoundLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = SearchViewModel()
    var query: String? = nil
    var dataSource: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Search for news"
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.viewDelegate = self
        viewModel.didLoad()
    }

}

//MARK: SearchViewDelegate
extension SearchViewController: SearchViewDelegate {
    func show(articles: [Article]) {
        dataSource = articles
        tableView.reloadData()
        tableView.isHidden = false
        notFoundLabel.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func empty() {
        tableView.isHidden = true
        notFoundLabel.isHidden = false
        notFoundLabel.text = "No results found for \(query ?? "")\nPlease search again"
        activityIndicator.stopAnimating()
    }
}


//MARK: UISearchResultsUpdating
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        query = text
        viewModel.search(query: text)
        searchController.isActive = false
        tableView.isHidden = true
        notFoundLabel.isHidden = true
        activityIndicator.startAnimating()
    }
    
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let query = query else { return nil }
        return "Showing results for: \(query)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let article = dataSource[indexPath.row]
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = article.title
        contentConfiguration.secondaryText = article.description
        cell.contentConfiguration = contentConfiguration
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

