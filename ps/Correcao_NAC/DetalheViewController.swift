//
//  DetalheViewController.swift
//  CORREÇÃO NAC2 - TDSF
//
//  Created by Usuário Convidado on 26/10/16.
//  Copyright © 2016 AGESANDRO SCARPIONI. All rights reserved.
//

import UIKit

class DetalheViewController: UIViewController {

    
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblTelefone: UILabel!
    
    var textoNome:String = ""
    var textoTelefone:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNome.text = textoNome
        lblTelefone.text = textoTelefone

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
