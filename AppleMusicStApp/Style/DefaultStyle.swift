//
//  DefaultStyle.swift
//  AppleMusicStApp
//
//  Created by keunhyeong on 2020/10/04.
//  Copyright © 2020 KeunHyeong. All rights reserved.
//

import UIKit

public enum DefaultStyle {
    public enum Colors {
        public static let tint: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor { traitCollction in
                    if traitCollction.userInterfaceStyle == .dark {
                        return .white
                    } else {
                        return .black
                    }
                }
            } else {
                return .black
            }
        }()
    }
}
