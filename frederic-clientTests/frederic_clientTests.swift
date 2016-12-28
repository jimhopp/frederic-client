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
    
    func testClientEquality() {
        XCTAssertEqual(ClientDataSource.Client(firstName: "jonathan", lastName: "smith"),
                       ClientDataSource.Client(firstName: "jonathan", lastName: "smith"),
                       "names don't match and should")
        XCTAssertNotEqual(ClientDataSource.Client(firstName: "jonathan", lastName: "jones"),
                          ClientDataSource.Client(firstName: "jonathan", lastName: "smith"),
                          "last names match and should not")
        XCTAssertNotEqual(ClientDataSource.Client(firstName: "happy", lastName: "jones"),
                          ClientDataSource.Client(firstName: "jonathan", lastName: "jones"),
                          "first names match and should not")
    }
    
    func testClientLessThanComparison() {
        XCTAssertLessThan(ClientDataSource.Client(firstName: "jonathan", lastName: "jones"),
                       ClientDataSource.Client(firstName: "jonathan", lastName: "smith"),
                       "lhs last name !< rhs last name and should be")
        XCTAssertLessThan(ClientDataSource.Client(firstName: "ian", lastName: "smith"),
                          ClientDataSource.Client(firstName: "jonathan", lastName: "smith"),
                          "lhs first name !< rhs first name and should be")
        XCTAssertGreaterThanOrEqual(ClientDataSource.Client(firstName: "happy", lastName: "thomas"),
                          ClientDataSource.Client(firstName: "jonathan", lastName: "jones"),
                          "lhs last name > rhs last name but lhs first name < rhs first name")
        XCTAssertGreaterThanOrEqual(ClientDataSource.Client(firstName: "theresa", lastName: "jones"),
                                    ClientDataSource.Client(firstName: "jonathan", lastName: "jones"),
                                    "lhs last name < rhs last name and should not be")
        XCTAssertGreaterThanOrEqual(ClientDataSource.Client(firstName: "theresa", lastName: "jones"),
                                    ClientDataSource.Client(firstName: "theresa", lastName: "jones"),
                                    "names are equal")
}
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
