//
//  FavoritosViewModel.swift
//  Pay-me
//
//  Created by Cristian on 25/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class FavoritosViewModel {
    
    func observableFavoritos() -> Observable<[Favorito]> {
        return Observable.create { observer in
            PaymeService.getFavoritos(completion: { result in
                switch result {
                case .success(let favoritos):
                    observer.onNext(favoritos)
                case .failure(let error):
                    observer.onError(error)
                }
                observer.onCompleted()
            })
            return Disposables.create()
        }
    }
    
    func observableRecibos(favorito: Favorito) -> Observable<(Favorito, [Debt])> {
        return Observable.create { observer in
            PaymeService.getReceipts(favorito: favorito, completion: { result in
                switch result {
                case .success(let tuple):
                    let debts = tuple.services.filter({$0.idServiceSPS == favorito.idServiceSPS}).first!.debts
                    observer.onNext((favorito, debts))
                case .failure(let error):
                    observer.onError(error)
                }
                observer.onCompleted()
            })
            return Disposables.create()
        }
    }
}
