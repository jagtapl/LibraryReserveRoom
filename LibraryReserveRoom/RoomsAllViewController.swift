//
//  RoomsAllViewController.swift
//  LibraryReserveRoom
//
//  Created by LALIT JAGTAP on 9/5/17.
//  Copyright © 2017 LALIT JAGTAP. All rights reserved.
//

/*
    EndPoints
        UpdateRoomStatus
            after time picker is scrolled (also called by co-ordinator or after reseve clicked)
                parameters - by passing the selected time and duration selected
 
 
                to update the room views
        ReserveRoom
            called by self and implemented in co-ordinator to update the selected room as reserved
                pass room id, person, duration and selected time
                    use return status to update status
 
        UpdateReserveButtonStatus
            called by self and implemented in co-ordinator to find out if selected room can be booked.
            at selected time for selected duration
 
        Enable Reserve Button only when the criteria and login is validated.
            if current room is booked than the RESERVE button can not be enabled.
 
 
 start - Lalit
 
        By default selection is disabled when the ROOM is already Booked.
        That means user has to select the criteria time, person and duration. 
        When the time is selected in interval of 30 minutes update the room view.
        Only Avialble room to be enabled for user to click on it for reservation.
        Next if user clicks on avilable room next RESERVE button is enabled.
        On reserve, ask for login using dialog or scan card.
        Book the room, if login is valid and return to the view with status of Room as RED - Booked.
 
Data Structure 
        Array of timeslots of 30 minutes which are booked this can be per room.
        
 
 
 
 */

import UIKit

class RoomsAllViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
