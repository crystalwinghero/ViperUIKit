# ViperUIKit

A set of VIPER protocols for UIKit.

## Installation

### [Swift Package Manager](https://swift.org/package-manager/) 

1. In Xcode, select `File` > `Swift Packages` > `Add Package Dependency...`
2. Enter the URL for this repository `https://github.com/crystalwinghero/ViperUIKit.git`
3. Choose a minimum semantic version of `v1.0.0`

## Implementation

### View
Add `PresentableView` protocol on your ViewController.
``` swift
import ViperUIKit

class MyViewController: UIViewController, PresentableView {
    //1. set type of your presenter
    typealias Presenter = MyPresenter  

    //2. set your presenter ref
    var presenter: Presenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        //3. setting up your vc
        presenter.setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //4. load page content
        presenter.loadContent()
    }
    
}
```

### Interactor
Add `BaseInteractor` on your Interactor.
``` swift
import ViperUIKit

struct MyInteractor : BaseInteractor {
    //1. Type of response + object
    typealias Response = Bool
    typealias Object = MyEntity
    
    //2. implement how you fetch your data
    func fetch(_ completion: @escaping (Bool) -> Void) {
        //TODO: fetch logic here
        completion(true)
    }
}

```

### Presenter
Add `BasePresenter` on your Presenter.
``` swift
import ViperUIKit

///NOTE: mark as final class
final class MyPresenter: NSObject, BasePresenter {
    //1. declare types of your View, Interactor, Entity, and router
    typealias View = MyViewController
    typealias Interactor = MyInteractor
    typealias Entity = MyEntity
    typealias Router = MyRouter
    
    //2. declare variables for your VIPER
    //NOTE: always weak, to prevent retain cycle
    weak var view : View!
    var interactor: Interactor!
    var router: Router!
    var item : Entity?
    var list : [Entity] = []
    
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
Add `BaseEntity` on your Entity
``` swift
import ViperUIKit

struct MyEntity : BaseEntity {
    //declare your PK type and value
    typealias PK = Int
    var pk : PK { id }
    var id : Int
    var title : String?
}

```

### Router
Add `BaseRouter` on your Router

*Note: default `Router.create()` will try to create VC from nib, implements your own otherwise.*
``` swift
import ViperUIKit

struct MyRouter : BaseRouter {
    typealias T = MyViewController
    
    //NOTE: your can create your own create() method here
    /**
    static func create() -> T {
        let vc = T.instanceFromStoryboard()
        let presenter = T.Presenter(vc)
        vc.presenter = presenter
        return vc
    }
    */
}
```

## Usage
Create your VC through `Router.create()` method
``` swift
    //... 
    let vc = MyRouter.create() // VC will be created and linked with VIPER objects 
    self.navigationController?.pushViewController(vc, animated: true)
    //...
```

## Extra

### TablePresentableView
For ViewController with `UITableView` inside.
``` swift
import ViperUIKit

class MyViewController: UIViewController, TablePresentableView {
    //1. set type of your presenter
    typealias Presenter = MyPresenter  

    //2. set your presenter var
    var presenter: Presenter!
    
    //3. your tableView
    @IBOutlet weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //4. setting up your vc
        presenter.setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //5. load page content
        presenter.loadContent()
    }
    
}
```

### BaseTablePresenter
Using together with `TablePresentableView`
``` swift
final class MyTablePresenter: NSObject, BaseTablePresenter {
    typealias View = MyViewController
    typealias Interactor = MyInteractor
    typealias Entity = MyEntity
    typealias Router = MyRouter

    //2. declare variables for your VIPER
    //NOTE: always weak, to prevent retain cycle
    weak var view : View!
    var interactor: Interactor!
    var router: Router!
    var item : Entity?
    var list : [Entity] = []

    //3. default methods
    func setup() {
        //NOTE: you can refer tableView from your view directly
        tableView.register(Cell.nib, forCellReuseIdentifier: Cell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    func loadContent() {
        interactor.fetch { [weak self](list) in
            self?.list = list
            self?.tableView.reloadData()
        }
    }
    func reloadContent() {
        self.loadContent()
    }
}

extension MyTablePresenter : UITableViewDataSource, UITableViewDelegate {
    //...
}

```
