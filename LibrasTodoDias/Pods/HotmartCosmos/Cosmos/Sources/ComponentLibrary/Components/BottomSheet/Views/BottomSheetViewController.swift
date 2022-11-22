//
//  BottomSheetViewController.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 29/06/21.
//

import UIKit

final class BottomSheetViewController: UIViewController, Bindable {
    // MARK: - Private Properties

    private var bottomSheetView: BottomSheetView? {
        view as? BottomSheetView
    }

    private var action: ((BottomSheetAction) -> Void)?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }

    override func loadView() {
        let bottomSheetView = BottomSheetView()
        bottomSheetView.delegate = self
        view = bottomSheetView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bottomSheetView?.animateBackgroundIn()
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? BottomSheetModel else {
            preconditionFailure("Failed to cast BottomSheetModel")
        }

        bottomSheetView?.bindViewModel(model)
    }

    func bindAction(_ action: ((BottomSheetAction) -> Void)?) {
        self.action = { buttonAction in
            action?(buttonAction)
        }

        bottomSheetView?.bindAction(self.action)
    }
}

// MARK: - BottomSheetViewDelegate

extension BottomSheetViewController: BottomSheetViewDelegate {
    func bottomSheetViewDidDismiss() {
        view.backgroundColor = .clear
        dismiss(animated: true, completion: {
            self.action?(.dismiss)
        })
    }
}
