//
//  WineDetailInfoMiddle.swift
//  Winey
//
//  Created by 정도현 on 10/19/23.
//  Copyright © 2023 com.adultOfNineteen. All rights reserved.
//

import SwiftUI
import WineyKit

public enum DetailMode {
  case note
  case recommendWine
}

public struct WineDetailInfoMiddle: View {
  public let illustImage: Image
  public let circleBorderColor: Color
  public let secondaryColor: Color
  public let nationalAnthems: String
  public let varities: String
  public let abv: Double?
  public let purchasePrice: Int?
  public let vintage: Int?
  public let star: Int?
  public let buyAgain: Bool?
  public let mode: DetailMode
  
  public init(
    illustImage: Image,
    circleBorderColor: Color,
    secondaryColor: Color,
    nationalAnthems: String,
    varities: String,
    abv: Double? = nil,
    purchasePrice: Int? = nil,
    vintage: Int? = nil,
    star: Int? = nil,
    buyAgain: Bool? = nil,
    mode: DetailMode = .recommendWine
  ) {
    self.illustImage = illustImage
    self.circleBorderColor = circleBorderColor
    self.secondaryColor = secondaryColor
    self.nationalAnthems = nationalAnthems
    self.varities = varities
    self.abv = abv
    self.purchasePrice = purchasePrice
    self.vintage = vintage
    self.star = star
    self.buyAgain = buyAgain
    self.mode = mode
  }
  
  public var body: some View {
    HStack(alignment: .top) {
      VStack {
        WineDetailIllust(
          illustImage: illustImage,
          circleBorderColor: circleBorderColor,
          secondaryColor: secondaryColor
        )
        
        Spacer()
          .frame(height: 25)
        
        if let star = star, let buyAgain = buyAgain {
          HStack(spacing: 2) {
            WineyAsset.Assets.star1.swiftUIImage
              .renderingMode(.template)
              .foregroundColor(WineyKitAsset.main3.swiftUIColor)
              .padding(.trailing, 4)
            
            Text(Double(star).description)
              .foregroundColor(WineyKitAsset.main3.swiftUIColor)
              .wineyFont(.title2)
            
            if buyAgain {
              Text("・ 재구매")
                .wineyFont(.captionB1)
            }
          }
        }
      }
      
      Spacer()
        .frame(minWidth: 24)
      
      VStack(spacing: 18) {
        // MARK: NATIONAL ANTHEMS
        wineInfoTable(
          title: "national an thems",
          contents: nationalAnthems
        )
        
        // MARK: Varities
        wineInfoTable(
          title: "Varities",
          contents: varities
        )
        
        // MARK: ABV
        if mode == .note {
          wineInfoTable(
            title: "ABV",
            contents: abv?.description ?? "도 수를 알 수 없어요 :("
          )
        }
        
        // MARK: Purchase Price
        if let price = purchasePrice {
          wineInfoTable(
            title: "Purchae price",
            contents: price > 0 ? price.description : "구매가를 알 수 없어요 :("
          )
        } else {
          wineInfoTable(
            title: "Purchae price",
            contents: "구매가를 알 수 없어요 :("
          )
        }
        
        // MARK: ABV
        if mode == .note {
          wineInfoTable(
            title: "Vintage",
            contents: vintage?.description ?? "빈티지를 알 수 없어요 :("
          )
        }
      }
      .foregroundColor(WineyKitAsset.gray50.swiftUIColor)
      .frame(width: 148)
    }
  }
}

extension WineDetailInfoMiddle {
  
  @ViewBuilder
  private func wineInfoTable(title: String, contents: String) -> some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack {
        Text(title)
          .wineyFont(.captionM3)
        
        Spacer()
      }
      
      HStack {
        Text(contents)
          .wineyFont(.captionB1)
        
        Spacer()
      }
    }
  }
}

#Preview {
  WineDetailInfoMiddle(
    illustImage: WineType.rose.illustImage,
    circleBorderColor: .black,
    secondaryColor: .red,
    nationalAnthems: "test",
    varities: "test",
    purchasePrice: 9,
    star: 4,
    buyAgain: true
  )
}
