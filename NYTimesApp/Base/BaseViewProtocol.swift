//
//  BaseViewProtocol.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 30/01/2021.
//

import Foundation
protocol BaseViewProtocol: class {
    func showLoading()
    func hideLoading()
    func showScreenNoConnection()
    func showAlert(title: String?, message: String)
    func showErrorAlert(error: String)
    func showBlockScreenWithRetry()
}
