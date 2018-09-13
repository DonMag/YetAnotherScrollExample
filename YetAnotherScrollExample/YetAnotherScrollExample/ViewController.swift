//
//  ViewController.swift
//  YetAnotherScrollExample
//
//  Created by Don Mag on 9/13/18.
//  Copyright © 2018 DonMag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var theVerticalScrollView: UIScrollView!
	
	var vc1ref: MyVC1ViewController?
	var vc2ref: MyVC2ViewController?
	
	override func viewDidLoad() {
        super.viewDidLoad()

		if let vc1 = storyboard?.instantiateViewController(withIdentifier: "MyVC1ViewController") as? MyVC1ViewController,
			let vc2 = storyboard?.instantiateViewController(withIdentifier: "MyVC2ViewController") as? MyVC2ViewController {
			
			guard let v1 = vc1.view, let v2 = vc2.view else { return }
			
			self.addChildViewController(vc1)
			self.addChildViewController(vc2)

			v1.translatesAutoresizingMaskIntoConstraints = false
			v2.translatesAutoresizingMaskIntoConstraints = false

			theVerticalScrollView.addSubview(v1)
			theVerticalScrollView.addSubview(v2)
			
			NSLayoutConstraint.activate([
				
				// constrain v1 topAnchor to topAnchor of scrollView
				v1.topAnchor.constraint(equalTo: theVerticalScrollView.topAnchor, constant: 0),
				
				// constrain v1 leading and trailing to leading and trailing of scrollView
				v1.leadingAnchor.constraint(equalTo: theVerticalScrollView.leadingAnchor, constant: 0),
				v1.trailingAnchor.constraint(equalTo: theVerticalScrollView.trailingAnchor, constant: 0),
				
				// constrain v1 width to width of scrollView
				v1.widthAnchor.constraint(equalTo: theVerticalScrollView.widthAnchor, constant: 0),
				
				// constrain v1 height to height of scrollView MINUS 50
				// (the height of your barcode view in v2)
				v1.heightAnchor.constraint(equalTo: theVerticalScrollView.heightAnchor, constant: -50),
				
				// constrain v2 topAnchor to BOTTOM of v1
				v2.topAnchor.constraint(equalTo: v1.bottomAnchor, constant: 0),

				// constrain v2 leading and trailing to leading and trailing of scrollView
				v2.leadingAnchor.constraint(equalTo: theVerticalScrollView.leadingAnchor, constant: 0),
				v2.trailingAnchor.constraint(equalTo: theVerticalScrollView.trailingAnchor, constant: 0),

				// constrain v2 height and width to height and width of scrollView
				v2.heightAnchor.constraint(equalTo: theVerticalScrollView.heightAnchor, constant: 0),
				v2.widthAnchor.constraint(equalTo: theVerticalScrollView.widthAnchor, constant: 0),

				// constrain v2 bottomAnchor to bottomAnchor of scrollView
				v2.bottomAnchor.constraint(equalTo: theVerticalScrollView.bottomAnchor, constant: 0),

				])

			vc1ref = vc1
			vc2ref = vc2

		}
		
		// enable paging in case it wasn't set in IB
		theVerticalScrollView.isPagingEnabled = true
		
    }

}

class MyVC1ViewController: UIViewController {
	
}

class MyVC2ViewController: UIViewController {
	
}
