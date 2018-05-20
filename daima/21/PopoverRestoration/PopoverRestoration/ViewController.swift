import UIKit

class ViewController: UIViewController, PopoverRestorationDelegate {

    // 这个按钮触发模态视图
    @IBOutlet weak var showPopoverButton: UIButton!


    // 获取segues 并弹出
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "popoverSegue" {

            // 弹出一个正确的sourcerect
            if let pc = segue.destinationViewController.presentationController as? UIPopoverPresentationController {
                pc.sourceRect = pc.sourceView!.bounds
                pc.delegate = self
            }

            // 更新导航控制器的按钮状态
            if let nc = segue.destinationViewController as? PresentedNavigationController {
                nc.updateNavigationItemsForTraits(self.traitCollection);
            }
        }
    }

    // 当状态发生变化时，更新所做的导航控制器的按钮状态
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)

        if let nc = presentedViewController as? PresentedNavigationController {
            nc.updateNavigationItemsForTraits(newCollection);
        }
    }


    // MARK: PopoverRestorationDelegate


    func popoverSourceView() -> UIView? {
        return showPopoverButton
    }
}
