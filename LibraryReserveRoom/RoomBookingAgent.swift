//
//  RoomBookingAgent.swift
//  LibraryReserveRoom
//
//  Created by LALIT JAGTAP on 9/22/17.
//  Copyright © 2017 LALIT JAGTAP. All rights reserved.
//

import UIKit

/*
    Endpoints
        doesRoomIsAvailable withRoomIdentifier
        reserveRoom withRoomIdentifer ForDuration BookedByPatron
        doesLiveReservationExists forPatronId
 
    Data structures
        maintains list of Rooms
        maintains valid calendar for 24 hours - start and end time
 
 
    Psudo flow
        model side - works with RoomStore to manage data like Room persistence etc
        handles logic like use duration and split in the 30 minutes timeslots and udpate the model booking record
        uses booking records of all rooms and current time to check if patron already has Live reservation not over yet.
 
 */

