//
//  ViewController.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 29/01/2021.
//

import UIKit
import AlamofireImage
import JGProgressHUD


class NewsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var newsViewModel:NewsViewModel!
    private var dataSource : NewsTableViewDataSource<NewsTableViewCell,NewsResult>!
    private var tableDelegate : NewsTableViewDelegate!
    private let cellIdentifer = "NewsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        UpdateView()
    }
    private func setupTableView()
    {
        tableView.register(UINib(nibName: cellIdentifer, bundle: nil),
                           forCellReuseIdentifier: cellIdentifer)
    }
    
    private func UpdateView()
    {
        self.newsViewModel =  NewsViewModel()
        self.showLoading()
        self.newsViewModel.bindNewsViewModelToController = {
            self.updateDataSource()
        }
    }
    
    
    private func updateDataSource(){
        self.hideLoading()
        self.tableDelegate = NewsTableViewDelegate()
        self.dataSource = NewsTableViewDataSource(cellIdentifier: cellIdentifer, items: self.newsViewModel.newsData.results, configureCell: { (cell, data) in
            cell.newsTitleLabel.text = data.title
            
            if let link = data.media.first?.mediaMetadata.first?.url, let url = URL(string: link) {
                cell.newsImg.af.setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "noimage"))
            }
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
                        self.tableView.delegate = self.tableDelegate
            self.tableView.reloadData()
        }
    }
    
    
}
