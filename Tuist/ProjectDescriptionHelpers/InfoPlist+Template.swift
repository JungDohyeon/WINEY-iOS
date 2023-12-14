//
//  InfoPlist + Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박혜운 on 2023/11/15.
//

import ProjectDescription
import EnvPlugin

public extension InfoPlist {
  private static let basic: [String: Plist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "CFBundleDevelopmentRegion": "ko_KR",
    "UIUserInterfaceStyle": "Dark",
    "UIAppFonts": [
      "Item 0": "Pretendard-Medium.otf",
      "Item 1": "Pretendard-Bold.otf"
    ]
  ]
  
  private static let app: [String: Plist.Value] = [
    "NSAppTransportSecurity": [
      "NSAllowsArbitraryLoads": true,
      "NSExceptionDomains": [
        "example.com": [
          "NSExceptionAllowsInsecureHTTPLoads": true,
          "NSIncludesSubdomains": true
        ]
      ]
    ],
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "CFBundleDevelopmentRegion": "ko_KR",
    "UIUserInterfaceStyle": "Dark",
    "UILaunchStoryboardName":"LaunchScreen",
    "UIAppFonts": [
      "Item 0": "Pretendard-Medium.otf",
      "Item 1": "Pretendard-Bold.otf"
    ],
    "LSApplicationQueriesSchemes": [
      "kakaokompassauth",
      "kakaolink"
    ],
    "GIDClientID":
        .string(APIKeys.GOOGLE_API_KEY)
    ,
    "com.apple.developer.applesignin": [
      "Default"
    ],
    "CFBundleURLTypes": [
      [
        "CFBundleTypeRole": "Editor",
        "CFBundleURLSchemes": [
          .string(APIKeys.KAKAO_URL_KEY)
        ]
      ],
      [
        "CFBundleTypeRole": "Editor",
        "CFBundleURLSchemes": [
          .string(APIKeys.GOOGLE_URL_KEY)
        ]
      ]
    ]
  ]
  
  static func basicWiney() -> Self {
    return .extendingDefault(with: Self.basic)
  }
  
  static func appWiney() -> Self {
    return .extendingDefault(with: Self.app)
  }
  
  func extendingBasicWiney(info PList: [String: Plist.Value]) -> Self {
    let infoPlist = Self.basic.merging(PList) { (_, new) in
      return new
    }
    
    return .extendingDefault(with: infoPlist)
  }
}
