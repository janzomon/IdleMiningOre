//
//  PickaxeUpgradeView.swift
//  IdleMiningOre
//
//  Created by Damon gonzalez on 11/11/24.
//

import SwiftUI

struct PickaxeUpgradeView: View {
    @ObservedObject var user:User
    @State private var repairStartShake: Bool = false
    @State private var upgradeStartShake: Bool = false
    @State private var copperStartShake: Bool = false
    @State private var tinStartShake: Bool = false
    @State private var ironStartShake: Bool = false
    @State private var goldStartShake: Bool = false
    @State private var mithrilStartShake: Bool = false
    @State private var eterniumStartShake: Bool = false
    @State private var obsidianStartShake: Bool = false
    @State private var empyriumStartShake: Bool = false
    @State private var oexxeinStartShake: Bool = false
    @State private var progreniumStartShake: Bool = false
    var body: some View {
        NavigationStack {
            ViewThatFits(in: .horizontal){
                VStack {
                    VStack {
                        Text(user.PickaxeEquipped.name)
                            .fontWeight(.heavy)
                            .font(.system(size: 30))
                        Image(uiImage: user.PickaxeEquipped.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                        HStack {
                            Text("Durability:")
                                .fontWeight(.heavy)
                                .font(.system(size: 15))
                                .foregroundStyle(.brown)
                            Text("\(user.PickaxeEquipped.minimumDurability,format: .number)/\(user.PickaxeEquipped.maximumDurability,format: .number)")
                                .fontWeight(.semibold)
                                .font(.system(size: 15))
                        }
                        HStack {
                            Text("Effect:")
                                .fontWeight(.heavy)
                                .font(.system(size: 15))
                                .foregroundStyle(.blue)
                            Text(user.PickaxeEquipped.effect.rawValue)
                                .fontWeight(.semibold)
                                .font(.system(size: 15))
                        }
                        HStack {
                            Image(.goldCoin)
                            Text(user.gold,format: .number)
                        }
                    }
                    List {
                        Section(header:  Text("DURABILITY").foregroundStyle(.brown).fontWeight(.bold)){
                            //repair pickaxe
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Repair")
                                        .fontWeight(.bold)
                                    Text("Increase by x10")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 10))
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("50")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: repairStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 50 {
                                        if user.PickaxeEquipped.minimumDurability < user.PickaxeEquipped.maximumDurability {
                                            user.gold -= 50
                                            user.PickaxeEquipped.minimumDurability += 10
                                            if user.PickaxeEquipped.minimumDurability > user.PickaxeEquipped.maximumDurability {
                                                user.PickaxeEquipped.minimumDurability = user.PickaxeEquipped.maximumDurability
                                            }
                                        }
                                        else if user.PickaxeEquipped.minimumDurability == user.PickaxeEquipped.maximumDurability {
                                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                                repairStartShake = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                                repairStartShake = false
                                            }
                                        }
                                    }
                                    else if user.gold < 50 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            repairStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            repairStartShake = false
                                        }
                                    }
                                }
                            }
                            //upgrade durability
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Upgrade")
                                        .fontWeight(.bold)
                                    Text("Increase by x5")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 10))
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("100")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: upgradeStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 100 {
                                        user.gold -= 100
                                        user.PickaxeEquipped.maximumDurability += 5
                                    }
                                    else if user.gold < 100 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            upgradeStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            upgradeStartShake = false
                                        }
                                    }
                                }
                            }
                        }
                        Section(header:  Text("EFFECT").foregroundStyle(.blue).fontWeight(.bold)){
                            //copper effect
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Copper Mining")
                                        .fontWeight(.bold)
                                    HStack {
                                        Text("Effect:")
                                            .fontWeight(.bold)
                                            .font(.system(size: 10))
                                            .foregroundStyle(.blue)
                                        Text("copper mining speed +0.5")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 10))
                                    }
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("50")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: copperStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 50 {
                                        if user.PickaxeEquipped.effect == .copper {
                                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                                copperStartShake = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                                copperStartShake = false
                                            }
                                        }
                                        else {
                                            user.gold -= 50
                                            user.PickaxeEquipped.image = .copperPickaxe
                                            user.PickaxeEquipped.name = "Copper Pickaxe"
                                            user.PickaxeEquipped.effect = .copper
                                        }
                                    }
                                    else if user.gold < 50 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            copperStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            copperStartShake = false
                                        }
                                    }
                                }
                            }
                            //tin effect
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Tin Mining")
                                        .fontWeight(.bold)
                                    HStack {
                                        Text("Effect:")
                                            .fontWeight(.bold)
                                            .font(.system(size: 10))
                                            .foregroundStyle(.blue)
                                        Text("Tin mining speed +0.5")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 10))
                                    }
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("70")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: tinStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 70 {
                                        if user.PickaxeEquipped.effect == .tin {
                                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                                tinStartShake = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                                tinStartShake = false
                                            }
                                        }
                                        else {
                                            user.gold -= 70
                                            user.PickaxeEquipped.image = .tinPickaxe
                                            user.PickaxeEquipped.name = "Tin Pickaxe"
                                            user.PickaxeEquipped.effect = .tin
                                        }
                                    }
                                    else if user.gold < 70 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            tinStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            tinStartShake = false
                                        }
                                    }
                                }
                            }
                            //iron effect
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Iron Mining")
                                        .fontWeight(.bold)
                                    HStack {
                                        Text("Effect:")
                                            .fontWeight(.bold)
                                            .font(.system(size: 10))
                                            .foregroundStyle(.blue)
                                        Text("Iron mining speed +0.5")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 10))
                                    }
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("90")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: ironStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 90 {
                                        if user.PickaxeEquipped.effect == .iron {
                                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                                ironStartShake = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                                ironStartShake = false
                                            }
                                        }
                                        else {
                                            user.gold -= 90
                                            user.PickaxeEquipped.image = .ironPickaxe
                                            user.PickaxeEquipped.name = "Iron Pickaxe"
                                            user.PickaxeEquipped.effect = .iron
                                        }
                                    }
                                    else if user.gold < 90 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            ironStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            ironStartShake = false
                                        }
                                    }
                                }
                            }
                            //gold effect
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Gold Mining")
                                        .fontWeight(.bold)
                                    HStack {
                                        Text("Effect:")
                                            .fontWeight(.bold)
                                            .font(.system(size: 10))
                                            .foregroundStyle(.blue)
                                        Text("Gold mining speed +0.5")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 10))
                                    }
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("110")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: goldStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 110 {
                                        if user.PickaxeEquipped.effect == .gold {
                                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                                goldStartShake = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                                goldStartShake = false
                                            }
                                        }
                                        else {
                                            user.gold -= 110
                                            user.PickaxeEquipped.image = .goldPickaxe
                                            user.PickaxeEquipped.name = "Gold Pickaxe"
                                            user.PickaxeEquipped.effect = .gold
                                        }
                                    }
                                    else if user.gold < 110 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            goldStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            goldStartShake = false
                                        }
                                    }
                                }
                            }
                            //mithril effect
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Mithril Mining")
                                        .fontWeight(.bold)
                                    HStack {
                                        Text("Effect:")
                                            .fontWeight(.bold)
                                            .font(.system(size: 10))
                                            .foregroundStyle(.blue)
                                        Text("Mithril mining speed +0.5")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 10))
                                    }
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("130")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: mithrilStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 130 {
                                        if user.PickaxeEquipped.effect == .mithril {
                                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                                mithrilStartShake = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                                mithrilStartShake = false
                                            }
                                        }
                                        else {
                                            user.gold -= 130
                                            user.PickaxeEquipped.image = .mithrilPickaxe
                                            user.PickaxeEquipped.name = "Mithril Pickaxe"
                                            user.PickaxeEquipped.effect = .mithril
                                        }
                                    }
                                    else if user.gold < 130 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            mithrilStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            mithrilStartShake = false
                                        }
                                    }
                                }
                            }
                            //eternium effect
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Eternium Mining")
                                        .fontWeight(.bold)
                                    HStack {
                                        Text("Effect:")
                                            .fontWeight(.bold)
                                            .font(.system(size: 10))
                                            .foregroundStyle(.blue)
                                        Text("Eternium mining speed +0.5")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 10))
                                    }
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("150")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: eterniumStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 150 {
                                        if user.PickaxeEquipped.effect == .eternium {
                                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                                eterniumStartShake = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                                eterniumStartShake = false
                                            }
                                        }
                                        else {
                                            user.gold -= 150
                                            user.PickaxeEquipped.image = .eterniumPickaxe
                                            user.PickaxeEquipped.name = "Eterniumn Pickaxe"
                                            user.PickaxeEquipped.effect = .eternium
                                        }
                                    }
                                    else if user.gold < 150 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            eterniumStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            eterniumStartShake = false
                                        }
                                    }
                                }
                            }
                            //obsidian effect
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Obsidian Mining")
                                        .fontWeight(.bold)
                                    HStack {
                                        Text("Effect:")
                                            .fontWeight(.bold)
                                            .font(.system(size: 10))
                                            .foregroundStyle(.blue)
                                        Text("Obsidian mining speed +0.5")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 10))
                                    }
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("170")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: obsidianStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 170 {
                                        if user.PickaxeEquipped.effect == .obsidian {
                                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                                obsidianStartShake = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                                obsidianStartShake = false
                                            }
                                        }
                                        else {
                                            user.gold -= 170
                                            user.PickaxeEquipped.image = .obsidianPickaxe
                                            user.PickaxeEquipped.name = "Obsidian Pickaxe"
                                            user.PickaxeEquipped.effect = .obsidian
                                        }
                                    }
                                    else if user.gold < 170 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            obsidianStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            obsidianStartShake = false
                                        }
                                    }
                                }
                            }
                            //empyrium effect
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Empyrium Mining")
                                        .fontWeight(.bold)
                                    HStack {
                                        Text("Effect:")
                                            .fontWeight(.bold)
                                            .font(.system(size: 10))
                                            .foregroundStyle(.blue)
                                        Text("Empyrium mining speed +0.5")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 10))
                                    }
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("190")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: empyriumStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 190 {
                                        if user.PickaxeEquipped.effect == .empyrium {
                                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                                empyriumStartShake = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                                empyriumStartShake = false
                                            }
                                        }
                                        else {
                                            user.gold -= 190
                                            user.PickaxeEquipped.image = .empyriumPickaxe
                                            user.PickaxeEquipped.name = "Empyrium Pickaxe"
                                            user.PickaxeEquipped.effect = .empyrium
                                        }
                                    }
                                    else if user.gold < 190 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            empyriumStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            empyriumStartShake = false
                                        }
                                    }
                                }
                            }
                            //oexxein effect
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Oexxein Mining")
                                        .fontWeight(.bold)
                                    HStack {
                                        Text("Effect:")
                                            .fontWeight(.bold)
                                            .font(.system(size: 10))
                                            .foregroundStyle(.blue)
                                        Text("Oexxein mining speed +0.5")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 10))
                                    }
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("210")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: oexxeinStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 210 {
                                        if user.PickaxeEquipped.effect == .oexxein {
                                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                                oexxeinStartShake = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                                oexxeinStartShake = false
                                            }
                                        }
                                        else {
                                            user.gold -= 210
                                            user.PickaxeEquipped.image = .oexxeinPickaxe
                                            user.PickaxeEquipped.name = "Oexxein Pickaxe"
                                            user.PickaxeEquipped.effect = .oexxein
                                        }
                                    }
                                    else if user.gold < 210 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            oexxeinStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            oexxeinStartShake = false
                                        }
                                    }
                                }
                            }
                            //progrenium effect
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Progrenium Mining")
                                        .fontWeight(.bold)
                                    HStack {
                                        Text("Effect:")
                                            .fontWeight(.bold)
                                            .font(.system(size: 10))
                                            .foregroundStyle(.blue)
                                        Text("Progrenium mining speed +0.5")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 10))
                                    }
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30)
                                        .foregroundStyle(.blue)
                                    HStack {
                                        Text("230")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(.goldCoin)
                                    }
                                }
                                .offset(x: progreniumStartShake ? 30 : 0)
                                .onTapGesture {
                                    if user.gold >= 230 {
                                        if user.PickaxeEquipped.effect == .progrenium {
                                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                                progreniumStartShake = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                                progreniumStartShake = false
                                            }
                                        }
                                        else {
                                            user.gold -= 230
                                            user.PickaxeEquipped.image = .progreniumPickaxe
                                            user.PickaxeEquipped.name = "Progrenium Pickaxe"
                                            user.PickaxeEquipped.effect = .progrenium
                                        }
                                    }
                                    else if user.gold < 230 {
                                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)){
                                            progreniumStartShake = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now()){
                                            progreniumStartShake = false
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    PickaxeUpgradeView(user: User())
}
