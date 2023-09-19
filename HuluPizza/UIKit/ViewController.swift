import UIKit
import SwiftUI

class ViewController:
    UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBSegueAction func HuluPizzaMenu3(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: MenuView3(menu: MenuModel().menu))
    }
}
