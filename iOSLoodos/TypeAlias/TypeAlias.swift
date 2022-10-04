//
//  TypeAlias.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun  on 30.09.2022.
//

import Foundation

typealias PublishedCallVoid = (() -> ())

typealias PublishedCall<T> = ((T) -> ())
