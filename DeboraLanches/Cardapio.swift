//
//  Cardapio.swift
//  DeboraLanches
//
//  Created by admin on 07/04/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation

class Cardapio: NSObject, NSCoding {
    var produtos: Array<Produto>!
    
    override init(){
        produtos = Array<Produto>()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.produtos = aDecoder.decodeObject(forKey: "produtos") as! Array<Produto>
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.produtos, forKey: "produtos")
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
    
}
