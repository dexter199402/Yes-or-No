//
//  storyPageView.swift
//  Selection
//
//  Created by 邱偉豪 on 2017/8/21.
//  Copyright © 2017年 wei. All rights reserved.
//

import UIKit

var timeUp = Timer()

class StoryPageView: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    //所有畫面控制
    lazy var allVC: [UIViewController] = {
        return [self.vcInstance(name: "StoryView"),
                self.vcInstance(name: "StoryImageView"),]
    }()
    
    func vcInstance(name:String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    var nextTime = Double()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        let storyTextCount = Double(storyTextLabelText.characters.count)
        nextTime = storyTextCount*0.1+60
        print(nextTime)

        //起始畫面
        if let firstView = allVC.first {
            setViewControllers([firstView],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.dis), name: NSNotification.Name(rawValue: "completeGo"), object: nil)
        dismissSelf()
    }
    
    func dismissSelf()  {
        DispatchQueue.main.asyncAfter(deadline: .now()+nextTime) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func dis()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = allVC.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return allVC.last
        }
        guard allVC.count > previousIndex else {
            return nil
        }
        return allVC[previousIndex]
        
    }
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = allVC.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = allVC.count
        
        guard orderedViewControllersCount != nextIndex else {
            return allVC.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return allVC[nextIndex]
    }
    
    
    
    
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return allVC.count
    }
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,let firstViewCOntrollerIndex = allVC.index(of: firstViewController) else {
            return 0
        }
        return firstViewCOntrollerIndex
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
