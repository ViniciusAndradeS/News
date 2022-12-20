//
//  CustomError.swift
//  News
//
//  Created by Vinicius Andrade on 2022-12-20.
//

import Foundation
import UIKit

enum CustomError: Error {
    case genericError
    
    func title() -> String {
        switch self {
        case .genericError:
          return "An error has occured"
        }
      }
    
    func image() -> UIImage {
        switch self {
        case .genericError:
            return UIImage(named: "error")!
        }
      }
    
}

