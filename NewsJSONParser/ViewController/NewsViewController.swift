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
        self.viewModel.fetchNews {[weak self] in
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
        navigationItem.rightBarButtonItem = refreshBarButton
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func configureClosures(){
           
    }

    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      tableView.frame = view.bounds
      activityIndicatorView.center = tableView.center
    }


}

extension NewsViewController:UITableViewDelegate,UITableViewDataSource{

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "NewsAppCell", for: indexPath) as! NewsAppCell
      return cell
    }
}

