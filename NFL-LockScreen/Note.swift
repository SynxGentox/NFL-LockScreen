//
//  Note.swift
//  NFL-LockScreen
//
//  Created by Aryan Verma on 12/05/26.
//


// MARK: - Combine Timer approach
/*      while we can take use manual combine approach but it is old, not as performant and battery heavy.
        Combine approach is manual it takes the the current time and a timer which fires every second, updates the view every second using onReceive, renders the view every frame and specially battery heavy bcz it doesnt pauses automatically.
*/
            
/// mutable logic
/*
 @State private var realTime = Date.now
 var timeUpdater = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
 */

/// in view file
/*            Text(realTime, format: .dateTime.hour().minute().second())
                  .onReceive(timeUpdater) { timer in
                      realTime = timer
                  }
              Text(realTime, format: .dateTime.day().month().year())
 */
            
            
// MARK: - TimelineView
/*      TimelineView which is smart, takes time directly from the cpu and renders it to view which makes it much more performant bcz of absense of mutable process, Swift onReceive update calling, no UI rerender and logic calculation. its also much more battery friendly since time hardware timer is directly attached to View it pauses the exact second the view goes off screen.
 */
