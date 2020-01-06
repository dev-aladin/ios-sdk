//
//  Errors.swift
//  Aladin
//
//  Created by Lokesh Dudhat.
//

import Foundation

public enum AuthError: Error {
    case invalidResponse
}

@objc public enum GaiaError: Int, Error {
    case requestError
    case invalidResponse
    case connectionError
    case configurationError
    case signatureVerificationError
    case itemNotFoundError
    case serverError
}
