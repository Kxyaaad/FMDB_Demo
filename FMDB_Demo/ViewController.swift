//
//  ViewController.swift
//  FMDB_Demo
//
//  Created by Mac on 2020/4/3.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let db = SQLiteManager.shareManager().db
//        if db.open() {
//            print("数据库打开成功")
//        }else {
//            print("数据库打开失败")
//        }
//
//        db.close()
        
        createTable()
    }
    
    //创建表
    func createTable() {
        //编写SQL语句(id: 主键 name和age是字段名）
        let sql = "CREATE TABLE IF NOT EXISTS User( \n" +
            "id INTEGER PRIMARY KEY AUTOINCREMENT, \n" +
            "name TEXT, \n" +
            "age INTEGER \n" +
        "); \n"
        
        //执行SQL语句（注意点：在FMDB中除了查询以外，都称之为更新）
        let db = SQLiteManager.shareManager().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: []) {
                print("创建表成功")
            }else {
                print("创建表失败")
            }
        }
        
        db.close()
    }


}

