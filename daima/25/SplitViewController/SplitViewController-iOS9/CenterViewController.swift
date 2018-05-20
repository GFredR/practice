//
//  CenterViewController.swift


import UIKit

class CenterViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  var numberOfCells = 50
  
}

extension CenterViewController {
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    print("CenterViewController - \(#function): Size: \(size)")
    
    let firstCell = collectionView?.visibleCells().first ?? UICollectionViewCell()
    guard let index = collectionView?.indexPath(for: firstCell) else {
      return
    }
    
    coordinator.animate(alongsideTransition: { (context) -> Void in
      self.collectionView.scrollToItem(at: index, at: UICollectionViewScrollPosition.top, animated: false)
      }, completion: nil)
  }
}

// MARK: - UICollectionViewDataSource

extension CenterViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return numberOfCells
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as UICollectionViewCell
    
    (cell.contentView.viewWithTag(20) as? UILabel)?.text = "\((indexPath as NSIndexPath).section)-\((indexPath as NSIndexPath).row)"
    
    return cell
  }
  
  @objc(collectionView:didSelectItemAtIndexPath:) internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    numberOfCells -= 1;
    collectionView.deleteItems(at: [indexPath])
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CenterViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 100, height: 100)
  }
}

