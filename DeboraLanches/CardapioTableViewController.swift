//
//  CardapioTableViewController.swift
//  DeboraLanches
//
//  Created by admin on 07/04/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class CardapioTableViewController: UITableViewController {

    var cardapio: Cardapio!
    var pedido: Pedido!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.cardapio = appDelegate.cardapio
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cardapio.quantidade()
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        let produto = self.cardapio.produtos[indexPath.row]
        cell.textLabel?.text = produto.description
      
        return cell
    }
 

    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }

    
    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .insert {
//            
//            
//        }    
//    }
 
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
//        }  else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
//        }
//    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(cardapio.produtos[indexPath.row])
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let fvc = sb.instantiateViewController(withIdentifier: "formulario") as! FormularioViewController
        
        fvc.produto = cardapio.produtos[indexPath.row]
        fvc.pedido = self.pedido
        
        self.navigationController?.pushViewController(fvc, animated: true)
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "principal_formulario"){
//            let fvc = segue.destination as! FormularioViewController
//            fvc.cadastro = self.cadastro
//        }else if (segue.identifier == "principal_sobre"){
//            let svc = segue.destination as! SobreViewController
//            svc.cadastro = self.cadastro
//        }
//    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
