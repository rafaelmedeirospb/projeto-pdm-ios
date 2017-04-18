//
//  Historico.swift
//  DeboraLanches
//
//  Created by admin on 10/04/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation

class Historico: NSObject, NSCoding {
    var pedidos: Array<Pedido>!
    
    override init(){
        pedidos = Array<Pedido>()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.pedidos = aDecoder.decodeObject(forKey: "pedidos") as! Array<Pedido>
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.pedidos, forKey: "pedidos")
    }
    
    func add(pedido: Pedido) {
        self.pedidos.append(pedido)
    }
    
    func quantidade() -> Int {
        return self.pedidos.count
    }
    
    func del(pos: Int) {
        self.pedidos.remove(at: pos)
    }
    
    func troca(origem: Int, destino: Int) {
        let aux = self.pedidos[origem]
        self.pedidos[origem] = self.pedidos[destino]
        self.pedidos[destino] = aux;
    }
    

    
}
