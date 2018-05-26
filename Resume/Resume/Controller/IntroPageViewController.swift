//
//  PageViewController.swift
//  Resume
//
//  Created by ROGER on 2018. 5. 25..
//  Copyright © 2018년 Hexcon. All rights reserved.
//

import Foundation
import UIKit

class IntroPageViewController : UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    lazy var vcs = [FirstPageViewController.fromStoryboard(),
                    SecondPageViewController.fromStoryboard()
                    ]
    
    
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
}


//MARK:- Life Cycle
extension IntroPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageViewController()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    
}

extension IntroPageViewController {
    
    fileprivate func setupPageViewController() {
        
        self.delegate = self
        self.dataSource = self
        
        
        if let firstVC = vcs.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return vcs.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = vcs.index(of: viewController) else { return nil }
        
        if (viewControllerIndex <= 0) {
            return nil
            
        }
        
        return vcs[viewControllerIndex-1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = vcs.index(of: viewController) else { return nil }
        
        if (viewControllerIndex >= vcs.count-1) {
            return nil
        }
        
        
        return vcs[viewControllerIndex+1]
    }
    
}

extension IntroPageViewController {
    
}
