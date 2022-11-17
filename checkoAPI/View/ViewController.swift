//
//  ViewController.swift
//  checkoAPI
//
//  Created by Bair Nadtsalov on 13.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var outputInfo: UITextView!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    private var viewModel = ViewModel()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView.isHidden = true
    }
    
    // MARK: - Actions
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        
        guard let inn = inputTextField.text else { return }
        viewModel.fetchResult(with: inn) {
            DispatchQueue.main.async { [weak self] in
                self?.activityIndicatorView.isHidden = true
                self?.activityIndicatorView.stopAnimating()
                self?.titleLabel.text = self?.viewModel.getCompanyName()
            }
        }
    }


}

