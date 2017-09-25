//: Playground - noun: a place where people can play

import UIKit
@testable import LibraryReserveRoom
import SwiftMoment
import ZXingObjC

var str = "Hello, playground"

testRoom()

let m = moment()
m.date
type(of: m.date)
let b = moment(m.date)


var bookings = [BookingRecord]()
//bookings.count()
type(of: bookings)


//bookings.append(<#T##newElement: BookingRecord##BookingRecord#>)
// MARK: Archiving Paths

var DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
let ArchiveURL = DocumentsDirectory.appendingPathComponent("rooms")

print(ArchiveURL)

var rooms = [Room]()

print (Date())

var brLalit = BookingRecord(timeSlot: Date(), patronId: "lalit")
//var brLalit = BookingRecord(patronId: "lalit")
bookings.append(brLalit!)
bookings[0].patronId
bookings[0].timeSlot


var roomA = Room(name: RoomIdentifier.a, status: RoomStatus.available, bookings: bookings)

var brYash = BookingRecord(timeSlot: Date(), patronId: "yash")
//var brYash = BookingRecord(patronId: "yash")
bookings.append(brYash!)
bookings[0].patronId
bookings[0].timeSlot


var roomB = Room(name: RoomIdentifier.b, status: RoomStatus.available, bookings: bookings)


var brGaru = BookingRecord(timeSlot: Date(), patronId: "gargee")
//var brGaru = BookingRecord(patronId: "gargee")
bookings.append(brGaru!)
bookings[0].patronId
//bookings[0].timeSlot


var roomC = Room(name: RoomIdentifier.c, status: RoomStatus.booked, bookings: bookings)


rooms.append(roomA!)
rooms.append(roomB!)
rooms.append(roomC!)

// print path to archive
Room.ArchiveURL.path
type(of: rooms)
rooms.count
 
// save rooms to archive
let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(rooms, toFile: Room.ArchiveURL.path)
print ("saving is successul = \(isSuccessfulSave)")

//load rooms from archive
let lpjRoomArray = NSKeyedUnarchiver.unarchiveObject(withFile: Room.ArchiveURL.path) as? [Room]


/* 
 
 it does not work with moment as datatype ...but works for date
 
print("test archving of Moment type")
class Test: NSObject, NSCoding {
    
    // MARK: Properties
    var timeSlot: Moment
    var patronId: String
    
    // MARK: Types (static) for archiving
    struct PropertyKey {
        static let timeSlot = "timeSlot"
        static let patronId = "patronId"
    }
    
    // MARK: Initialization
    init?(timeSlot: Moment, patronId: String){
        self.timeSlot = timeSlot
        self.patronId = patronId
    }
    
    // MARK: NSCoding
    required init?(coder aDecoder: NSCoder) {
        print("inside init? method of BookingRecord")
        
        timeSlot = aDecoder.decodeObject(forKey: PropertyKey.timeSlot) as! Moment
        patronId = aDecoder.decodeObject(forKey: PropertyKey.patronId) as! String
        
    }
    
    func encode(with aCoder: NSCoder) {
        print("inside encode method of BookingRecord timeSlot is \(timeSlot) and patronId is \(patronId)")
        //aCoder.encode(timeSlot.date, forKey: "timeSlot")
        aCoder.encode(timeSlot, forKey: "timeSlot")
        aCoder.encode(patronId, forKey: "patronId")
    }
}

let t = Test(timeSlot: moment(), patronId: "Lalit testing")
t?.timeSlot
t?.patronId
type(of: t)

var DD = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
let AU = DD.appendingPathComponent("Test")

print(AU.path)

let isSucc = NSKeyedArchiver.archiveRootObject(t!, toFile: AU.path)
print ("saving is successul = \(isSucc)")

//load T from archive
let fetchedT = NSKeyedUnarchiver.unarchiveObject(withFile: AU.path) as? Test
fetchedT?.timeSlot
fetchedT?.patronId

*/

