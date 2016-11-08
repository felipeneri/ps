//
//  ViewController.swift
//  Exemplo2_Rest_IOS_Swift
//
//  Created by Usuário Convidado on 05/10/16.
//  Copyright © 2016 Rubens Nogueira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var descricao: UILabel!
    var session: NSURLSession?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: sessionConfig)
        let url = NSURL (string: "http://itunes.apple.com/br/rss/topfreeapplications/limit=1/json")
        let task = session!.dataTaskWithURL(url!) { (data:NSData?, response:NSURLResponse?, error: NSError?) in
            if let nomeAPP = self.retornarNomeApp(data!){
                dispatch_async(dispatch_get_main_queue(), {
                    self.descricao.text = nomeAPP
                })
            }
            if let appImageURL = self.retornarImagemApp(data!){
                dispatch_async(dispatch_get_main_queue(), {
                    self.carregarImagemURL(appImageURL)
                })
            }
        }
        task.resume()
    }
    
    func retornarNomeApp(data: NSData) -> String? {
        var resposta:String?=nil
        do{
            //faz a leitura dos valores do Json, NSJSONSerialization faz o Parser do Json
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String:AnyObject]
            //cria um dicionário a partir da chave feed
            if let feed = json["feed"] as? [String:AnyObject]{
                //cria um dicionário a partir da chave entry
                if let entry = feed["entry"] as? [String:AnyObject]{
                    //cria um dicionário a partir da chave im:name
                    if let name = entry["im:name"] as? [String:AnyObject]{
                        //cria uma string a partir da chave label
                        if let label = name["label"] as? String{
                            return label
                        }
                    }
                }
            }
            
        }catch let error as NSError{
            resposta = "Falha ao carregar: \(error.description)"
        }
        return resposta
    }
    
    func retornarImagemApp(data: NSData) -> String? {
        var resposta:String?=nil
        do{
            //faz a leitura dos valores do Json, NSJSONSerialization faz o Parser do Json
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String:AnyObject]
            //cria um dicionário a partir da chave feed
            if let feed = json["feed"] as? [String:AnyObject]{
                //cria um dicionário a partir da chave entry
                if let entry = feed["entry"] as? [String:AnyObject]{
                    //cria um dicionário a partir da chave im:image
                    if let name = entry["im:image"] as? [AnyObject]{
                        //cria uma string para receber a url da imagem
                        //na terceira posição do array
                        if let image = name[2] as? [String: AnyObject]{
                            //cria uma string a partir da chave "label"
                            if let label = image["label"] as? String{
                                return label
                            }
                        }
                    }
                }
            }
            
        }catch let error as NSError{
            resposta = "Falha ao carregar: \(error.description)"
        }
        return resposta
    }

    func carregarImagemURL(imageURL: String){
        let url = NSURL(string: imageURL)!
        //cria uma task do tipo Download
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (responseData, responseUrl, error) -> Void in
            if let imagemData = responseData{
                dispatch_async(dispatch_get_main_queue(), {
                    self.imagem.image = UIImage(data:imagemData)
                })
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}