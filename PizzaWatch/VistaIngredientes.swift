//
//  VistaIngredientes.swift
//  CreaTuPizza
//
//  Created by Jesús de Villar on 1/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import UIKit

class VistaIngredientes: UITableViewController {

    let ingrediantes: [String] = ["jamón","pepperoni","pavo","salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoa"]
    
    var tamanoPizza: String = ""
    var tipoMasa: String = ""
    var tipoQueso: String = ""
    var ingredientesSeleccionados = [String]()
    
    var numIngredPermitidos = 5
    var count:Int = 0
        
    @IBOutlet weak var botonSiguiente: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsMultipleSelection = true
        self.botonSiguiente.enabled = false
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
        return ingrediantes.count
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVistaConfir=segue.destinationViewController as! ConfirmacionPizza
        sigVistaConfir.tamanoPizza = self.tamanoPizza
        sigVistaConfir.tipoMasa = self.tipoMasa
        sigVistaConfir.tipoQueso = self.tipoQueso
        // for para extraes los datos seleccionados
        let indexPaths:NSArray = tableView.indexPathsForSelectedRows!
 
        for i in 0  ..< indexPaths.count {
            let thisPath = indexPaths[i] as! NSIndexPath
            let cell = tableView.cellForRowAtIndexPath(thisPath)
            self.ingredientesSeleccionados.append((cell?.textLabel?.text)!)
        }
        sigVistaConfir.ingredientesSeleccionados = self.ingredientesSeleccionados
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.ingrediantes[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        botonSiguiente.enabled = true
         tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
    }

    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
     tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.None
    }
 
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if let sr = tableView.indexPathsForSelectedRows {
            
            print("seleccionados: \(sr.count)")
            if sr.count == numIngredPermitidos {
                let alertController = UIAlertController(title: "Oops", message:
                    "Puede seleccionar como maximo \(numIngredPermitidos) ingredientes", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in
                }))
                self.presentViewController(alertController, animated: true, completion: nil)
                return nil
            }
        }
        return indexPath
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
