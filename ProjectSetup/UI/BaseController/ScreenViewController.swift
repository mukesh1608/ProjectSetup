//
//  ScreenViewController.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import UIKit

/// This class is also a base class of the controller. here you can pass and get view model object.
class ScreenViewController<DataProcessor: BaseViewModel>: BaseViewController {
    
    //MARK:- Vars
    /// Object of the view model.
    var viewModel: DataProcessor!
    
    
    //MARK:- View Life Cycle
    ///  Implement loadView to create a view hierarchy programmatically, without using a nib.
    override func loadView() {
        super.loadView();
        
    }
    
    /// Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    //MARK:- Memory Warning
    /// This method is received memory warnings from the controller.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        
    }

}
