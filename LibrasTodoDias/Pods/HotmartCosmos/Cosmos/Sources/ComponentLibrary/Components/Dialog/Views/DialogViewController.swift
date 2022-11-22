//
//  DialogViewController.swift
//  HotmartCosmos
//
//  Created by Ana Leticia Camargos Viana Lara on 04/11/21.
//

import UIKit

final class DialogViewController: UIViewController, Bindable {
    // MARK: - Private Properties

    private var dialogView: DialogView? {
        view as? DialogView
    }

    private var action: ((DialogAction) -> Void)?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
    }

    override func loadView() {
        let dialogView = DialogView()
        dialogView.delegate = self
        view = dialogView
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? DialogModel else {
            preconditionFailure("Failed to cast BottomSheetModel")
        }

        dialogView?.bindViewModel(model)
    }

    func bindAction(_ action: ((DialogAction) -> Void)?) {
        self.action = { [weak self] buttonAction in
            action?(buttonAction)

            UIView.delay(.recSlow) {
                self?.dismiss(animated: true)
            }
        }

        dialogView?.bindAction(self.action)
    }
}

// MARK: - BottomSheetViewDelegate

extension DialogViewController: DialogViewDelegate {
    func dialogViewDidDismiss(completion: (() -> Void)?) {
        view.backgroundColor = .clear
        dismiss(animated: true, completion: completion)
    }
}
