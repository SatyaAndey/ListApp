//
//  ListViewControllerTests.swift
//  ListApp
//
//  Created by Satya on 07/11/20.
//  Copyright (c) 2020 Satya. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import ListApp
import XCTest

class ListViewControllerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: ListViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupListViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupListViewController()
  {
    sut = ListViewController()
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: Test doubles
  
  class ListBusinessLogicSpy: ListBusinessLogic
  {
    var fetchApiListitemsCalled = false

    func fetchApiListitems(request: List.APIList.Request, isFromTestCase: Bool) {
        fetchApiListitemsCalled = true

    }
  }
  
  // MARK: Tests
  
  func testShouldDoSomethingWhenViewIsLoaded()
  {
    // Given
    let spy = ListBusinessLogicSpy()
    sut.interactor = spy

    
    
    // When
    sut.fetchListItemsApi()
    
    
    
    // Then
    XCTAssertTrue(spy.fetchApiListitemsCalled, "viewDidLoad() should ask the interactor to fetchApiListitemsCalled")
  }
  
  func testDisplayApiListeItemsResponse()
  {
    // Given
    let viewModel = List.APIList.ViewModel()
    
    // When
    loadView()
    sut.displayApiListeItemsResponse(viewModel: [viewModel])
    
    // Then
    XCTAssertEqual(sut.arrListItems.count, 0, "list items updating properly.")
  }
}
