# ViperUIKit

A set of VIPER protocols for UIKit.
To help you quicky implement VIPER pattern to your UIViewController. 

## Installation

### [Swift Package Manager](https://swift.org/package-manager/) 

1. In Xcode, select `File` > `Swift Packages` > `Add Package Dependency...`
2. Enter the URL for this repository `https://github.com/crystalwinghero/ViperUIKit.git`
3. Choose a minimum semantic version of `v1.1.0`

## Implementation

Note: you can follow the examples for in `Examples` folder.

### Viper
Mapping object for all V-I-P-E-R classes/structs together as a whole.
``` swift
import ViperUIKit

struct SampleViper : BaseViper {
    typealias View = SampleViewController
    typealias Interactor = SampleInteractor
    typealias Presenter = SamplePresenter
    typealias Entity = SampleEntity
    typealias Router = SampleRouter
}

```

### View
Add `PresentableView` protocol on your ViewController.
``` swift
import ViperUIKit

class SampleViewController : UIViewController, PresentableView {
    //1. declare type
    typealias Viper = SampleViper
    
    //2. declare presenter
    var presenter: Viper.Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //3. call setup
        presenter.setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //4. load content
        presenter.loadContent()
    }
}
```

### Interactor
Add `BaseInteractor` on your Interactor.
``` swift
import ViperUIKit

struct SampleInteractor : BaseInteractor {
    typealias Input = Any
    typealias Response = Any
    
    func fetch(_ input : Input?, _ completion: @escaping (Response) -> Void) {
        //TODO: add logic here
        completion("Hello, world!")
    }
    
}
```

### Presenter
Add `BasePresenter` on your Presenter.
``` swift
import ViperUIKit

///NOTE: mark as final class + inherits from NSObject
final class SamplePresenter : NSObject, BasePresenter {
    //1. declare type
    typealias Viper = SampleViper
    
    //2. declare variables for your VIPER
    //NOTE: always weak, to prevent retain cycle
    weak var view : Viper.View!
    var interactor: Viper.Interactor!
    var router: Viper.Router!
    var item : Viper.Entity?
    var list : [Viper.Entity] = []
    
    //3. default methods
    func setup() {
        //TODO: add your setup, i.e. navigation title, tableview data source, etc.
    }
    func loadContent() {
        //TODO: fetch your data
        interactor.fetch { (_) in
            //TODO: refresh UI
        }
    }
    func reloadContent() {
        //TODO: add reload method
    }
}
```

### Entity
Add `BaseEntity` on your Entity.
``` swift
import ViperUIKit

struct SampleEntity : BaseEntity {
    typealias PK = Int
    var pk : PK { id }
    var id : Int
}
```

### Router
Add `BaseRouter` on your Router.

*Note: default `Router.create()` will call `createWithNib()` by default, override it with `createWithStoryboard()`, or implements it the way your viewController needed to otherwise.*
``` swift
import ViperUIKit

struct SampleRouter : BaseRouter {
    typealias Viper = SampleViper
    
}
```

## Usage
Create your VC through `Router.create()` method.
``` swift
    //... 
    let vc = MyRouter.create() // VC will be created and linked with VIPER objects 
    self.navigationController?.pushViewController(vc, animated: true)
    //...
```
