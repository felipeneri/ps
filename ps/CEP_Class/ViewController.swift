//
//  ViewController.swift
//  Aula_Json_Rest
//
//  Created by Usuário Convidado on 15/09/16.
//  Copyright © 2016 Felipe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ende = Endereco()
    
    @IBOutlet weak var lblRua: UILabel!
    @IBOutlet weak var lblCid: UILabel!
    @IBOutlet weak var lblBai: UILabel!
    @IBOutlet weak var lblEst: UILabel!
    
    
    
    
    @IBAction func btChamar(sender: AnyObject) {
        //cria uma configuração de sessao padrão
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        //cria uma sessao com a configuração default
        session = NSURLSession(configuration: sessionConfig)
        //URL de acesso a API do itunes do top Free App
        
        let cep = "http://viacep.com.br/ws/" + txtCep.text! + "/json"
        
        let url = NSURL(string: cep)
        let task = session!.dataTaskWithURL(url!) { (data:NSData?, response:NSURLResponse?, error:NSError?) in
            //ações que serão executadas quando a execução da task se completa
            //let dado = NSString(data:data!,encoding: NSUTF8StringEncoding)
            //print(dado)
            
            self.ende = self.retornarDado(data!)!
            
                dispatch_async(dispatch_get_main_queue(), {
                    self.lblRua.text = self.ende.rua
                    self.lblCid.text = self.ende.cidade
                    self.lblBai.text = self.ende.bairro
                    self.lblEst.text = self.ende.uf
                })
           
        }
        
        task.resume()
       
    }
    
    
    @IBOutlet weak var txtCep: UITextField!
    
    
    
    var session: NSURLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func retornarDado(data: NSData) -> Endereco? {
        
        let end = Endereco()
        
        do{
            //faz a leitura dos valores do Json, NSJSONSerialization faz o Parser do Json
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String:AnyObject]
            
            if let rua = json["logradouro"] as? String{
                end.rua = rua
            }
            if let cidade = json["localidade"] as? String{
                end.cidade = cidade
            }
            if let bairro = json["bairro"] as? String{
                end.bairro = bairro
            }
            if let uf = json["uf"] as? String{
                end.uf = uf
            }
            
        }catch let error as NSError{
            print("Falha ao carregar: \(error.description)")
        }
        return end
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
}

