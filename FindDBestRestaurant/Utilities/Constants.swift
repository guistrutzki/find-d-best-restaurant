//
//  Constants.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 21/08/21.
//

import UIKit

enum K {
    static let restaurants              = "Restaurantes"
    static let favorites                = "Favorites"
    static let top                      = "Top"
    static let enter                    = "Entrar"
    static let forgetMyPassword         = "Esqueci minha senha"
    static let signUp                   = "Cadastrar"
    static let ok                       = "Ok"
    static let accountCreated           = "Sua conta foi criada"
    static let accountSuccessMessage    = "Agora você já pode fazer login"
    static let signUpVCTitle            = "Cadastro"
    static let typeYourFullName         = "Digite seu nome completo"
    static let typeYourEmail            = "Digite seu email"
    static let typeYourPassword         = "Digite sua senha"
	 static let resetPasswordVCTitle     = "Esqueci minha senha"
	 static let send                     = "Enviar"
	 static let resetMessage             = "Para recuperar a sua senha, precisamos de seu email de cadastro"
	 static let sendEmail                = "Email enviado"
	 static let sendEmailSuccessMessage  = "Por favor, cheque sua caixa de entrada para redefinir sua senha."
}

enum SFSymbols {
    static let favorite                 = UIImage(systemName: "star")
    static let location                 = UIImage(systemName: "map")
    static let home                     = UIImage(systemName: "house")
}

enum Images {
    static let placeholder                 = UIImage(named: "restaurant")
    static let restaurantImg               = UIImage(named: "restaurant1")
    static let restaurantPlaceholder       = UIImage(named: "placeholder")
}

enum Colors {
    static let white                    = UIColor("#ffffff")
    static let gray200                  = UIColor("#CCCCCC")
    static let gray300                  = UIColor("#999999")
    static let gray500                  = UIColor("#2C2C2E")
    static let gray800                  = UIColor("#1C1C1E")
    static let black                    = UIColor("#000000")
    static let red500                   = UIColor("#E73030")
}
