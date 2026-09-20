//
//  FrameworkMessageProvider.swift
//  FrameworkProject
//
//  Created by NanbanTaro on 2025/07/27.
//  
//

import Foundation

public class FrameworkMessageProvider {
    public init() {}

    /// サンプルメッセージを返す
    /// - Returns: サンプルメッセージ
    public func getMessage() -> String {
        "Hello from Framework"
    }

    /// ランダムな数字を返す
    /// - Returns: ランダム値
    public func getRandomNumber() -> Int {
        Int.random(in: 0...100)
    }
}
