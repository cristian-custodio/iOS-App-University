//
//  HomeViewControllerSpanish.swift
//  usmapp
//
//  Created by Cristian Custodio on 2/18/19.
//  Copyright © 2019 Cristian Custodio. All rights reserved.
//

import UIKit

class HomeViewControllerSpanish: UIViewController, UIScrollViewDelegate, UIWebViewDelegate {
    
    //Certificate Program Controls
    @IBAction func CertificateSelection(_ sender: UIButton) {
        let newView = pastoralCare!
        let newView2 = supernaturalCertificate!
        
        if (sender.tag == 1) {
            newView.frame = (certificateSegmentedControlView.bounds)
            newView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
            certificateSegmentedControlView.addSubview(newView)
        } else if (sender.tag == 2) {
            newView2.frame = (certificateSegmentedControlView.bounds)
            newView2.autoresizingMask = [.flexibleWidth,.flexibleHeight]
            certificateSegmentedControlView.addSubview(newView2)
        }
        
    }
    
    @IBAction func DegreeSelection(_ sender: UIButton) {
        let newView = associatePrograms!
        let newView2 = bachelorsProgram!
        
        if (sender.tag == 1) {
            newView.frame = (degreeSegmentedControlView.bounds)
            newView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
            degreeSegmentedControlView.addSubview(newView)
        } else if (sender.tag == 2) {
            newView2.frame = (degreeSegmentedControlView.bounds)
            newView2.autoresizingMask = [.flexibleWidth,.flexibleHeight]
            degreeSegmentedControlView.addSubview(newView2)
        }
        
    }
    
    //Certificate View Outlet
    @IBOutlet weak var certificateSegmentedControlView: UIView!
    //Degree Program View Outlet
    @IBOutlet weak var degreeSegmentedControlView: UIView!
    
    
    
    //UIWebview Outlets
    @IBOutlet weak var nonCreditRegistration: UIWebView!
    @IBOutlet weak var supernaturalInternship: UIWebView!
    
    //Declare Activity Indicator
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    //Homepage UIViews Declarations
    var AdmissionsView: UIView?
    var nonCreditView: UIView?
    var nonCreditViewRegister: UIView?
    var internshipView: UIView?
    var internshipViewRegister: UIView?
    var certificatePrograms: UIView?
    var pastoralCare: UIView?
    var supernaturalCertificate:UIView?
    var degreePrograms: UIView?
    var associatePrograms:UIView?
    var bachelorsProgram:UIView?
    
    //Home Page Buttons
    @IBAction func degreeAuditHomeButton(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func nonCreditHomeButton(_ sender: UIButton) {
        self.view.addSubview(nonCreditView!)
    }
    
    @IBAction func nonCreditWebFormHomeButton(_ sender: UIButton) {
        self.view.addSubview(nonCreditViewRegister!)
        
        //Enumerate Indicator
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        nonCreditRegistration?.delegate = self
        
        //Load Registration URL
        let url = URLRequest(url: URL(string: "https://fs2.formsite.com/universitykingjesusministryorg/form16/")!)
        nonCreditRegistration?.loadRequest(url)
    }
    
    @IBAction func internshipHomeButton(_ sender: UIButton) {
        self.view.addSubview(internshipView!)
        
    }
    
    @IBAction func certificateProgramHomeButton(_ sender: UIButton) {
        self.view.addSubview(certificatePrograms!)
    }
    
    @IBAction func degreeProgramHomeButton(_ sender: UIButton) {
        self.view.addSubview(degreePrograms!)
    }
    
    
    @IBAction func intershipRegistrationSegue(_ sender: UITapGestureRecognizer) {
        self.view.addSubview(internshipViewRegister!)
        
        //Enumerate Indicator
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        supernaturalInternship?.delegate = self
        
        //Load Registration URL
        let url = URLRequest(url: URL(string: "https://fs2.formsite.com/universitykingjesusministryorg/form13/")!)
        supernaturalInternship?.loadRequest(url)
    }
    
    
    
    //Home Page UIViews Navigation Buttons
    @IBAction func admissionsImageViewRegisterSegue(_ sender: UITapGestureRecognizer) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func admissionsButton(_ sender: UIButton) {
        self.view.addSubview(AdmissionsView!)
    }
    
    @IBAction func resetView(_ sender: UIButton) {
        AdmissionsView?.removeFromSuperview()
        nonCreditView?.removeFromSuperview()
        nonCreditViewRegister?.removeFromSuperview()
        internshipViewRegister?.removeFromSuperview()
        internshipView?.removeFromSuperview()
        certificatePrograms?.removeFromSuperview()
        pastoralCare?.removeFromSuperview()
        supernaturalCertificate?.removeFromSuperview()
        degreePrograms?.removeFromSuperview()
        associatePrograms?.removeFromSuperview()
        bachelorsProgram?.removeFromSuperview()
    }
    
    
    //Variable Declarations
    @IBOutlet weak var slideScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    let homeImage = #imageLiteral(resourceName: "home")
    let degreeAudit = #imageLiteral(resourceName: "degreeAudit")
    let register = #imageLiteral(resourceName: "Register")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nonCreditRegistration?.delegate = self
        
        //Admission View Initialization
        AdmissionsView = instanceFromNib(XIBFilename: "admissionsSpanish")
        AdmissionsView?.frame = self.view.bounds
        AdmissionsView?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        //NonCredit View Initialization
        nonCreditView = instanceFromNib(XIBFilename: "Non-CreditSpanish")
        nonCreditView?.frame = self.view.bounds
        nonCreditView?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        //NonCreditRegister View Initialization
        nonCreditViewRegister = instanceFromNib(XIBFilename: "Non-Credit-Application")
        nonCreditViewRegister?.frame = self.view.bounds
        nonCreditViewRegister?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        //Internship View Initialization
        internshipView = instanceFromNib(XIBFilename: "supernatural-Internship-spanish")
        internshipView?.frame = self.view.bounds
        internshipView?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        //InternshipRegister View Initialization
        internshipViewRegister = instanceFromNib(XIBFilename: "supernatural-internship-application")
        internshipViewRegister?.frame = self.view.bounds
        internshipViewRegister?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        //Certificate Programs View Initialization
        certificatePrograms = instanceFromNib(XIBFilename: "CertificateProgramsSpanish")
        certificatePrograms?.frame = self.view.bounds
        certificatePrograms?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        //Pastoral Care View Initialization
        pastoralCare = instanceFromNib(XIBFilename: "PastoralCareCertificateSpanish")
        pastoralCare?.frame = self.view.bounds
        pastoralCare?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        //Supernatural View Initialization
        supernaturalCertificate = instanceFromNib(XIBFilename: "SupernaturalCertificateSpanish")
        supernaturalCertificate?.frame = self.view.bounds
        supernaturalCertificate?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        //Degree Programs View Initialization
        degreePrograms = instanceFromNib(XIBFilename: "DegreeProgramsSpanish")
        degreePrograms?.frame = self.view.bounds
        degreePrograms?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        //Associate Degree Programs View Initialization
        associatePrograms = instanceFromNib(XIBFilename: "AssociateDegreeSpanish")
        associatePrograms?.frame = self.view.bounds
        associatePrograms?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        //Bachelors Degree Programs View Initialization
        bachelorsProgram = instanceFromNib(XIBFilename: "BachelorsDegreeSpanish")
        bachelorsProgram?.frame = self.view.bounds
        bachelorsProgram?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        
        //**************************************//
        //    SlideScrollView Code Beginning    //
        //**************************************//
        
        //SlideScrollView Frame Declaration
        self.slideScrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.slideScrollView.frame.height)
        let scrollViewWidth:CGFloat = self.slideScrollView.frame.width
        let scrollViewHeight:CGFloat = self.slideScrollView.frame.height
        
        //SlideScrollView Image Declarations (1-5)
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = UIImage(named: "slidergraduation6")
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = UIImage(named: "slidergraduation2")
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgThree.image = UIImage(named: "slidergraduation5")
        let imgFour = UIImageView(frame: CGRect(x:scrollViewWidth*3, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgFour.image = UIImage(named: "slidergraduation4")
        let imgFive = UIImageView(frame: CGRect(x:scrollViewWidth*4, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgFive.image = UIImage(named: "slidergraduation3")
        
        //Adding Images as Subviews to SlideScrollView
        self.slideScrollView.addSubview(imgOne)
        self.slideScrollView.addSubview(imgTwo)
        self.slideScrollView.addSubview(imgThree)
        self.slideScrollView.addSubview(imgFour)
        self.slideScrollView.addSubview(imgFive)
        
        //SlideScrollView Initiliazation and Delegate
        self.slideScrollView.contentSize = CGSize(width:self.slideScrollView.frame.width * 5, height:self.slideScrollView.frame.height)
        self.slideScrollView.delegate = self
        slideScrollView.delegate = self
        
        //**************************************//
        //    SlideScrollView Code Ending       //
        //**************************************//
        
        
        //**************************************//
        //    PageControl Dot Customization     //
        //**************************************//
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)
        self.pageControl.currentPage = 0
        
        
        //******************************************//
        //    Load TabBar Menu Custom Button Icons  //
        //*****************************************//
        
        //Home Icon
        tabBarController?.tabBar.items![0].image = homeImage.withRenderingMode(.alwaysOriginal)
        tabBarController?.tabBar.items![0].selectedImage = homeImage.withRenderingMode(.alwaysOriginal)
        //Register Icon
        tabBarController?.tabBar.items![1].image = register.withRenderingMode(.alwaysOriginal)
        tabBarController?.tabBar.items![1].selectedImage = register.withRenderingMode(.alwaysOriginal)
        //Degree Audit Button
        tabBarController?.tabBar.items![2].image = degreeAudit.withRenderingMode(.alwaysOriginal)
        tabBarController?.tabBar.items![2].selectedImage = degreeAudit.withRenderingMode(.alwaysOriginal)
        
    }
    
    
    
    
    //**********************************************//
    //   Function that takes in the scrollView      //
    //   and changes the pagecontrol (Activates     //
    //   when user scrolls the UIScrollView)        //
    //**********************************************//
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        
    }
    
    //Function to Return View From XIB File
    func instanceFromNib(XIBFilename: String) -> UIView {
        return (UINib(nibName: XIBFilename, bundle: nil)).instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
        print("indicator Stopped")
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    @IBAction func loadAssociateCourses(_ sender: UIButton) {
        
        if let url = URL(string: "http://usmnow.org/wp-content/uploads/2018/08/PROGRAMA-DE-ASOCIADO-EN-MINISTERIO.pdf") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func loadBachelorsCourses(_ sender: UIButton) {
        if let url = URL(string: "http://usmnow.org/wp-content/uploads/2018/08/PROGRAMA-DE-LICENCIATURA-EN-MINISTERIO.pdf") {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
