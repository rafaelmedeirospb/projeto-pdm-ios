//
//  FinalizarViewController.swift
//  DeboraLanches
//
//  Created by admin on 08/04/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class FinalizarViewController: UIViewController {
   
    @IBOutlet weak var tfNomeCliente: UITextField!
    @IBOutlet weak var lbValorTotal: UILabel!
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    var pedido: Pedido!

    @IBAction func finalizar(_ sender: Any) {
        let nomeCli = self.tfNomeCliente.text
        let data = Date()
        let produtos = self.appDel.pedido.produtos
            pedido = Pedido() 
        self.pedido.nomeCli=nomeCli
        self.pedido.dataPedido=data
        self.pedido.produtos=produtos
        
//        self.pedido.nomeCli = nomeCli
//        self.pedido.dataPedido = data
//        self.pedido.produtos  = produtos
        
        self.appDel.historico.pedidos.append(self.pedido)
        
        self.appDel.pedido = Pedido()
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "cardapio") as! CardapioTableViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
//    @IBAction func finalizar(_ sender: Any) {
//        let nomeCli = self.tfNomeCliente.text
//        let data = Date()
//        let produtos = self.appDel.pedido.produtos
//        
//        self.pedido.nomeCli = nomeCli
//        self.pedido.dataPedido = data
//        self.pedido.produtos  = produtos
//        
//        appDel.historico.append(pedido)
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "cardapio") as! CardapioTableViewController
//        
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        let custo = NSString(format: "R$ %.2f", self.appDel.pedido.contaTotal())
        lbValorTotal.text = custo.description
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
