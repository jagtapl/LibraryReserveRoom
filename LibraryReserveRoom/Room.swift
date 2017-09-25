//
//  Room.swift
//  ReserveRoom
//
//  Created by LALIT JAGTAP on 9/5/17.
//  Copyright © 2017 LALIT JAGTAP. All rights reserved.
//

import UIKit
import SwiftMoment
import ZXingObjC

import os.log

func testRoom() -> String {
    let m = moment()
    return ("Hello from Room class")
}

enum RoomIdentifier: String {
    case a, b, c, d, e, f, g, h, i
}

enum RoomStatus: String  {
    case available
    case booked
}

class BookingRecord: NSObject, NSCoding {
    
    // MARK: Properties
    var timeSlot: Date
    var patronId: String

    // MARK: Types (static) for archiving
    struct PropertyKey {
        static let timeSlot = "timeSlot"
        static let patronId = "patronId"
    }
    
    // MARK: Initialization
    init?(timeSlot: Date, patronId: String){
        self.timeSlot = timeSlot
        self.patronId = patronId
    }
    
    // MARK: NSCoding
    required convenience init?(coder aDecoder: NSCoder) {
        print("inside init? method of BookingRecord")

//        timeSlot = aDecoder.decodeObject(forKey: PropertyKey.timeSlot) as! Date
//        patronId = aDecoder.decodeObject(forKey: PropertyKey.patronId) as! String
        
        guard let timeSlot = aDecoder.decodeObject(forKey: PropertyKey.timeSlot) as? Date else {
            os_log("Unable to decode the timeSlot for a BookingRecord object", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let patronId = aDecoder.decodeObject(forKey: PropertyKey.patronId) as? String else {
            os_log("Unable to decode the patronId for a BookingRecord object", log: OSLog.default, type: .debug)
            return nil
        }

        self.init(timeSlot: timeSlot, patronId: patronId)
    }
    
    func encode(with aCoder: NSCoder) {
        //timeSlot is \(timeSlot)
        print("inside encode method of BookingRecord and patronId is \(patronId)")
        //aCoder.encode(timeSlot.date, forKey: "timeSlot")
        aCoder.encode(timeSlot, forKey: "timeSlot")
        aCoder.encode(patronId, forKey: "patronId")
    }
}


class Room: NSObject, NSCoding {
    
    // MARK: Properties
    let name: RoomIdentifier
    let status : RoomStatus
    var bookings = [BookingRecord]()
    
    // read-only computed property
    var personPerRoom : Int {

        switch self.name {
        case .a:
            return 2
        case .i:
            return 10
        default:
            return 4
        }
    }
    
    // MARK: Archiving Paths
    static var DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("rooms")

    // MARK: Types (static) for archiving
    struct PropertyKey {
        static let name = "name"
        static let status = "status"
        static let bookings = "bookings"
    }
    
    // MARK: Initialization
    init?(name: RoomIdentifier, status: RoomStatus, bookings: [BookingRecord]){
        self.name = name
        self.status = status
        self.bookings = bookings
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        
        print("inside encoder method of Room name= \(name) status =\(status)")
        aCoder.encode(self.name.rawValue, forKey: PropertyKey.name)
        aCoder.encode(self.status.rawValue, forKey: PropertyKey.status)
        aCoder.encode(self.bookings, forKey: PropertyKey.bookings)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let name = RoomIdentifier(rawValue: aDecoder.decodeObject(forKey: PropertyKey.name) as! String) else {
            os_log("Unable to decode the name for a Room object", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let status = RoomStatus(rawValue: aDecoder.decodeObject(forKey: PropertyKey.status) as! String) else {
            os_log("Unable to decode the status for a Room object", log: OSLog.default, type: .debug)
            return nil
        }
  
        guard let bookings = aDecoder.decodeObject(forKey: PropertyKey.bookings) as? [BookingRecord] else {
            os_log("Unable to decode the status for a Room object", log: OSLog.default, type: .debug)
            return nil
        }
//        let bookings = aDecoder.decodeObject(forKey: PropertyKey.bookings) as! [BookingRecord]

        self.init(name: name, status: status, bookings: bookings)

        print("inside init (decoder) method of Room name= \(self.name) status =\(self.status) bookings = \(self.bookings)")
    }
}




