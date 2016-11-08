//
//  ViewController.swift
//  CORREÇÃO NAC2 - TDSF
//
//  Created by Usuário Convidado on 26/10/16.
//  Copyright © 2016 AGESANDRO SCARPIONI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    var c = Contato()
    
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtTelefone: UITextField!
    
    
    @IBAction func gravar(sender: AnyObject) {
        c.nome.append(txtNome.text!)
        c.telefone.append(txtTelefone.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        let lista = segue.destinationViewController as! ListaTableViewController
        lista.c = self.c
     }
    
    
    


}

