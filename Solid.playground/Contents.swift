import UIKit
import Foundation

//Single responsibility
//Open closed principle
//Liskov substution principle
//Interface segregation principle
//Dependency inversion principle

class Book {
    func getTitle() -> String {
        return "A great book"
    }

    func getAuthor() -> String {
        return "Jonh Doe"
    }

    func save() {
        let name = getTitle() + " - " + getAuthor()
//        UserDefaults.standard.set(name, forKey: "some")
//        UserDefaults.standard.synchronize()
        DataManager.save(with: name)
    }
}

class DataManager {
    static func save(with name: String) {
        UserDefaults.standard.set(name, forKey: "some")
        UserDefaults.standard.synchronize()
    }
}

//

class AddressValidator {
    func validate(_ zipCode: String) -> Bool {
        return zipCode.count == 5 //1 numerik //2 5karakter

        //AE 3456 - 1
    }

    enum Country {
        case turkey
        case france
    }

    func validate(_ zipCode: String, country: Country) -> Bool {
        switch country {
        case .turkey:
            return zipCode.count == 5
        case .france:
            return zipCode.first == "1"
        }

        //1 numerik //2 5karakter

        //AE 3456 - 1
    }
}


// ---

protocol Flyable {
    func fly()
}

class Mamals {
    func walk() {

    }

    func eat() {

    }
}

class Bird: Mamals, Flyable {
    override func walk() {

    }

    override func eat() {

    }

    func fly() {

    }
}

class Whale: Mamals {
    override func walk() {

    }

    override func eat() {
        // do shomething
    }
}

// ---

protocol GridViewDataManager {
    func numberOfItems()
    func sizeForGridView()
    func gridViewAtIndex()
    func save()
}

extension UIViewController: GridViewDataManager {
    func numberOfItems() {
        // do something
    }

    func sizeForGridView() {
        // do something
    }

    func gridViewAtIndex() {
        // do something
    }

    func save() {

    }

}

// ---

typealias Setting = Speed & Temperature

protocol SpeedSettingProtocol {

}

protocol TemperatureSettingProtocol {

}

//class Setting {
//    var speed: SpeedSetting
//    var temperature: TemperatureSetting
//}

class SewingMachine {
    var setting: SpeedSettingProtocol

    init(setting: SpeedSettingProtocol) {
        self.setting = setting
    }
}

class OtherMachine {
    var setting: Setting

    init(setting: Setting) {
        self.setting = setting
    }
}

//---

class RealmDataManager: DataManagerProtocol {
    func save() {

    }
}

protocol DataManagerProtocol {
    func save()
}

class CoreDataManager: DataManagerProtocol {
    func save() {

    }
}

let interactor = PodcastListInteractor(dataManager: CoreDataManager())

let interactor = PodcastListInteractor(dataManager: RealmDataManager())

class PodcastListInteractor {
    var dataManager: DataManagerProtocol!

    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }

    dataManager.save()
}
