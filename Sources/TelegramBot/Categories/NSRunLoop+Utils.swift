// Telegram Bot SDK for Swift (unofficial).
// (c) 2015 - 2016 Andrey Fidrya. MIT license. See LICENSE for more information.

import Foundation

public extension RunLoop {
	public func runOnce() {
		run(mode: RunLoopMode.defaultRunLoopMode, before: Date(timeIntervalSinceNow: 0.01))
	}
	
	public func waitForSemaphore(_ sem: DispatchSemaphore) {
		repeat {
			runOnce()
		} while .Success != sem.wait(timeout: DispatchTime.now())
	}
}
