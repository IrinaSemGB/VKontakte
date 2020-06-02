//
//  LoginFormController.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 12.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {
    
    @IBOutlet private weak var loaderView: Loader?
    
    @IBOutlet private weak var scroll: UIScrollView?
    @IBOutlet private weak var logo: UIImageView?
    @IBOutlet private weak var loginTextField: UITextField? {
        didSet {
            loginTextField?.borderStyle = .none
            loginTextField?.clipsToBounds = true
            loginTextField?.layer.cornerRadius = 9
            loginTextField?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            loginTextField?.layer.borderWidth = 0.4
            loginTextField?.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet private weak var passwordTextField: UITextField? {
        didSet {
            passwordTextField?.borderStyle = .none
            passwordTextField?.clipsToBounds = true
            passwordTextField?.layer.cornerRadius = 9
            passwordTextField?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            passwordTextField?.layer.borderWidth = 0.4
            passwordTextField?.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet private(set) weak var loginButton: UIButton? {
        didSet {
            loginButton?.titleLabel?.font = .boldSystemFont(ofSize: 20)
            loginButton?.titleLabel?.textColor = .white
            loginButton?.backgroundColor = UIColor(red: 70 / 255, green: 128 / 255, blue: 194 / 255, alpha: 1)
            loginButton?.layer.cornerRadius = 9
        }
    }
    @IBOutlet private weak var forgotPasswordButton: UIButton?
    
    private let demoLogin = ""
    private let demoPassword = ""

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loaderView?.start()
        
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
                        self.loaderView?.alpha = 0.1
        }) { (finished: Bool) in
            self.loaderView?.isHidden = true
            self.loaderView?.stop()
        }
    }
    
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super .init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.addNotifications()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        self.addNotifications()
    }
    
    deinit {
        self.removeNotifications()
    }
    
    
    // MARK: - Notifications
    
    private func addNotifications() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWasShow(notification: Notification) {
        
        guard let userInfo = notification.userInfo as NSDictionary? else {
            return
        }
        
        guard let keyboardFrame = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.cgRectValue.size.height
        let contentInsets = UIEdgeInsets(top: 0.0,
                                         left: 0.0,
                                         bottom: keyboardHeight,
                                         right: 0.0)
        
        self.scroll?.contentInset = contentInsets
        self.scroll?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        
        let contentInsets = UIEdgeInsets.zero
        
        self.scroll?.contentInset = contentInsets
        self.scroll?.scrollIndicatorInsets = contentInsets
    }

    
    // MARK: - Actions
    
    @IBAction func loginButtonAction() {
        self.openApplication()
    }
    
    
    @IBAction func closeKeyboardAction() {
        self.view.endEditing(true)
    }
    
    @IBAction func logoutAction(segue: UIStoryboardSegue) {
        
    }
    
    
    // MARK: - Open Application
    
    func openApplication() {
        
        guard let loginText = self.loginTextField?.text else {
            return
        }
        
        guard let passwordText = self.passwordTextField?.text else {
            return
        }
        
        if self.demoLogin == loginText && self.demoPassword == passwordText {
            self.performSegue(withIdentifier: "openApplication", sender: nil)
        } else {
            self.showErrorAlert()
        }
    }
    
    
    // MARK: - showErrorAlert
    
    func showErrorAlert() {
        
        let alertController = UIAlertController(title: "Ошибка", message: "Введены неверные данные", preferredStyle: .alert)
        
        let alertCancelAction = UIAlertAction(title: "Отменить", style: .cancel) { (action: UIAlertAction) in }
        
        alertController.addAction(alertCancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
