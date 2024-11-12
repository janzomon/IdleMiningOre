//
//  ProgressViews.swift
//  IdleMiningOre
//
//  Created by Damon gonzalez on 11/11/24.
//

import Foundation
import SwiftUI






struct XPCrafting:ProgressViewStyle {
    var barColor:Color = .purple
    var bgBarColor:Color = .purple
    var minimum:Double = 0
    var maximum:Double = 100
    var percentage:Double {
        get {
            return minimum/maximum
        }
    }
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 350, height: 30)
                    .foregroundColor(bgBarColor)
                    .opacity(0.3)
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 350, height: 25)
                    .foregroundColor(barColor)
                    .padding(.horizontal,3)
            }
            Text("\(percentage, format: .percent.precision(.fractionLength(0)))")
                .font(.system(size: 10))
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .frame(maxWidth: 100,maxHeight:20)
        }
    }
}


struct DurabilityProgressView:ProgressViewStyle {
    var minimum:Double = 50
    var maximum:Double = 50
    var barColor:Color = .red
    var textColor:Color = .white
    private var percentage:Double {
        get {
            return minimum/maximum
        }
    }
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(maxWidth: 350, maxHeight: 30)
                    .foregroundColor(barColor)
                    .opacity(0.3)
                RoundedRectangle(cornerRadius: 3)
                    .frame(maxWidth: CGFloat(configuration.fractionCompleted ?? 0) * 350, maxHeight: 25)
                    .foregroundColor(barColor)
                    .padding(.horizontal,3)
            }
            Text("\(percentage, format: .percent.precision(.fractionLength(0)))")
                .font(.system(size: 10))
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .frame(maxWidth: 100,maxHeight:20)
        }
    }
}


struct MiningProgressBar:ProgressViewStyle {
    var minimum:Double = 0
    var maximum:Double = 100
    var barColor:Color {
        get {
            switch ore {
            case .copper:
                return .copperOre
            case .tin:
                return .tinOre
            case .iron:
                return .ironOre
            case .gold:
                return .goldOre
            case .mithril:
                return .mithrilOre
            case .eternium:
                return .eterniumOre
            case .obsidian:
                return .obsidianOre
            case .empyrium:
                return .empyriumOre
            case .oexxein:
                return .oexxeinOre
            case .progrenium:
                return .progreniumOre
            case .none:
                return . yellow
            }
        }
    }
    var bgBarColor:Color {
        get {
            switch ore {
            case .copper:
                return .copperOre
            case .tin:
                return .tinOre
            case .iron:
                return .ironOre
            case .gold:
                return .goldOre
            case .mithril:
                return .mithrilOre
            case .eternium:
                return .eterniumOre
            case .obsidian:
                return .obsidianOre
            case .empyrium:
                return .empyriumOre
            case .oexxein:
                return .oexxeinOre
            case .progrenium:
                return .progreniumOre
            case .none:
                return . yellow
            }
        }
    }
    var ore:Ores = .copper
    private var perctage:Double {
        get {
            return minimum/maximum
        }
    }
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 350, height: 30, alignment: .center)
                    .foregroundColor(barColor)
                    .opacity(0.3)
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 350, height: 25)
                    .foregroundColor(barColor)
                    .padding(.horizontal,3)
            }
            Text("\(perctage, format: .percent)")
                .fontWeight(.bold)
                .font(.system(size: 10))
        }
    }
}
