//
//  Pedido.swift
//  DeboraLanches
//
//  Created by admin on 07/04/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation


extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}

class Pedido: NSObject,NSCoding {
    
    var nomeCli: String!
    var dataPedido: Date!
    var produtos: Array<Produto>!
    
    override init() {
        self.produtos = Array<Produto>()
        
    }
    
    init(nomeCli: String, dataPedido: Date, produtos: Array<Produto>){  
        self.nomeCli = nomeCli
        self.dataPedido = dataPedido
        self.produtos = produtos
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.produtos = aDecoder.decodeObject(forKey: "produtos") as! Array<Produto>
        self.nomeCli = aDecoder.decodeObject(forKey: "nomeCli") as! String
        self.dataPedido = aDecoder.decodeObject(forKey: "data") as! Date
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.produtos, forKey: "produtos")
        aCoder.encode(self.nomeCli, forKey: "nomeCli")
        aCoder.encode(self.dataPedido, forKey: "data")
    }
    
    func add(produto: Produto) {
        self.produtos.append(produto)
    }
    
    func quantidade() -> Int {
        return self.produtos.count
    }
    
    func del(pos: Int) {
        self.produtos.remove(at: pos)
    }
    
    func troca(origem: Int, destino: Int) {
        let aux = self.produtos[origem]
        self.produtos[origem] = self.produtos[destino]
        self.produtos[destino] = aux;
    }
    
    func contaTotal() -> Double {
        var total = 0.0
        
        for p in self.produtos {
            total = total + p.valor
        }
        
        return total
    }
    
    
    
    override var description: String {
        return self.nomeCli+"   -   R$    "+String(contaTotal())+"    -   "+self.dataPedido.toString()
    }
}
