//
//  ViewController.swift
//  Exemplo1_TableView1_Swift
//
//  Created by Usuário Convidado on 21/09/16.
//  Copyright © 2016 Usuário Convidado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var minhaTabela: UITableView!
    
    var animal = ["Urso", "Elefante", "Girafa", "Rinoceronte"]
    var imagens = ["urso", "ele", "girafa", "rino"]
    
    override func viewDidLoad() {
        minhaTabela.dataSource = self
        minhaTabela.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        celula.textLabel?.text = animal[indexPath.row]
        celula.imageView?.image = UIImage(named:imagens[indexPath.row])
        celula.detailTextLabel?.text = "Africa"
        celula.accessoryType = .DisclosureIndicator
        return celula
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
     
            let msg = "Selecionamos o animal \(animal[indexPath.row])"
            let alerta = UIAlertController(
                title: "Atenção",
                message: msg,
                preferredStyle: .Alert)
            
            alerta.addAction(UIAlertAction(
                title: "Ok",
                style: .Default,
                handler: nil))
            
            presentViewController(alerta, animated: true, completion: nil)
        
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let imagemRodape = UIImageView(image: UIImage(named: "rodape"))
        return imagemRodape
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let imagemCabec = UIImageView(image: UIImage(named: "cabecalho"))
        return imagemCabec
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }
}