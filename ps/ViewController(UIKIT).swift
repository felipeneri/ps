//
//  ViewController.swift
//  Uikit_Swift
//
//  Created by Usuário Convidado on 17/08/16.
//  Copyright © 2016 Usuário Convidado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var meuSegmento: UISegmentedControl!
    @IBOutlet weak var lblKm: UILabel!
    @IBOutlet weak var lblAno: UILabel!
    @IBOutlet weak var lblRota: UILabel!
    @IBOutlet weak var meuStepper: UIStepper!
    @IBAction func indexChanged(sender: AnyObject) {
        switch meuSegmento.selectedSegmentIndex {
        case 0:
            print("Você escolheu o primeiro botão")
        case 1:
            print("Você escolheu o segundo botão")
        case 2:
            print("Você escolheu o \(self.meuSegmento.titleForSegmentAtIndex(meuSegmento.selectedSegmentIndex))")
        default:
            break
        }
    }
    
    @IBAction func stepperValueChanged(sender: AnyObject) {
        lblAno.text = "\(Int(meuStepper.value))"
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        lblKm.text = "\(Int(sender.value))"
    }
    
    @IBOutlet weak var meuSwitch: UISwitch!
    
    
    @IBAction func switchChanged(sender: AnyObject) {
        print(meuSwitch.on)
    }
    
    @IBAction func escolherRota(sender: AnyObject) {
        let msg = "Faça sua escolha"
        let alerta = UIAlertController(
            title: "Forma para receber a rota",
            message: msg,
            preferredStyle: .Alert)
        
        alerta.addAction(UIAlertAction(
            title: "SMS",
            style: .Default,
            handler: { (acao) in
                self.lblRota.text = acao.title
        }))
        
        alerta.addAction(UIAlertAction(
            title: "E-mail",
            style: .Default,
            handler: { (acao) in
                self.lblRota.text = acao.title
        }))
        
        alerta.addAction(UIAlertAction(
            title: "Cancelar",
            style: .Cancel,
            handler: { (acao) in
                self.lblRota.text = acao.title
        }))
        
        presentViewController(alerta, animated: true, completion: nil)
        
    }
    
    @IBAction func salvarDados(sender: AnyObject) {
        
        var tipo: String
        var msg: String
        if meuSegmento.selectedSegmentIndex >= 0 {
                tipo = meuSegmento.titleForSegmentAtIndex(self.meuSegmento.selectedSegmentIndex)!
            msg = "Veículo \(tipo) do ano \(lblAno.text)"
        } else {
            tipo = ""
            msg = "Antes de Salvar escolha um tipo de veículo"
        }
        
        let alerta = UIAlertController(
            title: "Atenção",
            message: msg,
            preferredStyle: .Alert)
        
        alerta.addAction(UIAlertAction(
            title: "OK",
            style: .Default,
            handler: nil
        ))
        
        presentViewController(alerta, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblAno.text = "1980"
        lblKm.text = "7500"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
