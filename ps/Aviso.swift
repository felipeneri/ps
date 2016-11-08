//
//  Aviso.swift
//  Exemplo2_TableView2_Swift
//
//  Created by Usuário Convidado on 28/09/16.
//  Copyright © 2016 Fiap. All rights reserved.
//

import UIKit

class Aviso: NSObject {

    class func exibirMensagem(msg: String, sender:AnyObject){
        
        let alerta = UIAlertController(
            title: "Atenção",
            message: msg,
            preferredStyle: .Alert)
        
        alerta.addAction(UIAlertAction(
            title: "Ok",
            style: .Default,
            handler: nil))
        
        sender.presentViewController(alerta, animated: true, completion: nil)
    }
}
