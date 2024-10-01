// 
//  CatalogViewController.swift
//  MacroChallenge
//
//  Created by Stevans Calvin Candra on 01/10/24.
//

import UIKit
import Combine

internal class CatalogViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: CatalogViewModel!
    private var cancelables = Set<AnyCancellable>()

    // MARK: - Publisher
    private let didLoadPublisher = PassthroughSubject<Void, Never>()
    
    // MARK: - Initialization Method
    static func create(
        with viewModel: CatalogViewModel
    ) -> CatalogViewController {
        let vc = CatalogViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        bindViewModel()
    }
    
    deinit {
        cancelables.forEach { $0.cancel() }
        cancelables.removeAll()
    }

    // MARK: - Setup
    private func setupView() {

    }

    // MARK: - Bind View Model
    private func bindViewModel() {
        let input = CatalogViewModel.Input(
            didLoad: didLoadPublisher
        )

        viewModel.bind(input)
        bindViewModelOutput()
    }

    private func bindViewModelOutput() {
        viewModel.output.$result
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                guard let self else { return }

            }
            .store(in: &cancelables)
    }
}
