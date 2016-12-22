//
//  frederic_clientTests.swift
//  frederic-clientTests
//
//  Created by Jim Hopp on 12/16/16.
//  Copyright © 2016 Jim Hopp. All rights reserved.
//

import XCTest
@testable import frederic_client

class frederic_clientTests: XCTestCase {
    let rootTVC = RootTableViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSingleton() {
        XCTAssertEqual(ClientDataSource.getClientDataSource(rootTVC.tableView!),
                       ClientDataSource.getClientDataSource(rootTVC.tableView!),
                       "not a singleton")
    }
    
    func testNumSections() {
        
        XCTAssertEqual(1, ClientDataSource.getClientDataSource(rootTVC.tableView!).numberOfSections(in: UITableView()), "wrong number of sections")
        
    }
    
    func testNumRows() {
        let clientDS = ClientDataSource.getClientDataSource(rootTVC.tableView!)
        XCTAssertEqual(clientDS.clients.count,
                       clientDS.tableView(rootTVC.tableView!, numberOfRowsInSection: 1),
                       "wrong number of rows")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
