//
//  Produto.swift
//  DeboraLanches
//
//  Created by admin on 07/04/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation

class Produto: NSObject, NSCoding {
    var nome: String!
    var valor: Double!
    
    override var description: String {
        return self.nome+"  -   R$   "+String(self.valor)
    }
   
    required init?(coder aDecoder: NSCoder) {
        self.nome = aDecoder.decodeObject(forKey: "nome") as! String
        self.valor = aDecoder.decodeObject(forKey: "valor") as! Double
    }
    
    init(nome:String, valor:Double) {
        self.nome = nome
        self.valor = valor
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.nome, forKey: "nome")
        aCoder.encode(self.valor, forKey: "valor")
    }
}
