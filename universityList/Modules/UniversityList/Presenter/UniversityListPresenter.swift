//
//  UniversityListPresenter.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import Foundation

protocol UniversityListPresenterProtocol {
    func viewDidLoad()
    func didSelectUniversity(at index: Int)
}

class UniversityListPresenter: UniversityListPresenterProtocol {
    private weak var view: UniversityListViewController?
    private var interactor: UniversityListInteractorInput
    private var router: UniversityListRouter
    
    private var universities: [University] = []

    init(view: UniversityListViewController, interactor: UniversityListInteractorInput, router: UniversityListRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        interactor.fetchUniversities()
    }

    func didSelectUniversity(at index: Int) {
        router.navigateToDetails(with: universities[index])
    }
    
}

// MARK: - UniversityList Interactor Output
extension UniversityListPresenter: UniversityListInteractorOutput {
    func universitiesFetched(_ universities: [University]) {
        self.universities = universities
        view?.updateUniversities(data: universities)
    }
    
    func universitiesFetchFailed(with error: Error) {
        view?.showError(error)
    }
}
