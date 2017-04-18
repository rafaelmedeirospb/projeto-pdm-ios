//
//  AppDelegate.swift
//  DeboraLanches
//
//  Created by admin on 07/04/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var cardapio: Cardapio!
    var pedido: Pedido!
    var historico: Historico!
    
    func arquivo_cardapio() -> String {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/cardapio"
    }
    
    func arquivo_pedido() -> String {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/pedido"
    }

    func arquivo_historico() -> String {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/historico"
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        print("\(self.arquivo_cardapio())")
        print("\(self.arquivo_pedido())")
        print("\(self.arquivo_historico())")
        
        let obj1 = NSKeyedUnarchiver.unarchiveObject(withFile: self.arquivo_cardapio())
        let obj2 = NSKeyedUnarchiver.unarchiveObject(withFile: self.arquivo_pedido())
        let obj3 = NSKeyedUnarchiver.unarchiveObject(withFile: self.arquivo_historico())
        
        
        if (obj1 != nil){
            self.cardapio = obj1 as! Cardapio
        }else{
            self.cardapio = Cardapio()
            let p1 = Produto(nome: "Pao Pizza", valor: 4.50)
            cardapio.add(produto: p1)
            let p2 = Produto(nome: "Refri", valor: 1.50)
            cardapio.add(produto: p2)
            let p3 = Produto(nome: "Coxao", valor: 8.00)
            cardapio.add(produto: p3)
            let p4 = Produto(nome: "Coxinha", valor: 2.50)
            cardapio.add(produto: p4)
        }
        
        if (obj2 != nil){
            self.pedido = obj2 as! Pedido
        }else{
            self.pedido = Pedido()
        }
        
        if (obj3 != nil){
            self.historico = obj3 as! Historico
        }else{
            self.historico = Historico()
        }
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        NSKeyedArchiver.archiveRootObject(self.cardapio, toFile: self.arquivo_cardapio())
        NSKeyedArchiver.archiveRootObject(self.pedido, toFile: self.arquivo_pedido())
        NSKeyedArchiver.archiveRootObject(self.historico, toFile: self.arquivo_historico())
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "DeboraLanches")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
