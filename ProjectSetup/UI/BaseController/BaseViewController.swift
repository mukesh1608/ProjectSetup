//
//  BaseViewController.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import UIKit

/// This Class is the base class of all the view controllers so i.e. inherited from all the view controllers.
class BaseViewController: UIViewController {
    
    
    //MARK:- View life cycle.
    /// Implement loadView to create a view hierarchy programmatically, without using a nib.
    override func loadView() {
        super.loadView();
        configureScreenOnLoad();
    }
    
    /// Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScreenAfterLoad();
    }
    
    /// Called when the view is about to made visible. Default does nothing.
    /// - Parameter animated: true
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    /// Called when the view is dismissed, covered or otherwise hidden.
    /// - Parameter animated: true
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    /// This method is received memory warnings from the controller.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        
    }
    
    //MARK:- Configure Screen
    private func configureScreenOnLoad() {
        
    }
    
    private func configureScreenAfterLoad() {
        //Navigation backTitle
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //Set Screen Title
        setScreenTitle();
        
    }
    
    private func setScreenTitle() {
        self.navigationItem.title = screenTitle();
    }
    
    /// This function is used for the screen title of the view controller.
    /// - Returns: Get the screen name
    open func screenTitle() -> String? {
        var text = String(describing: type(of: self));
        text = text.replacingOccurrences(of: "Screen", with: "");
        text = text.replacingOccurrences(of: "Controller", with: "");
        return text;
    }
    
}
