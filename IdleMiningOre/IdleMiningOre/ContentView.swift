//
//  ContentView.swift
//  IdleMiningOre
//
//  Created by Damon gonzalez on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    //USER
    @StateObject var user = User()
    //COPPER ORE
    @State var copperMiningLevel:Int = 1
    @State var copperMinimumMiningLevel:Int = 1
    @State var copperMinimumMining:Double = 0
    @State var copperMaximumMining:Double = 50
    @State var copperMiningDurabilityReduction:Double = 0.1
    @State var copperMiningTime = DispatchTimeInterval.seconds(1)
    @State var copperMined:Int = 0
    //TIN ORE
    @State var tinMiningLevel:Int = 1
    @State var tinMinimumMiningLevel:Int = 10
    @State var tinMiningExp:Double = 1
    @State var tinMinimumMining:Double = 0
    @State var tinMaximumMining:Double = 50
    @State var tinMiningDurabilityReduction:Double = 0.3
    @State var tinMiningTime = DispatchTimeInterval.seconds(2)
    @State var tinMined:Int = 0
    //IRON ORE
    @State var ironMiningLevel:Int = 1
    @State var ironMinimumMiningLevel:Int = 20
    @State var ironMiningExp:Double = 1
    @State var ironMinimumMining:Double = 0
    @State var ironMaximumMining:Double = 50
    @State var ironMiningDurabilityReduction:Double = 0.5
    @State var ironMiningTime = DispatchTimeInterval.seconds(3)
    @State var ironMined:Int = 0
    //GOLD ORE
    @State var goldMiningLevel:Int = 1
    @State var goldMinimumMiningLevel:Int = 30
    @State var goldMiningExp:Double = 1
    @State var goldMinimumMining:Double = 0
    @State var goldMaximumMining:Double = 50
    @State var goldMiningDurabilityReduction:Double = 0.7
    @State var goldMiningTime = DispatchTimeInterval.seconds(4)
    @State var goldMined:Int = 0
    //MITHRIL ORE
    @State var mithrilMiningLevel:Int = 1
    @State var mithrilMinimumMiningLevel:Int = 40
    @State var mithrilMiningExp:Double = 1
    @State var mithrilMinimumMining:Double = 0
    @State var mithrilMaximumMining:Double = 50
    @State var mithrilMiningDurabilityReduction:Double = 1.0
    @State var mithrilMiningTime = DispatchTimeInterval.seconds(5)
    @State var mithrilMined:Int = 0
    //ETERNIUM ORE
    @State var eterniumMiningLevel:Int = 1
    @State var eterniumMinimumMiningLevel:Int = 50
    @State var eterniumMiningExp:Double = 1
    @State var eterniumMinimumMining:Double = 0
    @State var eterniumMaximumMining:Double = 50
    @State var eterniumMiningDurabilityReduction:Double = 1.5
    @State var eterniumMiningTime = DispatchTimeInterval.seconds(6)
    @State var eterniumMined:Int = 0
    //OBSIDIAN ORE
    @State var obsidianMiningLevel:Int = 1
    @State var obsidianMinimumMiningLevel:Int = 60
    @State var obsidianMiningExp:Double = 1
    @State var obsidianMinimumMining:Double = 0
    @State var obsidianMaximumMining:Double = 50
    @State var obsidianMiningDurabilityReduction:Double = 2.0
    @State var obsidianMiningTime = DispatchTimeInterval.seconds(7)
    @State var obsidianMined:Int = 0
    //EMPYRIUM ORE
    @State var empyriumMiningLevel:Int = 1
    @State var empyriumMinimumMiningLevel:Int = 70
    @State var empyriumMiningExp:Double = 1
    @State var empyriumMinimumMining:Double = 0
    @State var empyriumMaximumMining:Double = 50
    @State var empyriumMiningDurabilityReduction:Double = 2.5
    @State var empyriumMiningTime = DispatchTimeInterval.seconds(8)
    @State var empyriumMined:Int = 0
    //OEXXEIN ORE
    @State var oexxeinMiningLevel:Int = 1
    @State var oexxeinMinimumMiningLevel:Int = 80
    @State var oexxeinMiningExp:Double = 1
    @State var oexxeinMinimumMining:Double = 0
    @State var oexxeinMaximumMining:Double = 50
    @State var oexxeinMiningDurabilityReduction:Double = 3.0
    @State var oexxeinMiningTime = DispatchTimeInterval.seconds(9)
    @State var oexxeinMined:Int = 0
    //PROGRENIUM ORE
    @State var progreniumMiningLevel:Int = 1
    @State var progreniumMinimumMiningLevel:Int = 90
    @State var progreniumMiningExp:Double = 1
    @State var progreniumMinimumMining:Double = 0
    @State var progreniumMaximumMining:Double = 50
    @State var progreniumMiningDurabilityReduction:Double = 3.5
    @State var progreniumMiningTime = DispatchTimeInterval.seconds(10)
    @State var progreniumMined:Int = 0
    //GLOBAL
    @State var oreMiningChoice:Ores = .none
    @State private var start: Bool = false
    //let impactMed = UIImpactFeedbackGenerator(style: .rigid)
    @State private var trigger = false
   //@State var sheet:Bool = false
    
    
    
    
    var body: some View {
        NavigationStack {
            ViewThatFits(in: .horizontal) {
                VStack {
                    VStack {
                        //title
                        Text("Mining")
                            .textCase(.uppercase)
                            .font(.system(size: 50))
                            .foregroundStyle(.white)
                            .fontWeight(.heavy)
                        //user level
                        HStack {
                            Text("Level: ")
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                                .fontWeight(.heavy)
                            Text(user.miningLevel, format: .number)
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                        }
                        //user gold
                        HStack {
                            HStack {
                                Image(.goldCoin)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text(user.gold,format: .number)
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    List {
                        //XP
                        Section(header:  Text("Experience").foregroundStyle(.yellow).fontWeight(.bold)) {
                            HStack {
                                Text("XP")
                                    .fontWeight(.heavy)
                                Spacer()
                                ProgressView(value: user.minimumMiningExperience, total: user.maximumMiningExperience)
                                    .progressViewStyle(XPCrafting(minimum: user.minimumMiningExperience, maximum: user.maximumMiningExperience))
                                    .frame(maxWidth:350,maxHeight: 30)
                            }
                        }
                        //PICKAXE
                        Section(header:  Text("Pickaxe").foregroundStyle(.yellow).fontWeight(.bold))  {
                            //pickaxe
                            NavigationLink(destination: PickaxeUpgradeView(user: user)) {
                                VStack {
                                    HStack {
                                        Image(uiImage: user.PickaxeEquipped.image)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        Text(user.PickaxeEquipped.name)
                                            .fontWeight(.bold)
                                            .frame(width: 320, height: 30)
                                            .lineLimit(2)
                                            .minimumScaleFactor(0.01)
                                    }
                                    HStack {
                                        Text("Effect:")
                                            .foregroundStyle(.blue)
                                            .font(.system(size: 10))
                                        Spacer()
                                        Text(user.PickaxeEquipped.effect.rawValue)
                                            .font(.system(size: 10))
                                            .fontWeight(.light)
                                            .frame(width: 320, height: 30)
                                            .lineLimit(2)
                                            .minimumScaleFactor(0.01)
                                    }
                                    ProgressView(value: user.PickaxeEquipped.minimumDurability, total: user.PickaxeEquipped.maximumDurability)
                                        .progressViewStyle(DurabilityProgressView(minimum: user.PickaxeEquipped.minimumDurability, maximum: user.PickaxeEquipped.maximumDurability, barColor: .brown))
                                        .frame(maxWidth:350,maxHeight: 30)
                                }
                            }
                        }
                        //ORE STOCK
                        Section(header: Text("Stock").foregroundStyle(.yellow).fontWeight(.bold)) {
                            VStack {
                                Text("Tap Ore to sell")
                                    .font(.system(size: 10))
                                    .fontWeight(.bold)
                                HStack{
                                    VStack {
                                        Image("copper")
                                        Text(copperMined,format: .number)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 30)
                                    }
                                    .onTapGesture {
                                        if copperMined > 0 {
                                            user.gold += copperMined * 2
                                            copperMined = 0
                                        }
                                        else if copperMined == 0 {
                                            //shake
                                        }
                                    }
                                    VStack {
                                        Image("tin")
                                        Text(tinMined,format: .number)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 30)
                                    }
                                    .onTapGesture {
                                        if tinMined > 0 {
                                            user.gold += tinMined * 2
                                            tinMined = 0
                                        }
                                        else if tinMined == 0 {
                                            //shake
                                        }
                                    }
                                    VStack {
                                        Image("iron")
                                        Text(ironMined,format: .number)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 30)
                                    }
                                    .onTapGesture {
                                        if ironMined > 0 {
                                            user.gold += ironMined * 2
                                            ironMined = 0
                                        }
                                        else if ironMined == 0 {
                                            //shake
                                        }
                                    }
                                    VStack {
                                        Image("gold")
                                        Text(goldMined,format: .number)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 30)
                                    }
                                    .onTapGesture {
                                        if goldMined > 0 {
                                            user.gold += goldMined * 2
                                            goldMined = 0
                                        }
                                        else if goldMined == 0 {
                                            //shake
                                        }
                                    }
                                    VStack {
                                        Image("mithril")
                                        Text(mithrilMined,format: .number)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 30)
                                    }
                                    .onTapGesture {
                                        if mithrilMined > 0 {
                                            user.gold += mithrilMined * 2
                                            mithrilMined = 0
                                        }
                                        else if mithrilMined == 0 {
                                            //shake
                                        }
                                    }
                                    VStack {
                                        Image("eternium")
                                        Text(eterniumMined,format: .number)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 30)
                                    }
                                    .onTapGesture {
                                        if eterniumMined > 0 {
                                            user.gold += eterniumMined * 2
                                            eterniumMined = 0
                                        }
                                        else if eterniumMined == 0 {
                                            //shake
                                        }
                                    }
                                    VStack {
                                        Image("obsidian")
                                        Text(obsidianMined,format: .number)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 30)
                                    }
                                    .onTapGesture {
                                        if obsidianMined > 0 {
                                            user.gold += obsidianMined * 2
                                            obsidianMined = 0
                                        }
                                        else if obsidianMined == 0 {
                                            //shake
                                        }
                                    }
                                    VStack {
                                        Image("empyrium")
                                        Text(empyriumMined,format: .number)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 30)
                                    }
                                    .onTapGesture {
                                        if empyriumMined > 0 {
                                            user.gold += empyriumMined * 2
                                            empyriumMined = 0
                                        }
                                        else if empyriumMined == 0 {
                                            //shake
                                        }
                                    }
                                    VStack {
                                        Image("oexxein")
                                        Text(oexxeinMined,format: .number)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 30)
                                    }
                                    .onTapGesture {
                                        if oexxeinMined > 0 {
                                            user.gold += oexxeinMined * 2
                                            oexxeinMined = 0
                                        }
                                        else if oexxeinMined == 0 {
                                            //shake
                                        }
                                    }
                                    VStack {
                                        Image("progrenium")
                                        Text(progreniumMined,format: .number)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 30)
                                    }
                                    .onTapGesture {
                                        if progreniumMined > 0 {
                                            user.gold += progreniumMined * 2
                                            progreniumMined = 0
                                        }
                                        else if progreniumMined == 0 {
                                            //shake
                                        }
                                    }
                                }
                            }
                        }
                        //ORE MINING
                        Section(header:  Text("Ore").foregroundStyle(.yellow).fontWeight(.bold))  {
                            //copper
                            VStack {
                                HStack {
                                    Text("Copper Ore")
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack {
                                        Text("Lvl:")
                                            .font(.system(size: 15))
                                        Text(copperMiningLevel,format: .number)
                                            .font(.system(size: 15))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 40, height: 20, alignment: .leading)
                                    }
                                }
                                HStack {
                                    Text("min lvl: \(copperMinimumMiningLevel, format: .number)")
                                        .font(.system(size: 10))
                                    Text(" - ")
                                    Text("durability loss: \(copperMiningDurabilityReduction, format: .number)")
                                        .font(.system(size: 10))
                                }
                                HStack {
                                    Image("copper")
                                    Spacer()
                                    ProgressView(value: copperMinimumMining, total: copperMaximumMining)
                                        .progressViewStyle(MiningProgressBar(minimum: copperMinimumMining, maximum: copperMaximumMining, ore: .copper))
                                        .frame(maxWidth:350,maxHeight: 30)
                                        .onTapGesture {
                                            if user.miningLevel >= copperMinimumMiningLevel {
                                                if oreMiningChoice != .copper {
                                                    oreMiningChoice = .copper
                                                    copperMining()
                                                }
                                                else if oreMiningChoice == .copper {
                                                    oreMiningChoice = .none
                                                }
                                            }
                                            else {
                                                print("not high enough")
                                                start = true
                                                trigger.toggle()
                                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                                    start = false
                                                }
                                            }
                                        }
                                }
                            }
                            //tin
                            VStack {
                                HStack {
                                    Text("Tin Ore")
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack {
                                        Text("Lvl:")
                                            .font(.system(size: 15))
                                        Text(tinMiningLevel,format: .number)
                                            .font(.system(size: 15))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 40, height: 20, alignment: .leading)
                                    }
                                }
                                HStack {
                                    Text("min lvl: \(tinMinimumMiningLevel, format: .number)")
                                        .font(.system(size: 10))
                                    Text(" - ")
                                    Text("durability loss: \(tinMiningDurabilityReduction, format: .number)")
                                        .font(.system(size: 10))
                                }
                                HStack {
                                    Image("tin")
                                    Spacer()
                                    ProgressView(value: tinMinimumMining, total: tinMaximumMining)
                                        .progressViewStyle(MiningProgressBar(minimum: tinMinimumMining, maximum: tinMaximumMining, ore: .tin))
                                        .frame(maxWidth:350,maxHeight: 30)
                                        .onTapGesture {
                                            if user.miningLevel >= tinMinimumMiningLevel {
                                                if oreMiningChoice != .tin {
                                                    oreMiningChoice = .tin
                                                    tinMining()
                                                }
                                                else if oreMiningChoice == .tin {
                                                    oreMiningChoice = .none
                                                }
                                            }
                                            else {
                                                print("not high enough")
                                                start = true
                                                trigger.toggle()
                                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                                    start = false
                                                }
                                            }
                                        }
                                }
                            }
                            //iron
                            VStack {
                                HStack {
                                    Text("Iron Ore")
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack {
                                        Text("Lvl:")
                                            .font(.system(size: 15))
                                        Text(ironMiningLevel,format: .number)
                                            .font(.system(size: 15))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 40, height: 20, alignment: .leading)
                                    }
                                }
                                HStack {
                                    Text("min lvl: \(ironMinimumMiningLevel, format: .number)")
                                        .font(.system(size: 10))
                                    Text(" - ")
                                    Text("durability loss: \(ironMiningDurabilityReduction, format: .number)")
                                        .font(.system(size: 10))
                                }
                                HStack {
                                    Image("iron")
                                    Spacer()
                                    ProgressView(value: ironMinimumMining, total: ironMaximumMining)
                                        .progressViewStyle(MiningProgressBar(minimum: ironMinimumMining, maximum: ironMaximumMining, ore: .iron))
                                        .frame(maxWidth:350,maxHeight: 30)
                                        .onTapGesture {
                                            if user.miningLevel >= ironMinimumMiningLevel {
                                                if oreMiningChoice != .iron {
                                                    oreMiningChoice = .iron
                                                    ironMining()
                                                }
                                                else if oreMiningChoice == .iron {
                                                    oreMiningChoice = .none
                                                }
                                            }
                                            else {
                                                print("not high enough")
                                                start = true
                                                trigger.toggle()
                                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                                    start = false
                                                }
                                            }
                                        }
                                }
                            }
                            //gold
                            VStack {
                                HStack {
                                    Text("Gold Ore")
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack {
                                        Text("Lvl:")
                                            .font(.system(size: 15))
                                        Text(goldMiningLevel,format: .number)
                                            .font(.system(size: 15))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 40, height: 20, alignment: .leading)
                                    }
                                }
                                HStack {
                                    Text("min lvl: \(goldMinimumMiningLevel, format: .number)")
                                        .font(.system(size: 10))
                                    Text(" - ")
                                    Text("durability loss: \(goldMiningDurabilityReduction, format: .number)")
                                        .font(.system(size: 10))
                                }
                                HStack {
                                    Image("gold")
                                    Spacer()
                                    ProgressView(value: goldMinimumMining, total: goldMaximumMining)
                                        .progressViewStyle(MiningProgressBar(minimum: goldMinimumMining, maximum: goldMaximumMining, ore: .gold))
                                        .frame(maxWidth:350,maxHeight: 30)
                                        .onTapGesture {
                                            if user.miningLevel >= goldMinimumMiningLevel {
                                                if oreMiningChoice != .gold {
                                                    oreMiningChoice = .gold
                                                    goldMining()
                                                }
                                                else if oreMiningChoice == .gold {
                                                    oreMiningChoice = .none
                                                }
                                            }
                                            else {
                                                print("not high enough")
                                                start = true
                                                trigger.toggle()
                                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                                    start = false
                                                }
                                            }
                                        }
                                }
                            }
                            //mithril
                            VStack {
                                HStack {
                                    Text("Mithril Ore")
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack {
                                        Text("Lvl:")
                                            .font(.system(size: 15))
                                        Text(mithrilMiningLevel,format: .number)
                                            .font(.system(size: 15))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 40, height: 20, alignment: .leading)
                                    }
                                }
                                HStack {
                                    Text("min lvl: \(mithrilMinimumMiningLevel, format: .number)")
                                        .font(.system(size: 10))
                                    Text(" - ")
                                    Text("durability loss: \(mithrilMiningDurabilityReduction, format: .number)")
                                        .font(.system(size: 10))
                                }
                                HStack {
                                    Image("mithril")
                                    Spacer()
                                    ProgressView(value: mithrilMinimumMining, total: mithrilMaximumMining)
                                        .progressViewStyle(MiningProgressBar(minimum: mithrilMinimumMining, maximum: mithrilMaximumMining, ore: .mithril))
                                        .frame(maxWidth:350,maxHeight: 30)
                                        .onTapGesture {
                                            if user.miningLevel >= mithrilMinimumMiningLevel {
                                                if oreMiningChoice != .mithril {
                                                    oreMiningChoice = .mithril
                                                    mithrilMining()
                                                }
                                                else if oreMiningChoice == .mithril {
                                                    oreMiningChoice = .none
                                                }
                                            }
                                            else {
                                                print("not high enough")
                                                start = true
                                                trigger.toggle()
                                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                                    start = false
                                                }
                                            }
                                        }
                                }
                            }
                            //eternium
                            VStack {
                                HStack {
                                    Text("Eternium Ore")
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack {
                                        Text("Lvl:")
                                            .font(.system(size: 15))
                                        Text(eterniumMiningLevel,format: .number)
                                            .font(.system(size: 15))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 40, height: 20, alignment: .leading)
                                    }
                                }
                                HStack {
                                    Text("min lvl: \(eterniumMinimumMiningLevel, format: .number)")
                                        .font(.system(size: 10))
                                    Text(" - ")
                                    Text("durability loss: \(eterniumMiningDurabilityReduction, format: .number)")
                                        .font(.system(size: 10))
                                }
                                HStack {
                                    Image("eternium")
                                    Spacer()
                                    ProgressView(value: eterniumMinimumMining, total: eterniumMaximumMining)
                                        .progressViewStyle(MiningProgressBar(minimum: eterniumMinimumMining, maximum: eterniumMaximumMining, ore: .eternium))
                                        .frame(maxWidth:350,maxHeight: 30)
                                        .onTapGesture {
                                            if user.miningLevel >= eterniumMinimumMiningLevel {
                                                if oreMiningChoice != .eternium {
                                                    oreMiningChoice = .eternium
                                                    eterniumMining()
                                                }
                                                else if oreMiningChoice == .eternium {
                                                    oreMiningChoice = .none
                                                }
                                            }
                                            else {
                                                print("not high enough")
                                                start = true
                                                trigger.toggle()
                                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                                    start = false
                                                }
                                            }
                                        }
                                }
                            }
                            //obsidian
                            VStack {
                                HStack {
                                    Text("Obsidian Ore")
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack {
                                        Text("Lvl:")
                                            .font(.system(size: 15))
                                        Text(obsidianMiningLevel,format: .number)
                                            .font(.system(size: 15))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 40, height: 20, alignment: .leading)
                                    }
                                }
                                HStack {
                                    Text("min lvl: \(obsidianMinimumMiningLevel, format: .number)")
                                        .font(.system(size: 10))
                                    Text(" - ")
                                    Text("durability loss: \(obsidianMiningDurabilityReduction, format: .number)")
                                        .font(.system(size: 10))
                                }
                                HStack {
                                    Image("obsidian")
                                    Spacer()
                                    ProgressView(value: obsidianMinimumMining, total: obsidianMaximumMining)
                                        .progressViewStyle(MiningProgressBar(minimum: obsidianMinimumMining, maximum: obsidianMaximumMining, ore: .obsidian))
                                        .frame(maxWidth:350,maxHeight: 30)
                                        .onTapGesture {
                                            if user.miningLevel >= obsidianMinimumMiningLevel {
                                                if oreMiningChoice != .obsidian {
                                                    oreMiningChoice = .obsidian
                                                    obsidianMining()
                                                }
                                                else if oreMiningChoice == .obsidian {
                                                    oreMiningChoice = .none
                                                }
                                            }
                                            else {
                                                print("not high enough")
                                                start = true
                                                trigger.toggle()
                                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                                    start = false
                                                }
                                            }
                                        }
                                }
                            }
                            //empyrium
                            VStack {
                                HStack {
                                    Text("Empyrium Ore")
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack {
                                        Text("Lvl:")
                                            .font(.system(size: 15))
                                        Text(empyriumMiningLevel,format: .number)
                                            .font(.system(size: 15))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 40, height: 20, alignment: .leading)
                                    }
                                }
                                HStack {
                                    Text("min lvl: \(empyriumMinimumMiningLevel, format: .number)")
                                        .font(.system(size: 10))
                                    Text(" - ")
                                    Text("durability loss: \(empyriumMiningDurabilityReduction, format: .number)")
                                        .font(.system(size: 10))
                                }
                                HStack {
                                    Image("empyrium")
                                    Spacer()
                                    ProgressView(value: empyriumMinimumMining, total: empyriumMaximumMining)
                                        .progressViewStyle(MiningProgressBar(minimum: empyriumMinimumMining, maximum: empyriumMaximumMining, ore: .empyrium))
                                        .frame(maxWidth:350,maxHeight: 30)
                                        .onTapGesture {
                                            if user.miningLevel >= empyriumMinimumMiningLevel {
                                                if oreMiningChoice != .empyrium {
                                                    oreMiningChoice = .empyrium
                                                    empyriumMining()
                                                }
                                                else if oreMiningChoice == .empyrium {
                                                    oreMiningChoice = .none
                                                }
                                            }
                                            else {
                                                print("not high enough")
                                                start = true
                                                trigger.toggle()
                                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                                    start = false
                                                }
                                            }
                                        }
                                }
                            }
                            //oexxein
                            VStack {
                                HStack {
                                    Text("Oexxein Ore")
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack {
                                        Text("Lvl:")
                                            .font(.system(size: 15))
                                        Text(oexxeinMiningLevel,format: .number)
                                            .font(.system(size: 15))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 40, height: 20, alignment: .leading)
                                    }
                                }
                                HStack {
                                    Text("min lvl: \(oexxeinMinimumMiningLevel, format: .number)")
                                        .font(.system(size: 10))
                                    Text(" - ")
                                    Text("durability loss: \(oexxeinMiningDurabilityReduction, format: .number)")
                                        .font(.system(size: 10))
                                }
                                HStack {
                                    Image("oexxein")
                                    Spacer()
                                    ProgressView(value: oexxeinMinimumMining, total: oexxeinMaximumMining)
                                        .progressViewStyle(MiningProgressBar(minimum: oexxeinMinimumMining, maximum: oexxeinMaximumMining, ore: .oexxein))
                                        .frame(maxWidth:350,maxHeight: 30)
                                        .onTapGesture {
                                            if user.miningLevel >= oexxeinMinimumMiningLevel {
                                                if oreMiningChoice != .oexxein {
                                                    oreMiningChoice = .oexxein
                                                    oexxeinMining()
                                                }
                                                else if oreMiningChoice == .oexxein {
                                                    oreMiningChoice = .none
                                                }
                                            }
                                            else {
                                                print("not high enough")
                                                start = true
                                                trigger.toggle()
                                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                                    start = false
                                                }
                                            }
                                        }
                                }
                            }
                            //progrenium
                            VStack {
                                HStack {
                                    Text("Progrenium Ore")
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack {
                                        Text("Lvl:")
                                            .font(.system(size: 15))
                                        Text(progreniumMiningLevel,format: .number)
                                            .font(.system(size: 15))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.01)
                                            .frame(width: 40, height: 20, alignment: .leading)
                                    }
                                }
                                HStack {
                                    Text("min lvl: \(progreniumMinimumMiningLevel, format: .number)")
                                        .font(.system(size: 10))
                                    Text(" - ")
                                    Text("durability loss: \(progreniumMiningDurabilityReduction, format: .number)")
                                        .font(.system(size: 10))
                                }
                                HStack {
                                    Image("progrenium")
                                    Spacer()
                                    ProgressView(value: progreniumMinimumMining, total: progreniumMaximumMining)
                                        .progressViewStyle(MiningProgressBar(minimum: progreniumMinimumMining, maximum: progreniumMaximumMining, ore: .progrenium))
                                        .frame(maxWidth:350,maxHeight: 30)
                                        .onTapGesture {
                                            if user.miningLevel >= progreniumMinimumMiningLevel {
                                                if oreMiningChoice != .progrenium {
                                                    oreMiningChoice = .progrenium
                                                    progreniumMining()
                                                }
                                                else if oreMiningChoice == .progrenium {
                                                    oreMiningChoice = .none
                                                }
                                            }
                                            else {
                                                print("not high enough")
                                                start = true
                                                trigger.toggle()
                                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                                    start = false
                                                }
                                            }
                                        }
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
                .preferredColorScheme(.dark)
            }
        }
    }
}
















extension ContentView {
    //Checks to add experience or to level up mining level by +1
    func MiningExperienceLevelCheck(){
        var rollOverXp:Double = 0.0
        if user.minimumMiningExperience < user.maximumMiningExperience {
            user.minimumMiningExperience += user.xpGain
        }
        else if user.minimumMiningExperience >= user.maximumMiningExperience {
            rollOverXp = user.minimumMiningExperience - user.maximumMiningExperience
            user.minimumMiningExperience = 0
            user.minimumMiningExperience += rollOverXp
            user.miningLevel += 1
            user.gold += 100
        }
    }
    //
    func copperMining(){
        if oreMiningChoice == .copper {
            DispatchQueue.main.asyncAfter(deadline: .now() + copperMiningTime){
                if user.PickaxeEquipped.minimumDurability > 0.1 {
                    if copperMinimumMining == copperMaximumMining {
                        user.PickaxeEquipped.minimumDurability -= copperMiningDurabilityReduction
                        copperMiningLevel += 1
                        copperMinimumMining = 0
                        copperMined += Int.random(in: 1...3)
                        MiningExperienceLevelCheck()
                        copperMining()
                    }
                    else if copperMinimumMining < copperMaximumMining {
                        copperMinimumMining += 1
                        user.PickaxeEquipped.minimumDurability  -= copperMiningDurabilityReduction
                        MiningExperienceLevelCheck()
                        copperMining()
                    }
                }
                else if user.PickaxeEquipped.maximumDurability <= 0.1 {
                    user.PickaxeEquipped.minimumDurability = 0
                    print("copper mining stopped")
                }
            }
        }
        else {
            print("not mining ore")
        }
    }
    //
    func tinMining(){
        if oreMiningChoice == .tin {
            DispatchQueue.main.asyncAfter(deadline: .now() + tinMiningTime){
                if user.PickaxeEquipped.minimumDurability > 0.1 {
                    if tinMinimumMining == tinMaximumMining {
                        user.PickaxeEquipped.minimumDurability -= tinMiningDurabilityReduction
                        tinMiningLevel += 1
                        tinMinimumMining = 0
                        tinMined += Int.random(in: 1...3)
                        MiningExperienceLevelCheck()
                        tinMining()
                    }
                    else if tinMinimumMining < tinMaximumMining {
                        tinMinimumMining += 1
                        user.PickaxeEquipped.minimumDurability -= tinMiningDurabilityReduction
                        MiningExperienceLevelCheck()
                        tinMining()
                    }
                }
                else if user.PickaxeEquipped.maximumDurability <= 0.1 {
                    user.PickaxeEquipped.minimumDurability = 0
                    print("tin mining stopped")
                }
            }
        }
        else {
            print("not mining ore")
        }
    }
    //
    func ironMining(){
        if oreMiningChoice == .iron {
            DispatchQueue.main.asyncAfter(deadline: .now() + ironMiningTime){
                if user.PickaxeEquipped.minimumDurability > 0.1 {
                    if ironMinimumMining == ironMaximumMining {
                        user.PickaxeEquipped.minimumDurability -= ironMiningDurabilityReduction
                        ironMiningLevel += 1
                        ironMinimumMining = 0
                        ironMined += Int.random(in: 1...3)
                        MiningExperienceLevelCheck()
                        ironMining()
                    }
                    else if ironMinimumMining < ironMaximumMining {
                        ironMinimumMining += 1
                        user.PickaxeEquipped.minimumDurability -= ironMiningDurabilityReduction
                        MiningExperienceLevelCheck()
                        ironMining()
                    }
                }
                else if user.PickaxeEquipped.maximumDurability <= 0.1 {
                    user.PickaxeEquipped.minimumDurability = 0
                    print("iron mining stopped")
                }
            }
        }
        else {
            print("not mining ore")
        }
    }
    //
    func goldMining(){
        if oreMiningChoice == .gold {
            DispatchQueue.main.asyncAfter(deadline: .now() + goldMiningTime){
                if user.PickaxeEquipped.minimumDurability > 0.1 {
                    if goldMinimumMining == goldMaximumMining {
                        user.PickaxeEquipped.minimumDurability -= goldMiningDurabilityReduction
                        goldMiningLevel += 1
                        goldMinimumMining = 0
                        goldMined += Int.random(in: 1...3)
                        MiningExperienceLevelCheck()
                        goldMining()
                    }
                    else if goldMinimumMining < goldMaximumMining {
                        goldMinimumMining += 1
                        user.PickaxeEquipped.minimumDurability -= goldMiningDurabilityReduction
                        MiningExperienceLevelCheck()
                        goldMining()
                    }
                }
                else if user.PickaxeEquipped.maximumDurability <= 0.1 {
                    user.PickaxeEquipped.minimumDurability = 0
                    print("gold mining stopped")
                }
            }
        }
        else {
            print("not mining ore")
        }
    }
    //
    func mithrilMining(){
        if oreMiningChoice == .mithril {
            DispatchQueue.main.asyncAfter(deadline: .now() + mithrilMiningTime){
                if user.PickaxeEquipped.minimumDurability > 0.1 {
                    if mithrilMinimumMining == mithrilMaximumMining {
                        user.PickaxeEquipped.minimumDurability -= mithrilMiningDurabilityReduction
                        mithrilMiningLevel += 1
                        mithrilMinimumMining = 0
                        mithrilMined += Int.random(in: 1...3)
                        MiningExperienceLevelCheck()
                        mithrilMining()
                    }
                    else if mithrilMinimumMining < mithrilMaximumMining {
                        mithrilMinimumMining += 1
                        user.PickaxeEquipped.minimumDurability -= mithrilMiningDurabilityReduction
                        MiningExperienceLevelCheck()
                        mithrilMining()
                    }
                }
                else if user.PickaxeEquipped.maximumDurability <= 0.1 {
                    user.PickaxeEquipped.minimumDurability = 0
                    print("mithril mining stopped")
                }
            }
        }
        else {
            print("not mining ore")
        }
    }
    //
    func eterniumMining(){
        if oreMiningChoice == .eternium {
            DispatchQueue.main.asyncAfter(deadline: .now() + eterniumMiningTime){
                if user.PickaxeEquipped.minimumDurability > 0.1 {
                    if eterniumMinimumMining == eterniumMaximumMining {
                        user.PickaxeEquipped.minimumDurability -= eterniumMiningDurabilityReduction
                        eterniumMiningLevel += 1
                        eterniumMinimumMining = 0
                        eterniumMined += Int.random(in: 1...2)
                        MiningExperienceLevelCheck()
                        eterniumMining()
                    }
                    else if eterniumMinimumMining < eterniumMaximumMining {
                        eterniumMinimumMining += 1
                        user.PickaxeEquipped.minimumDurability -= eterniumMiningDurabilityReduction
                        MiningExperienceLevelCheck()
                        eterniumMining()
                    }
                }
                else if user.PickaxeEquipped.maximumDurability <= 0.1 {
                    user.PickaxeEquipped.minimumDurability = 0
                    print("eternium mining stopped")
                }
            }
        }
        else {
            print("not mining ore")
        }
    }
    //
    func obsidianMining(){
        if oreMiningChoice == .obsidian {
            DispatchQueue.main.asyncAfter(deadline: .now() + obsidianMiningTime){
                if user.PickaxeEquipped.minimumDurability > 0.1 {
                    if obsidianMinimumMining == obsidianMaximumMining {
                        user.PickaxeEquipped.minimumDurability -= obsidianMiningDurabilityReduction
                        obsidianMiningLevel += 1
                        obsidianMinimumMining = 0
                        obsidianMined += Int.random(in: 1...2)
                        MiningExperienceLevelCheck()
                        obsidianMining()
                    }
                    else if obsidianMinimumMining < obsidianMaximumMining {
                        obsidianMinimumMining += 1
                        user.PickaxeEquipped.minimumDurability -= obsidianMiningDurabilityReduction
                        MiningExperienceLevelCheck()
                        obsidianMining()
                    }
                }
                else if user.PickaxeEquipped.maximumDurability <= 0.1 {
                    user.PickaxeEquipped.minimumDurability = 0
                    print("obsidian mining stopped")
                }
            }
        }
        else {
            print("not mining ore")
        }
    }
    //
    func empyriumMining(){
        if oreMiningChoice == .empyrium {
            DispatchQueue.main.asyncAfter(deadline: .now() + empyriumMiningTime){
                if user.PickaxeEquipped.minimumDurability > 0.1 {
                    if empyriumMinimumMining == empyriumMaximumMining {
                        user.PickaxeEquipped.minimumDurability -= empyriumMiningDurabilityReduction
                        empyriumMiningLevel += 1
                        empyriumMinimumMining = 0
                        empyriumMined += Int.random(in: 1...2)
                        MiningExperienceLevelCheck()
                        empyriumMining()
                    }
                    else if empyriumMinimumMining < empyriumMaximumMining {
                        empyriumMinimumMining += 1
                        user.PickaxeEquipped.minimumDurability -= empyriumMiningDurabilityReduction
                        MiningExperienceLevelCheck()
                        empyriumMining()
                    }
                }
                else if user.PickaxeEquipped.maximumDurability <= 0.1 {
                    user.PickaxeEquipped.minimumDurability = 0
                    print("empyrium mining stopped")
                }
            }
        }
        else {
            print("not mining ore")
        }
    }
    //
    func oexxeinMining(){
        if oreMiningChoice == .oexxein {
            DispatchQueue.main.asyncAfter(deadline: .now() + oexxeinMiningTime){
                if user.PickaxeEquipped.minimumDurability > 0.1 {
                    if oexxeinMinimumMining == oexxeinMaximumMining {
                        user.PickaxeEquipped.minimumDurability -= oexxeinMiningDurabilityReduction
                        oexxeinMiningLevel += 1
                        oexxeinMinimumMining = 0
                        oexxeinMined += Int.random(in: 1...2)
                        MiningExperienceLevelCheck()
                        oexxeinMining()
                    }
                    else if oexxeinMinimumMining < oexxeinMaximumMining {
                        oexxeinMinimumMining += 1
                        user.PickaxeEquipped.minimumDurability -= oexxeinMiningDurabilityReduction
                        MiningExperienceLevelCheck()
                        oexxeinMining()
                    }
                }
                else if user.PickaxeEquipped.maximumDurability <= 0.1 {
                    user.PickaxeEquipped.minimumDurability = 0
                    print("oexxein mining stopped")
                }
            }
        }
        else {
            print("not mining ore")
        }
    }
    //
    func progreniumMining(){
        if oreMiningChoice == .progrenium {
            DispatchQueue.main.asyncAfter(deadline: .now() + progreniumMiningTime){
                if user.PickaxeEquipped.minimumDurability > 0.1 {
                    if progreniumMinimumMining == progreniumMaximumMining {
                        user.PickaxeEquipped.minimumDurability -= progreniumMiningDurabilityReduction
                        progreniumMiningLevel += 1
                        progreniumMinimumMining = 0
                        progreniumMined += Int.random(in: 1...2)
                        MiningExperienceLevelCheck()
                        progreniumMining()
                    }
                    else if progreniumMinimumMining < progreniumMaximumMining {
                        progreniumMinimumMining += 1
                        user.PickaxeEquipped.minimumDurability -= progreniumMiningDurabilityReduction
                        MiningExperienceLevelCheck()
                        progreniumMining()
                    }
                }
                else if user.PickaxeEquipped.maximumDurability <= 0.1 {
                    user.PickaxeEquipped.minimumDurability = 0
                    print("progrenium mining stopped")
                }
            }
        }
        else {
            print("not mining ore")
        }
    }
}













#Preview {
    ContentView()
}
