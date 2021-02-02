//
//  ViewController.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 29/01/2021.
//

import UIKit
import AlamofireImage
import JGProgressHUD
import RxSwift


class NewsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var newsViewModel:NewsViewModel!
    private var data_source_delegate : NewsTableViewDataSourceAndDelegate<NewsTableViewCell,NewsResult>!
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
        self.newsViewModel.bindNewsDataResults = {
            self.updateData()
        }
        self.newsViewModel.handelErrors = {
            self.hideLoading()
            self.handelError(self.newsViewModel.error, view: self)
        }
    }
    
    
    private func updateData(){
        self.hideLoading()
        self.data_source_delegate = NewsTableViewDataSourceAndDelegate(cellIdentifier: cellIdentifer, items: self.newsViewModel.newsData.results, configureCell: { (cell, data) in
            cell.item = data
        }, selectCell: { (selectedItem) in
            let newsDetailsVC = NewsDetailsViewController.create()
            newsDetailsVC.newsDetails = selectedItem
            self.navigationController?.pushViewController(newsDetailsVC, animated: true)
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.data_source_delegate
            self.tableView.delegate = self.data_source_delegate
            self.tableView.reloadData()
        }
    }
    
    override func retryBlock() {
        UpdateView()
    }
    
}
