//
//  nuevoViewController.swift
//  CreaTuPizza
//
//  Created by Jesús de Villar on 2/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import UIKit

class nuevoViewController: UIViewController {
    var tamano:String = ""
    @IBOutlet weak var etiqueta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etiqueta.text = tamano
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
