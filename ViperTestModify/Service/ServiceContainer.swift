//
//  ServiceContainer.swift
//  ViperTestModify
//
//  Created by 	Oleg2 on 12.11.2019.
//  Copyright © 2019 Oleg Pustoshkin. All rights reserved.
//

import Foundation


class ServiceContainer: ServiceContainerProtocol {
    private var getDataService: GetDataService? = nil
    
    private func createDataService() {
        self.getDataService = GetDataService()
    }
    
    func getPostInfoDataService() -> GetDataServiceProtocol {
        if self.getDataService == nil {
            self.createDataService()
        }
        
        return self.getDataService!
    }
    
    func getAddPostDataService() -> AddPostDataServiceProtocol {
        if self.getDataService == nil {
            self.createDataService()
        }
        
        return self.getDataService!
    }
}
