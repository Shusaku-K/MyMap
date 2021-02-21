//
//  ContentView.swift
//  MyMap
//
//  Created by 金城秀作 on 2021/02/13.
//　MapKitを利用してMapアプリを開発
//  完成図
//  1.検索キーワードを入力
//  2.キーワードから緯度経度を検索
//  3.緯度経度から画面にピンを生成
//  4.ピンを地図画面に貼り付ける

import SwiftUI
import MapKit

struct ContentView: View {
    
    // 入力中の文字列を保持する状態変数
    @State var inputText:String = ""
    // 検索キーワードを保持する状態変数
    @State var dispSearchKey:String = ""
    // 検索キーワードを保持する状態変数
    @State var dispMapType:MKMapType = .standard
    
    var body: some View {
        
        VStack {
            // テキストフィールド（文字入力画面）
            TextField("キーワードを入力してください", text: $inputText , onCommit: {
                 // 入力が完了したので検索キーワードに設定する
                dispSearchKey = inputText
                // 検索キーワードをデバックエリアに出力する
                print("入力したキーワード：" + dispSearchKey)
            })
            .padding()
            
            // 奥から手前方向にレイアウト(右下基準で配置する)
            ZStack(alignment: .bottomTrailing) {
                
                // マップを表示
                MapView(searchKey:  dispSearchKey, mapType: dispMapType)
                // マップ種類切り替えボタン
                Button(action: {
                    
                    // mapTypeプロパティー値をトグル
                    //  標準 → 航空写真 → 航空写真+標準
                    //  → 3D Flyover → 3D Flyover+標準
                    //  → 交通機関
                    if dispMapType == .standard {
                        dispMapType = .satellite
                    } else if dispMapType == .satellite {
                        dispMapType = .hybrid
                    } else if dispMapType == .hybrid {
                        dispMapType = .satelliteFlyover
                    } else if dispMapType == .satelliteFlyover {
                        dispMapType = .hybridFlyover
                    } else if dispMapType == .hybridFlyover {
                        dispMapType = .mutedStandard
                    } else {
                        dispMapType = .standard
                                            
                    }
                }) {
                    // マップアイコン表示
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0, alignment: .leading)
                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
