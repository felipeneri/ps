//
//  ViewController.swift
//  Exemplo1_Rest_IOS_Swift
//
//  Created by Usuário Convidado on 05/10/16.
//  Copyright © 2016 Rubens Nogueira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var txtEndereco: UITextField!
    var session: NSURLSession?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func getEndereco(sender: AnyObject) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: sessionConfig)
        let url = NSURL (string: "http://viacep.com.br/ws/01001000/json/")
        let task = session!.dataTaskWithURL(url!) { (data:NSData?, response:NSURLResponse?, error: NSError?) in
            if let nomeAPP = self.retornarEndApp(data!){
                dispatch_async(dispatch_get_main_queue(), {
                    self.txtEndereco.text = nomeAPP
                })
            }
        }
        task.resume()
    }
    
    func retornarEndApp(data: NSData) -> String? {
        var resposta:String?=nil
        do{
            //faz a leitura dos valores do Json, NSJSONSerialization faz o Parser do Json
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String:AnyObject]
            //cria um dicionário a partir da chave feed
            if let logradouro = json["logradouro"] as? String{
                return logradouro
            }
            
        }catch let error as NSError{
            resposta = "Falha ao carregar: \(error.description)"
        }
        return resposta
    }
}