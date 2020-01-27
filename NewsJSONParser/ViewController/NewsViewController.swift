//
//  ViewController.swift
//  NewsJSONParser
//
//  Created by suraj poudel on 27/1/20.
//  Copyright © 2020 suraj poudel. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
  private let tableView = UITableView(frame: CGRect.zero, style: .plain)
    var refreshBarButton:UIBarButtonItem!
    private let activityIndicatorView = UIActivityIndicatorView(style: .large)
    private var viewModel = NewsViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
        self.configureClosures()
         self.activityIndicatorView.startAnimating()
            self.viewModel.fetchNews {[weak self] in
                   GCD.runOnMainThread {
               self?.navigationItem.rightBarButtonItem?.isEnabled = true
                                                      self?.activityIndicatorView.stopAnimating()
                                                      print("Search Completed")
                       }
           
               }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
         }
        
    private func configureUI(){
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        tableView.register(NewsAppCell.classForCoder(), forCellReuseIdentifier: "NewsAppCell")
        tableView.addSubview(activityIndicatorView)
        refreshBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshTableView))
        refreshBarButton.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = refreshBarButton
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func configureClosures(){
        
        viewModel.showAlert = { [weak self]
                     (message) in
                   GCD.runOnMainThread {
                       self?.showAlert(message: message)
                   }
                 }
                 
                 viewModel.dataUpdated = {
                     [weak self] in
                   GCD.runOnMainThread {
                       self?.tableView.reloadData()
                   }
                 }
                 
                 viewModel.titleTextConfigured = {
                     [weak self] text in
                   GCD.runOnMainThread {
                       self?.title = text
                   }
                 }
                 
           
    }
    private func showAlert(title: String = "NewsApp", message: String?) {
              let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
              let okAction = UIAlertAction(title:NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.default) {(action) in
              }
              alertController.addAction(okAction)
              present(alertController, animated: true, completion: nil)
       }
       
        @objc func refreshTableView(){
               viewModel.newsArray = []
                 activityIndicatorView.startAnimating()
                    viewModel.fetchNews {[weak self] in
                      GCD.runOnMainThread {
                          self?.activityIndicatorView.stopAnimating()
                          print("Search Completed")
                      }
                }
                    
             }
    
    
       override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         tableView.frame = view.bounds
         activityIndicatorView.center = tableView.center
       }


}

extension NewsViewController:UITableViewDelegate,UITableViewDataSource{

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return viewModel.newsArray.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "NewsAppCell", for: indexPath) as! NewsAppCell
    let newsModel = viewModel.newsArray[indexPath.row]
    cell.model = NewsModel.init(withNews:newsModel)
      return cell
    }
}

