//
//  AppContainer.swift
//  MVC
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation

let appContainer = AppContainer()

class AppContainer {
    let service: ClientNetworkServiceProtocol = ClientNetworkService()
    let router = AppRouter()
}
