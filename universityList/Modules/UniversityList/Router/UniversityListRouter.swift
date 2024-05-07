//
//  UniversityListRouter.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import UIKit

protocol UniversityListRouterProtocol {
    func navigateToDetails(with data: University)
}

class UniversityListRouter: UniversityListRouterProtocol {
    private weak var viewController: UIViewController?
    
    func createModule() -> UIViewController {
        let view = UniversityListViewController()
        let interactor = UniversityListInteractor()
        let router = UniversityListRouter()
        let presenter = UniversityListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func navigateToDetails(with data: University) {
        let vc = UniversityDetailsRouter().createModule(with: data)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
