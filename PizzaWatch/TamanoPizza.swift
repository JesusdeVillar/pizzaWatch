//
//  TamanoPizza.swift
//  CreaTuPizza
//
//  Created by Jesús de Villar on 2/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import UIKit

class TamanoPizza: UITableViewController {

    let tamanos: [String] = ["Chica","Mediana","Grande"]
    var tamanoSeleccionado:String = ""
    
    @IBOutlet weak var botonSiguiente: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        botonSiguiente.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.botonSiguiente.enabled = false
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tamanos.count
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let sigVistaMasa=segue.destinationViewController as! TipoMasa
        self.tamanoSeleccionado = tamanos[(tableView.indexPathForSelectedRow?.row)!]
        sigVistaMasa.tamano = self.tamanoSeleccionado
    
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.tamanos[indexPath.row]
        return cell

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        botonSiguiente.enabled = true
        /* tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
        */
    }

}
