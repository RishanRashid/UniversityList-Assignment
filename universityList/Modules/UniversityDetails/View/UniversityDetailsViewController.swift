//
//  UniversityDetailsViewController.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import UIKit

class UniversityDetailsViewController: UIViewController {
    var presenter: UniversityDetailsPresenter?

    private var stackView: UIStackView!
    private var nameLabel: UILabel!
    private var stateProvinceStackView: UIStackView!
    private var stateProvinceLabel: UILabel!
    private var countryStackView: UIStackView!
    private var countryLabel: UILabel!
    private var alphaTwoCodeStackView: UIStackView!
    private var alphaTwoCodeLabel: UILabel!
    private var webPageStackView: UIStackView!
    private var webPageLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshData(_:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        presenter?.viewDidLoad()
    }

    private func setupStackview() {
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        // Name
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.numberOfLines = 0
        stackView.addArrangedSubview(nameLabel)

        // Spacer
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.heightAnchor.constraint(equalToConstant: 10).isActive = true
        stackView.addArrangedSubview(spacer)
        
        stateProvinceStackView = UIStackView()
        stateProvinceStackView.translatesAutoresizingMaskIntoConstraints = false
        stateProvinceStackView.axis = .horizontal
        stateProvinceStackView.distribution = .equalCentering
        stackView.addArrangedSubview(stateProvinceStackView)
        
        stateProvinceLabel = UILabel()
        stateProvinceLabel.translatesAutoresizingMaskIntoConstraints = false
        let stateTitleLabel = UILabel()
        stateTitleLabel.text = "University State"
        stateTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        stateProvinceStackView.addArrangedSubview(stateTitleLabel)
        stateProvinceStackView.addArrangedSubview(stateProvinceLabel)
        
        countryStackView = UIStackView()
        countryStackView.translatesAutoresizingMaskIntoConstraints = false
        countryStackView.axis = .horizontal
        countryStackView.distribution = .equalCentering
        stackView.addArrangedSubview(countryStackView)
        
        countryLabel = UILabel()
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        let countryTitleLabel = UILabel()
        countryTitleLabel.text = "Country"
        countryTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        countryStackView.addArrangedSubview(countryTitleLabel)
        countryStackView.addArrangedSubview(countryLabel)
        
        alphaTwoCodeStackView = UIStackView()
        alphaTwoCodeStackView.translatesAutoresizingMaskIntoConstraints = false
        alphaTwoCodeStackView.axis = .horizontal
        alphaTwoCodeStackView.distribution = .equalCentering
        stackView.addArrangedSubview(alphaTwoCodeStackView)
        
        alphaTwoCodeLabel = UILabel()
        alphaTwoCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        let alphaTwoCodeTitleLabel = UILabel()
        alphaTwoCodeTitleLabel.text = "Country Code"
        alphaTwoCodeTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        alphaTwoCodeStackView.addArrangedSubview(alphaTwoCodeTitleLabel)
        alphaTwoCodeStackView.addArrangedSubview(alphaTwoCodeLabel)
        
        webPageStackView = UIStackView()
        webPageStackView.translatesAutoresizingMaskIntoConstraints = false
        webPageStackView.axis = .horizontal
        webPageStackView.distribution = .equalCentering
        stackView.addArrangedSubview(webPageStackView)
        
        webPageLabel = UILabel()
        webPageLabel.textColor = .blue
        webPageLabel.isUserInteractionEnabled = true
        webPageLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openWebPage)))
        webPageLabel.translatesAutoresizingMaskIntoConstraints = false
        let webPageTitleLabel = UILabel()
        webPageTitleLabel.text = "Web Page"
        webPageTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        webPageStackView.addArrangedSubview(webPageTitleLabel)
        webPageStackView.addArrangedSubview(webPageLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }

    private func setupUI() {
        view.backgroundColor = .white
        
        setupStackview()
    }

    func displayUniversityDetails(_ university: University) {
        nameLabel.text = university.name
        stateProvinceLabel.text = university.stateProvince ?? "n/a"
        countryLabel.text = university.country.isEmpty ? "n/a" : university.country
        alphaTwoCodeLabel.text = university.alphaTwoCode.isEmpty ? "n/a" : university.alphaTwoCode
        webPageLabel.text = university.webPages.first ?? "n/a"
    }
    
    @objc
    private func refreshData(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func openWebPage() {
        guard let url = URL(string: webPageLabel.text ?? "") else { return }
        
        UIApplication.shared.open(url)
    }
}
