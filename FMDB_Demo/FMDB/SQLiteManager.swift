//
//  SQLiteManager.swift
//  FMDB_Demo
//
//  Created by Mac on 2020/4/3.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class SQLiteManager: NSObject {
    
    //创建单例
    private static let manager:SQLiteManager = SQLiteManager()
    
    class func shareManager() -> SQLiteManager{
        return manager
    }
    
    
    //数据库名称
    private let dbName = "test.db"
    
    //数据库地址
    lazy var dbURL : URL = {
        //根据传入的数据库名称拼接数据库的路径
        let fileURL = try! FileManager.default
            .url(for: FileManager.SearchPathDirectory.applicationDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent(dbName)
        
        print("数据库地址", fileURL)
        return fileURL
    }()
    
    // FMDatabase对象（用于对数据库进行操作）
    lazy var db: FMDatabase = {
       let dataBase = FMDatabase(url: dbURL)
        return dataBase
    }()
    
    
    //FMDatabaseQuene对象（用于多线程事务处理）
    lazy var dbQueue : FMDatabaseQueue? = {
        //根据路径返回数据库
        let databaseQueue = FMDatabaseQueue(url: dbURL)
        return databaseQueue
    }()
}
