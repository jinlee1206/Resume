//
//  IntroViewController.swift
//  Resume
//
//  Created by ROGER on 2018. 5. 26..
//  Copyright © 2018년 Hexcon. All rights reserved.
//

import Foundation
import UIKit


class IntroViewController : UIViewController {
    
    
    var pageContainer: UIPageViewController!
    var currentIndex: Int?
    private var pendingIndex: Int?
    @IBOutlet weak var pageControl: UIPageControl!
    
    lazy var pages = [FirstPageViewController.fromStoryboard(),
                      SecondPageViewController.fromStoryboard()
                     ]
    
    

    
    
    deinit {
        
        print("deinit : IntroViewController")
    }

    
}


//MARK:- Life Cycle
extension IntroViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageControl()
        setupPageViewController()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        

        
        
        
        print("viewDidDisappear")
    }
    

    
}


//MARK:- Setup PageViewController and PageControl
extension IntroViewController : UIPageViewControllerDelegate , UIPageViewControllerDataSource {
    
    private func setupPageControl() {
        
        self.pageControl.numberOfPages = self.pages.count
        self.pageControl.currentPage = 0
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        
    }
    
    
    private func setupPageViewController() {
        
        self.pageContainer = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageContainer.delegate = self
        self.pageContainer.dataSource = self
        
        
        
        
        if let firstVC = pages.first as? FirstPageViewController {
            
            firstVC.delegate = self
            
            
            self.pageContainer.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
            
        }
        
        view.addSubview(pageContainer.view)
        view.bringSubview(toFront:pageControl)
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        self.pendingIndex = pages.index(of: pendingViewControllers.first!)
        print("pendingViewControllers : ",pages.index(of: pendingViewControllers.first!) ?? 100)
        
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            
            
            currentIndex = pendingIndex
            if let index = currentIndex {
                pageControl.currentPage = index
            }
        }
    }
    

    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        if (viewControllerIndex <= 0) {
            return nil
            
        }
        
        return pages[viewControllerIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        if (viewControllerIndex >= pages.count-1) {
            return nil
        }
        
        return pages[viewControllerIndex+1]
    }
    
 
}
//MARK:- MemoryManager Protocol
extension IntroViewController : MemoryManager {
    
    func removeViewController() {
        
        guard let window = UIApplication.shared.keyWindow else { return }
        guard let rootViewController = window.rootViewController else { return }
        
        let profileNVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileNVC")
//        let profileVC = ProfileViewController.fromStoryboard()
        profileNVC.view.frame = rootViewController.view.frame
        profileNVC.view.layoutIfNeeded()
        
        UIView.transition(with: window, duration: 1, options: .transitionCurlUp, animations: {
            window.rootViewController = profileNVC
        }, completion: { completed in
            // maybe do something here
        })
   
    }

    
    
}
