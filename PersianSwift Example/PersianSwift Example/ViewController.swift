//
//  ViewController.swift
//  PersianSwift Example
//
//  Created by Omid Golparvar on 7/6/17.
//  Copyright © 2017 Omid Golparvar. All rights reserved.
//

import UIKit
import PersianSwift

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		print(12345678.ps.string.ps.withIranTomanStyle)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func actionShowPersianDatePicker(_ sender: UIButton) {
		let persianDatePickerVC = PSDatePickerViewController(minDateString: "1396-05-07", maxDateString: "1400-09-18") {
			[weak self] selectedDate in
			self?.testF1()
			print(selectedDate.ps.asPersianDate)
			
		}
//		persianDatePickerVC.buttonBackgroundColor = .red
//		persianDatePickerVC.buttonTintColor = .blue
//		persianDatePickerVC.buttonTitle = "Save and Close"
//		persianDatePickerVC.labelTopMessageText = "Select date and back"
//		persianDatePickerVC.labelTopMessageTextColor = .green
//		persianDatePickerVC.pickerViewsTitleTextColor = .orange
		persianDatePickerVC.modalPresentationStyle = .overFullScreen
		
		present(persianDatePickerVC, animated: false, completion: nil)
		
		
	}
	
	fileprivate func testF1() {
		print("Done")
	}


}

