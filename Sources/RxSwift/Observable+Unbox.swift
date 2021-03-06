//
//  Observable+Unbox.swift
//  Moya-Unbox
//
//  Created by Ryoga Kitagawa on 9/12/16.
//  Copyright © 2016 Ryoga Kitagawa. All rights reserved.
//

import Foundation
import RxSwift
import RxMoya
import Moya
import Unbox

public extension ObservableType where E == Response {
    public func unbox<T: Unboxable>(object: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.unbox(object: T.self))
        }
    }

    public func unbox<T: Unboxable>(object: T.Type, atKey: String) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.unbox(object: T.self, atKey: atKey))
        }
    }

    public func unbox<T: Unboxable>(object: T.Type, atKeyPath: String) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.unbox(object: T.self, atKeyPath: atKeyPath))
        }
    }

    public func unbox<T: Unboxable>(array: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.unbox(array: T.self))
        }
    }

    public func unbox<T: Unboxable>(array: T.Type, atKey: String) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.unbox(array: T.self, atKey: atKey))
        }
    }

    public func unbox<T: Unboxable>(array: T.Type, atKeyPath: String) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.unbox(array: T.self, atKeyPath: atKeyPath))
        }
    }
}
