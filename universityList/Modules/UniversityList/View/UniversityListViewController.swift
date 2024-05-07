//
//  UniversityListViewController.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import UIKit
import Foundation

class UniversityListViewController: UIViewController {
    var presenter: UniversityListPresenterProtocol?
    
    private let tableView = UITableView()
    private let loadingIndicator = UIActivityIndicatorView()
    private var universities: [University] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startLoadingIndicator()
        presenter?.viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        view.addSubview(tableView)
    
        // Set the title view of the navigation item
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Universities"
        
        // Setup tableview
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.registerNib(cellType: UniversityTableCell.self)
        
        universities.removeAll()
        tableView.reloadData()

        // Setup loading indicator
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingIndicator.style = .large
    }
    
    func updateUniversities(data: [University]) {
        stopLoadingIndicator()
        self.universities = data
        
        tableView.reloadData()
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    func showError(_ error: Error) {
        let alert = UIAlertController(title: "An error occured", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func startLoadingIndicator() {
        loadingIndicator.startAnimating()
    }

    private func stopLoadingIndicator() {
        loadingIndicator.stopAnimating()
    }
}

// MARK: - Table data Source
extension UniversityListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UniversityTableCell = tableView.dequeueReusableCell(for: indexPath)
        cell.data = universities[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

// MARK: - Table delegate
extension UniversityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectUniversity(at: indexPath.row)
    }
}
