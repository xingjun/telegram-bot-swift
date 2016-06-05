// Telegram Bot SDK for Swift (unofficial).
// (c) 2015 - 2016 Andrey Fidrya. MIT license. See LICENSE for more information.

import Foundation

public extension TelegramBot {
	typealias AnswerCallbackQueryCompletion = (result: Bool?, error: DataTaskError?)->()
	
	/// Send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. Blocking version.
	/// - Returns: true on success. Nil on error, in which case `lastError` contains the details.
	/// - SeeAlso: <https://core.telegram.org/bots/api#answercallbackquery>
	public func answerCallbackQuerySync(callbackQueryId: String,
	                          parameters: [String: Any?] = [:]) -> Bool? {
		let allParameters: [String: Any?] =
			defaultParameters["answerCallbackQuery"] ?? [:] + parameters +
				["callback_query_id": callbackQueryId]
		return requestSync("answerCallbackQuery", allParameters)
	}
	
	/// Send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. Asynchronous version.
	/// - Returns: true on success. Nil on error, in which case `error` contains the details.
	/// - SeeAlso: <https://core.telegram.org/bots/api#answercallbackquery>
	public func answerCallbackQueryAsync(callbackQueryId: String,
	                           parameters: [String: Any?] = [:],
	                           queue: dispatch_queue_t = dispatch_get_main_queue(),
	                           completion: AnswerCallbackQueryCompletion? = nil) {
		let allParameters: [String: Any?] =
			defaultParameters["answerCallbackQuery"] ?? [:] + parameters +
				["callback_query_id": callbackQueryId]
		requestAsync("answerCallbackQuery", allParameters, queue: queue, completion: completion)
	}
}