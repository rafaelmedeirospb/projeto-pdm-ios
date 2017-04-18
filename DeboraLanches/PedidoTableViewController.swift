//
//  PedidoTableViewController.swift
//  DeboraLanches
//
//  Created by admin on 08/04/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class PedidoTableViewController: UITableViewController {
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
  
    var pedido: Pedido!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: #selector(finalizar))
        
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    
    func finalizar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "finaliza") as! FinalizarViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
        
//        let desc = self.tfDescricao.text
//        let valor = Double(self.tfValor.text!)
//        let data = self.dpData.date
//        
//        if (self.gasto != nil){
//            self.gasto.descricao = desc
//            self.gasto.valor = valor
//            self.gasto.data = data
//        }else{
//            let gasto = Gasto(descricao: desc!, valor: valor!, data: data)
//            
//            self.cadastro.gastos.append(gasto)
//        }
        
//        self.navigationController?.popViewController(animated: true)
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
        return self.appDel.pedido.quantidade()
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula_pedido", for: indexPath)
                
        cell.textLabel?.text = self.appDel.pedido.produtos[indexPath.row].description

      
        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.appDel.pedido.produtos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
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
