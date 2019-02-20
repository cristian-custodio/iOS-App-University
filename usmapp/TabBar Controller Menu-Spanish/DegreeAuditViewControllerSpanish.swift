//
//  DegreeAuditViewController.swift
//  usmapp
//
//  Created by Cristian Custodio on 4/9/18.
//  Copyright © 2018 Cristian Custodio and Steve Toro. All rights reserved.
//

import UIKit
import MessageUI

class DegreeAuditViewControllerSpanish: UIViewController,MFMailComposeViewControllerDelegate {
    
    //Courses taken counter
    var courseCounter = 0
    var creditsCounter = 0;
    var missionTripCompleted = false;
    var missingCourses = ""
    var graduationStatus = "Not Yet"
    
    //Checkboxes Outlet References
    //Associates Program Degree Specific Courses
    @IBOutlet weak var sup101: UIButton! //1
    @IBOutlet weak var sup201: UIButton! //2
    @IBOutlet weak var sup110: UIButton! //3
    @IBOutlet weak var sup120: UIButton! //4
    @IBOutlet weak var sup220: UIButton! //5
    @IBOutlet weak var sup130: UIButton! //6
    @IBOutlet weak var sup230: UIButton! //7
    @IBOutlet weak var sup140: UIButton! //8
    @IBOutlet weak var sup260: UIButton! //9
    @IBOutlet weak var sup210: UIButton! //10
    @IBOutlet weak var sup240: UIButton! //11
    @IBOutlet weak var sup250: UIButton! //12
    @IBOutlet weak var sup350: UIButton! //13
    @IBOutlet weak var kpg101: UIButton! //14
    @IBOutlet weak var kpg201: UIButton! //15
    @IBOutlet weak var kpg210: UIButton! //16
    @IBOutlet weak var kpg330: UIButton! //17
    @IBOutlet weak var pmi110: UIButton! //18
    @IBOutlet weak var pmi120: UIButton! //19
    @IBOutlet weak var pmi130: UIButton! //20
    @IBOutlet weak var pmi210: UIButton! //21
    @IBOutlet weak var pmi220: UIButton! //22
    @IBOutlet weak var ged260: UIButton! //23
    @IBOutlet weak var ged220: UIButton! //24
    @IBOutlet weak var rkg210: UIButton! //25
    @IBOutlet weak var rkg310: UIButton! //26
    @IBOutlet weak var brv120: UIButton! //27
    @IBOutlet weak var brv220: UIButton! //28
    @IBOutlet weak var brv103: UIButton! //29
    
    //Bachelor Program Degree Specific Courses
    @IBOutlet weak var sup310: UIButton! //30
    @IBOutlet weak var sup301: UIButton! //31
    @IBOutlet weak var sup320: UIButton! //32
    @IBOutlet weak var sup340: UIButton! //33
    @IBOutlet weak var sup360: UIButton! //34
    @IBOutlet weak var kpg220: UIButton! //35
    @IBOutlet weak var kpg320: UIButton! //36
    @IBOutlet weak var pmi230: UIButton! //37
    @IBOutlet weak var pmi240: UIButton! //38
    @IBOutlet weak var pmi310: UIButton! //39
    @IBOutlet weak var pmi320: UIButton! //40
    @IBOutlet weak var pmi330: UIButton! //41
    @IBOutlet weak var rkg320: UIButton! //42
    @IBOutlet weak var brv101: UIButton! //43
    @IBOutlet weak var brv102: UIButton! //44
    @IBOutlet weak var brv201: UIButton! //45
    @IBOutlet weak var brv202: UIButton! //46
    @IBOutlet weak var brv420: UIButton! //47
    @IBOutlet weak var mus101: UIButton! //48
    @IBOutlet weak var mus110: UIButton! //49
    @IBOutlet weak var mus220: UIButton! //50
    @IBOutlet weak var ged110: UIButton! //51
    @IBOutlet weak var ged460: UIButton! //52
    @IBOutlet weak var ged320: UIButton! //53
    
    //Associate Audit Degree Report Outlets
    @IBOutlet weak var missingCoursesAssociateTextView: UITextView!
    @IBOutlet weak var percentageCompletedAssociateLabel: UILabel!
    @IBOutlet weak var creditsRemainingAssociateLabel: UILabel!
    @IBOutlet weak var graduationReadyAssociateLabel: UILabel!
    @IBOutlet weak var coursesRemainingAssociatesLabel: UILabel!
    
    
    //Bachelors Audit Degree Report Outlets
    @IBOutlet weak var missingCoursesBachelorsTextView: UITextView!
    @IBOutlet weak var percentageCompletedBachelorsLabel: UILabel!
    @IBOutlet weak var creditsRemainingBachelorsLabel: UILabel!
    @IBOutlet weak var graduationReadyBachelorsLabel: UILabel!
    @IBOutlet weak var coursesRemainingBachelorsLabel: UILabel!
    
    //User Courses Selected UserDefaults
    let degreeCoursesSelected = UserDefaults.standard
    
    //UIView Declarations
    var degreeAuditAssociatesView: UIView?
    var degreeAuditAssociatesViewResults:UIView?
    var degreeAuditBachelorsView: UIView?
    var degreeAuditBachelorsViewResults: UIView?
    
    //Degree Audit XIB File Reference
    @IBOutlet var contentView: UIView!
   
    //Associate Degree Button
    @IBAction func associateDegree(_ sender: UIButton) {
        self.view.addSubview(degreeAuditAssociatesView!)
    }
    
    //Bachelors Degree Button
    @IBAction func bachelorsDegree(_ sender: UIButton) {
        self.view.addSubview(degreeAuditBachelorsView!)
    }

    //Associate Degree Button Generate Report
    @IBAction func associateDegreeReport(_ sender: UIButton) {
        self.view.addSubview(degreeAuditAssociatesViewResults!)
        //Reset Report Counters
        courseCounter = 0
        creditsCounter = 0;
        missionTripCompleted = false;
        missingCourses = ""
        //Set Report Variables
        setReportCountersAssociateDegree()
        //Check Degree Program Specific Class
        //Generate Missing Courses Textbox Text
        missingCoursesAssociateTextView.text = missingCourses
        //Populate Report Credits, Completion Percentage and Graduation Status
        populateAssociateReport()
    }
    
    //Bachelors Degree Button Generate Report
    @IBAction func bachelorsDegreeReport(_ sender: UIButton) {
        self.view.addSubview(degreeAuditBachelorsViewResults!)
        //Reset Report Counters
        courseCounter = 0
        creditsCounter = 0;
        missionTripCompleted = false;
        missingCourses = ""
        //Set Report Variables
        setReportCountersBachelorsDegree()
        //Generate Missing Courses Textbox Text
        missingCoursesBachelorsTextView.text = missingCourses
        //Populate Report Credits, Completion Percentage and Graduation Status
        populateBachelorsReport()
    }
    
    
    //*********Degree Navigation Buttons**************//
    @IBAction func resetButton(_ sender: UIButton) {
        degreeAuditAssociatesView?.removeFromSuperview()
        degreeAuditAssociatesViewResults?.removeFromSuperview()
        degreeAuditBachelorsViewResults?.removeFromSuperview()
        degreeAuditBachelorsView?.removeFromSuperview()
    }
    
    //Associates Degree Audit Report Navigation
    
    @IBAction func saveCopyButtonAssociate(_ sender: UIButton) {
        sendEmailAssociates()
    }
    
    //Bachelors Degree Audit Report Navigation
    @IBAction func saveCopyButtonBachelors(_ sender: UIButton) {
        sendEmailBachelors()
    }
    
    //*********Degree Navigation Buttons**************//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize Associate Degree Selection UIView and prepare contraints
        degreeAuditAssociatesView = instanceFromNib(XIBFilename: "degreeAuditAssociateSpanish")
        degreeAuditAssociatesView?.frame = self.view.bounds
        degreeAuditAssociatesView?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        loadSavedCheckboxesAssociatesDegree()
        
        //Initialize Associate Degree Selection Results UIView and prepare contraints
        degreeAuditAssociatesViewResults = instanceFromNib(XIBFilename: "degreeAuditAssociateResultsSpanish")
        degreeAuditAssociatesViewResults?.frame = self.view.bounds
        degreeAuditAssociatesViewResults?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        
        //Initialize Bachelors Degree Selection UIView and prepare contraints
        degreeAuditBachelorsView = instanceFromNib(XIBFilename: "degreeAuditBachelorsSpanish")
        degreeAuditBachelorsView?.frame = self.view.bounds
        degreeAuditBachelorsView?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        loadSavedCheckBoxesBachelorsDegree()
        
        //Initialize Bachelors Degree Selection Results UIView and prepare contraints
        degreeAuditBachelorsViewResults = instanceFromNib(XIBFilename: "degreeAuditBachelorsResultsSpanish")
        degreeAuditBachelorsViewResults?.frame = self.view.bounds
        degreeAuditBachelorsViewResults?.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Function to Return View From XIB File
    func instanceFromNib(XIBFilename: String) -> UIView {
        return (UINib(nibName: XIBFilename, bundle: nil)).instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        
        //Perform Switch Statement with Tag Identifier to Save Courses
            switch sender.tag {
            case 1:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP101")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP101")
                }
            case 2:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP201")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP201")
                }
            case 3:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP110")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP110")
                }
            case 4:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP120")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP120")
                }
            case 5:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP220")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP220")
                }
            case 6:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP130")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP130")
                }
            case 7:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP230")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP230")
                }
            case 8:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP140")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP140")
                }
            case 9:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP260")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP260")
                }
            case 10:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP210")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP210")
                }
            case 11:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP240")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP240")
                }
            case 12:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP250")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP250")
                }
            case 13:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP350")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP350")
                }
            case 14:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "KPG101")
                } else {
                    degreeCoursesSelected.set(true, forKey: "KPG101")
                }
            case 15:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "KPG201")
                } else {
                    degreeCoursesSelected.set(true, forKey: "KPG201")
                }
            case 16:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "KPG210")
                } else {
                    degreeCoursesSelected.set(true, forKey: "KPG210")
                }
            case 17:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "KPG330")
                } else {
                    degreeCoursesSelected.set(true, forKey: "KPG330")
                }
            case 18:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "PMI110")
                } else {
                    degreeCoursesSelected.set(true, forKey: "PMI110")
                }
            case 19:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "PMI120")
                } else {
                    degreeCoursesSelected.set(true, forKey: "PMI120")
                }
            case 20:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "PMI130")
                } else {
                    degreeCoursesSelected.set(true, forKey: "PMI130")
                }
            case 21:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "PMI210")
                } else {
                    degreeCoursesSelected.set(true, forKey: "PMI210")
                }
            case 22:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "PMI220")
                } else {
                    degreeCoursesSelected.set(true, forKey: "PMI220")
                }
            case 23:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "GED260")
                } else {
                    degreeCoursesSelected.set(true, forKey: "GED260")
                }
            case 24:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "GED220")
                } else {
                    degreeCoursesSelected.set(true, forKey: "GED220")
                }
            case 25:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "RKG210")
                } else {
                    degreeCoursesSelected.set(true, forKey: "RKG210")
                }
            case 26:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "RKG310")
                } else {
                    degreeCoursesSelected.set(true, forKey: "RKG310")
                }
            case 27:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "BRV120")
                } else {
                    degreeCoursesSelected.set(true, forKey: "BRV120")
                }
            case 28:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "BRV220")
                } else {
                    degreeCoursesSelected.set(true, forKey: "BRV220")
                }
            case 29:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "BRV103")
                } else {
                    degreeCoursesSelected.set(true, forKey: "BRV103")
                }
            case 30:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP310")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP310")
                }
            case 31:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP301")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP301")
                }
            case 32:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP320")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP320")
                }
            case 33:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP340")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP340")
                }
            case 34:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "SUP360")
                } else {
                    degreeCoursesSelected.set(true, forKey: "SUP360")
                }
            case 35:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "KPG220")
                } else {
                    degreeCoursesSelected.set(true, forKey: "KPG220")
                }
            case 36:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "KPG320")
                } else {
                    degreeCoursesSelected.set(true, forKey: "KPG320")
                }
            case 37:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "PMI230")
                } else {
                    degreeCoursesSelected.set(true, forKey: "PMI230")
                }
            case 38:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "PMI240")
                } else {
                    degreeCoursesSelected.set(true, forKey: "PMI240")
                }
            case 39:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "PMI310")
                } else {
                    degreeCoursesSelected.set(true, forKey: "PMI310")
                }
            case 40:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "PMI320")
                } else {
                    degreeCoursesSelected.set(true, forKey: "PMI320")
                }
            case 41:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "PMI330")
                } else {
                    degreeCoursesSelected.set(true, forKey: "PMI330")
                }
            case 42:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "RKG320")
                } else {
                    degreeCoursesSelected.set(true, forKey: "RKG320")
                }
            case 43:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "BRV101")
                } else {
                    degreeCoursesSelected.set(true, forKey: "BRV101")
                }
            case 44:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "BRV102")
                } else {
                    degreeCoursesSelected.set(true, forKey: "BRV102")
                }
            case 45:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "BRV201")
                } else {
                    degreeCoursesSelected.set(true, forKey: "BRV201")
                }
            case 46:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "BRV202")
                } else {
                    degreeCoursesSelected.set(true, forKey: "BRV202")
                }
            case 47:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "BRV420")
                } else {
                    degreeCoursesSelected.set(true, forKey: "BRV420")
                }
            case 48:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "MUS101")
                } else {
                    degreeCoursesSelected.set(true, forKey: "MUS101")
                }
            case 49:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "MUS110")
                } else {
                    degreeCoursesSelected.set(true, forKey: "MUS110")
                }
            case 50:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "MUS220")
                } else {
                    degreeCoursesSelected.set(true, forKey: "MUS220")
                }
            case 51:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "GED110")
                } else {
                    degreeCoursesSelected.set(true, forKey: "GED110")
                }
            case 52:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "GED460")
                } else {
                    degreeCoursesSelected.set(true, forKey: "GED460")
                }
            case 53:
                if (sender.isSelected) {
                    degreeCoursesSelected.set(false, forKey: "GED320")
                } else {
                    degreeCoursesSelected.set(true, forKey: "GED320")
                }
            default:
                print("Course Not Found")
            }
        
        //Checkbox Animation
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
            
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                sender.transform = .identity

            }, completion: nil)
        }
        
    }
    //Load Checkboxes from degreeCourseSelected User Defaults
    func loadSavedCheckboxesAssociatesDegree() {
        if(degreeCoursesSelected.bool(forKey: "SUP101") == true) {
            sup101.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP201") == true) {
            sup201.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP110") == true) {
            sup110.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP120") == true) {
            sup120.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP220") == true) {
            sup220.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP130") == true) {
            sup130.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP230") == true) {
            sup230.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP140") == true) {
            sup140.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP260") == true) {
            sup260.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP210") == true) {
            sup210.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP240") == true) {
            sup240.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP250") == true) {
            sup250.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP350") == true) {
            sup350.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "KPG101") == true) {
            kpg101.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "KPG201") == true) {
            kpg201.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "KPG210") == true) {
            kpg210.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "KPG330") == true) {
            kpg330.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI110") == true) {
            pmi110.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI120") == true) {
            pmi120.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI130") == true) {
            pmi130.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI210") == true) {
            pmi210.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI220") == true) {
            pmi220.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "GED260") == true) {
            ged260.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "GED220") == true) {
            ged220.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "RKG210") == true) {
            rkg210.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "RKG310") == true) {
            rkg310.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "BRV120") == true) {
            brv120.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "BRV220") == true) {
            brv220.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "BRV103") == true) {
            brv103.isSelected = true
        }
        
        
    }
    
    func loadSavedCheckBoxesBachelorsDegree() {
        if(degreeCoursesSelected.bool(forKey: "SUP101") == true) {
            sup101.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP201") == true) {
            sup201.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP110") == true) {
            sup110.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP120") == true) {
            sup120.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP220") == true) {
            sup220.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP130") == true) {
            sup130.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP230") == true) {
            sup230.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP140") == true) {
            sup140.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP260") == true) {
            sup260.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP210") == true) {
            sup210.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP240") == true) {
            sup240.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP250") == true) {
            sup250.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP350") == true) {
            sup350.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "KPG101") == true) {
            kpg101.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "KPG201") == true) {
            kpg201.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "KPG210") == true) {
            kpg210.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "KPG330") == true) {
            kpg330.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI110") == true) {
            pmi110.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI120") == true) {
            pmi120.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI130") == true) {
            pmi130.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI210") == true) {
            pmi210.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI220") == true) {
            pmi220.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "GED260") == true) {
            ged260.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "GED220") == true) {
            ged220.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "RKG210") == true) {
            rkg210.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "RKG310") == true) {
            rkg310.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "BRV120") == true) {
            brv120.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "BRV220") == true) {
            brv220.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP310") == true) {
            sup310.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP301") == true) {
            sup301.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP320") == true) {
            sup320.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP340") == true) {
            sup340.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "SUP360") == true) {
            sup360.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "KPG220") == true) {
            kpg220.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "KPG320") == true) {
            kpg320.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI230") == true) {
            pmi230.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI240") == true) {
            pmi240.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI310") == true) {
            pmi310.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI320") == true) {
            pmi320.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "PMI330") == true) {
            pmi330.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "RKG320") == true) {
            rkg320.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "BRV101") == true) {
            brv101.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "BRV102") == true) {
            brv102.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "BRV201") == true) {
            brv201.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "BRV202") == true) {
            brv202.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "BRV420") == true) {
            brv420.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "MUS101") == true) {
            mus101.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "MUS110") == true) {
            mus110.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "MUS220") == true) {
            mus220.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "GED110") == true) {
            ged110.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "GED460") == true) {
            ged460.isSelected = true
        }
        if(degreeCoursesSelected.bool(forKey: "GED320") == true) {
            ged320.isSelected = true
        }
    }
    
    func setReportCountersAssociateDegree() {
        if(degreeCoursesSelected.bool(forKey: "SUP101") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 101 - Revelación y Poder de la Obra de Jesucristo en la Cruz I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP201") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 201 - Revelación y Poder de la Obra de Jesucristo en la Cruz II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP110") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 110 - Revelación y Poder de la Resurrección de Jesucristo" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP120") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 120 - Fe I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP220") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 220 - Fe II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP130") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "SUP 130 - Oración I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP230") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 230 - Oración II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP140") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "SUP 140 - Evangelismo con Milagros I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP260") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "SUP 260 - Evangelismo con Milagros II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP210") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 210 - Sanidad Interior y Liberación" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP240") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 240 - Salud y Sanidad Divina" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP250") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 250 - Cómo caminar en el Poder Sobrenatural de Dios I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP350") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 350 - Cómo caminar en el Poder Sobrenatural de Dios II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "KPG101") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "KPG 101 - La Visión Apostólica de la Casa I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "KPG201") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "KPG 201 - La Visión Apostólica de la Casa II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "KPG210") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "KPG 210 - Principios de la Economía del Reino" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "KPG330") == true) {
            courseCounter = courseCounter + 1;
            missionTripCompleted = true
        } else {
            missingCourses = missingCourses + "KPG 330 - Avanzando el Reino a través de las Misiones" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI110") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "PMI 110 - Introducción al Ministerio Quíntuple" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI120") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "PMI 120 - La Formación del Carácter y el Ministerio del Líder I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI130") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "PMI 130 - Cómo encontrar el Propósito y el Llamado para su vida I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI210") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "PMI 210 - Paternidad, La Familia, El Matrimonio y los Hijos I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI220") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "PMI 220 - Transformación a través de la Renovación de la Mente" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "GED260") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "GED 260 - Los Tres Pilares de la Salud: Dieta, Ejercicio y Descanso I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "GED220") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "GED 220 - Composición en Español o Inglés" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "RKG210") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "RKG 210 - Cómo Escuchar la Voz de Dios" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "RKG310") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "RKG 310 - El Espíritu Santo en el Ahora I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "BRV120") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "BRV 120 - Fundamentos de la Fe Cristiana" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "BRV220") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else{
            missingCourses = missingCourses + "BRV 220 - Predicando el Evangelio del Reino con Revelación y Autoridad" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "BRV103") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "BRV 103  - Cómo Estudiar la Biblia" + "\n" + "\n"
        }
    }
    
    func setReportCountersBachelorsDegree() {
        if(degreeCoursesSelected.bool(forKey: "SUP101") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 101 - Revelación y Poder de la Obra de Jesucristo en la Cruz I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP201") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 201 - Revelación y Poder de la Obra de Jesucristo en la Cruz II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP110") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 110 - Revelación y Poder de la Resurrección de Jesucristo" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP120") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 120 - Fe I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP220") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 220 - Fe II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP130") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "SUP 130 - Oración I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP230") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 230 - Oración II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP140") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "SUP 140 - Evangelismo con Milagros I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP260") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "SUP 260 - Evangelismo con Milagros II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP210") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 210 - Sanidad Interior y Liberación" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP240") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 240 - Salud y Sanidad Divina" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP250") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 250 - Cómo caminar en el Poder Sobrenatural de Dios I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP350") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "SUP 350 - Cómo caminar en el Poder Sobrenatural de Dios II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "KPG101") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "KPG 101 - La Visión Apostólica de la Casa I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "KPG201") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "KPG 201 - La Visión Apostólica de la Casa II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "KPG210") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "KPG 210 -  Principios de la Economía del Reino" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "KPG330") == true) {
            courseCounter = courseCounter + 1;
            missionTripCompleted = true
        } else {
            missingCourses = missingCourses + "KPG 330 - Avanzando el Reino a través de las Misiones" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI110") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "PMI 110 - Introducción al Ministerio Quíntuple" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI120") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "PMI 120 - La formación del Carácter y el Ministerio del Líder I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI130") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "PMI 130 - Cómo encontrar el Propósito y Llamado para su Vida I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI210") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else {
            missingCourses = missingCourses + "PMI 210 - Paternidad, Familia, Matrimonio y los Hijos I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI220") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "PMI 220 - Transformación a través de la Renovación de la Mente" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "GED260") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "GED 260 - Los Tres Pilares de la Salud: Dieta, Ejercicio y Descanso I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "GED220") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "GED 220 - Composición en Inglés / Español" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "RKG210") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "RKG 210 - Cómo escuchar la Voz de Dios" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "RKG310") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "RKG 310 - El Espíritu Santo en el Ahora I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "BRV120") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else {
            missingCourses = missingCourses + "BRV 120 - Fundamentos de la Fe Cristiana" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "BRV220") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else{
            missingCourses = missingCourses + "BRV 220 - Predicando el Evangelio del Reino con Revelación y Autoridad" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP310") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else{
            missingCourses = missingCourses + "SUP 310 - Liberación, El pan de los Hijos" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP301") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "SUP 301 - El ayuno como Arma Espiritual" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP320") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "SUP 320 - El Ministerio de Intercesión" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP340") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "SUP 340 - Los Dones del Espíritu Santo, Aquí y Ahora" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "SUP360") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "SUP 360 - El Fruto del Espíritu" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "KPG220") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 4;
        } else{
            missingCourses = missingCourses + "KPG 220 -  El Reino de Poder, Dominio, Expansión y Demostración I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "KPG320") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else{
            missingCourses = missingCourses + "KPG320 - El Reino de Poder, Dominio, Expansión y Demostración II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI230") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "PMI 230 - La formación del Carácter y el Ministerio del Líder II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI240") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "PMI 240 - Cómo encontrar el propósito y llamado para su Vida II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI310") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else{
            missingCourses = missingCourses + "PMI 310 - Paternidad, Familia, Matrimonio y los Hijos II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI320") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else{
            missingCourses = missingCourses + "PMI 320 - Un pacto de Compromiso con Dios" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "PMI330") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else{
            missingCourses = missingCourses + "PMI 330 - Consejería, Cuidado Pastoral, y el Amor" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "RKG320") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "RKG 320 - El Espíritu Santo en el Ahora II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "BRV101") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "BRV 101 - Antiguo Testamento I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "BRV102") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "BRV 102 - Antiguo Testamento II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "BRV201") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "BRV 201 - Nuevo Testamento I" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "BRV202") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "BRV 202 - Nuevo Testamento II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "BRV420") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "BRV 420 - Los últimos tiempos y el Libro de Apocalipsis" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "MUS101") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "MUS 101 - Introducción a La Alabanza y La Adoración" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "MUS110") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "MUS 110 - Introducción a la Música" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "MUS220") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "MUS 220 - Cómo levantar Alabanza y Adoración Profética" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "GED110") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 4;
        } else{
            missingCourses = missingCourses + "GED 110 - Procesos financieros, Jurídicos y Procedimientos Administrativos para las..." + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "GED460") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 2;
        } else{
            missingCourses = missingCourses + "GED 460 - Los tres pilares de la salud: Dieta, Ejercicio y Descanso II" + "\n" + "\n"
        }
        if(degreeCoursesSelected.bool(forKey: "GED320") == true) {
            courseCounter = courseCounter + 1;
            creditsCounter = creditsCounter + 3;
        } else{
            missingCourses = missingCourses + "GED 320 - Introduction to Computers and Technology" + "\n" + "\n"
        }
    }
    
    func populateAssociateReport() {
        
        //Enumerate the Associate's Label Credit Report
        let totalCreditsPercentage = (creditsCounter * 100)/64
        print(totalCreditsPercentage)
        let totalCreditsPercentageString = "      " + String(totalCreditsPercentage) + "%"
        percentageCompletedAssociateLabel.text = totalCreditsPercentageString
        
        //Enumerate the Associate's Label Credits Remaining Report
        let totalCredits = creditsCounter
        let totalCreditsString = String(64-totalCredits)
        creditsRemainingAssociateLabel.text = totalCreditsString
        
        //Progress Based UI Customizatin
        if (creditsCounter == 64 && missionTripCompleted == true) {
            graduationReadyAssociateLabel.textColor = UIColor.green
            graduationReadyAssociateLabel.text = "Si!"
            missingCoursesAssociateTextView.text = "Se han cumplido todos los requisitos académicos para el Grado Asociado en Ministerio.."
            coursesRemainingAssociatesLabel.text = "Felicidades"
            coursesRemainingAssociatesLabel.textColor = UIColor.green
            
        } else if (creditsCounter == 64 && missionTripCompleted == false) {
            graduationReadyAssociateLabel.textColor = UIColor.red
            graduationReadyAssociateLabel.text = "Falta el Viaje misionero"
            percentageCompletedAssociateLabel.text = "99%"
            
        } else if (creditsCounter > 32) {
            graduationReadyAssociateLabel.text = "Casi"
        } else {
            graduationReadyAssociateLabel.text = "Sigue!"
            coursesRemainingAssociatesLabel.text = "Cursos restantes"
            coursesRemainingAssociatesLabel.textColor = UIColor.red
        }
        
    }
    
    func populateBachelorsReport() {
        
        //Enumerate the Associate's Label Credit Report
        let totalCreditsPercentage = (creditsCounter * 100)/120
        print(totalCreditsPercentage)
        let totalCreditsPercentageString = "      " + String(totalCreditsPercentage) + "%"
        percentageCompletedBachelorsLabel.text = totalCreditsPercentageString
        
        //Enumerate the Associate's Label Credits Remaining Report
        let totalCredits = creditsCounter
        let totalCreditsString = String(120-totalCredits)
        creditsRemainingBachelorsLabel.text = totalCreditsString
        
        //Progress Based UI Customization///////
        if (creditsCounter == 120 && missionTripCompleted == true) {
            graduationReadyBachelorsLabel.textColor = UIColor.green
            graduationReadyBachelorsLabel.text = "Yes!"
            missingCoursesBachelorsTextView.text = "Todos los requisitos académicos se han cumplido para la Licenciatura en Grado de Ministerio."
            coursesRemainingBachelorsLabel.text = "Felicidades"
            coursesRemainingBachelorsLabel.textColor = UIColor.green
            
        } else if (creditsCounter == 120 && missionTripCompleted == false) {
            graduationReadyBachelorsLabel.textColor = UIColor.red
            graduationReadyBachelorsLabel.text = "Falta el Viaje misionero"
            percentageCompletedBachelorsLabel.text = "99%"
            
        } else if (creditsCounter > 60) {
            graduationReadyBachelorsLabel.text = "Casi"
        } else {
            graduationReadyBachelorsLabel.text = "Sigue!"
            coursesRemainingBachelorsLabel.text = "Cursos restantes"
            coursesRemainingBachelorsLabel.textColor = UIColor.red
        }
    }
    
    func sendEmailAssociates() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setSubject("Informe de Auditoría del Asociado")
            mail.setToRecipients([""])
            mail.setMessageBody("Finalización total: \((creditsCounter*100)/64)" + "%" + "\n" + "Créditos Restantes: \(64-creditsCounter)" + "\n" + "Listo para graduarse: " + graduationStatus + "\n" + "\n" + "Cursos Restantes:"  +  "\n" + "\n" + missingCourses, isHTML: false)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func sendEmailBachelors() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setSubject("Informe de Auditoría de la Licenciatura")
            mail.setToRecipients([""])
            mail.setMessageBody("Finalización total: \((creditsCounter*100)/120)" + "%" + "\n" + "Créditos Restantes: \(120-creditsCounter)" + "\n" + "Listo para graduarse: " + graduationStatus + "\n" + "\n" + "Cursos Restantes:"  +  "\n" + "\n" + missingCourses, isHTML: false)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
}
