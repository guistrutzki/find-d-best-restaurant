//
//  Constants.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 21/08/21.
//

import UIKit

public let API_BASE_URL = "https://restaurant-api.guistrutzki.dev"

enum K {
    
    ///A
    static let aboutRestaurant          = "Sobre o restaurante"
    static let accountCreated           = "Sua conta foi criada"
    static let accountSuccessMessage    = "Agora você já pode fazer login"
    static let appTitle                 = "Find D Best Restaurant"
    
    ///B
    ///C
    
    static let continueWithoutLogin     = "Continuar sem login"
    
    ///D
    ///E
    static let error                    = "Erro!"
    static let enter                    = "Entrar"
    
    ///F
    
    static let favorites                = "Favoritos"
    static let forgetMyPassword         = "Esqueci minha senha"
    static let forgetYourPassword       = "Esqueceu sua senha?"
    
    ///G
    ///H
    
    static let home                     = "Início"
    
    ///I
    ///J
    ///K
    ///L
    
    ///M
    
    static let menu                     = "Menu"
    
    ///N
    ///O
    
    static let ok                       = "Ok"
    
    ///P
    
    static let settings                 = "Ajustes"
    static let photoGallery             = "Galeria de fotos"
    
    ///Q
    ///R
    
    static let register                 = "Cadastre-se"
    static let reset                    = "Redefinir"
    static let resetMessage             = "Para recuperar a sua senha, precisamos de seu email de cadastro"
    static let resetPasswordVCTitle     = "Esqueci minha senha"
    static let resetPassword            = "Esqueci minha senha"
    static let restaurants              = "Restaurantes"
    
    ///S
    
    static let send                     = "Enviar"
    static let sendEmail                = "Email enviado"
    static let sendEmailSuccessMessage  = "Por favor, cheque sua caixa de entrada para redefinir sua senha."
    static let signUp                   = "Cadastrar"
    static let signUpVCTitle            = "Cadastro"
    static let save                     = "Salvar"
    
    ///T
    
    static let top                      = "Mapa"
    static let typeYourFullName         = "Digite seu nome completo"
    static let typeYourEmail            = "Digite seu email"
    static let typeYourPassword         = "Digite sua senha"
    
    ///U
    ///V
    ///W
    
    static let whatAboutStartNow        = "Que tal começar agora?"
    ///X
    
    ///Y
    
    static let youDontHaveAFavorite     = "Você ainda não possui favoritos"
    
    ///Z
    
}

enum SFSymbols {
    static let favorite                 = UIImage(systemName: "star")
    static let location                 = UIImage(systemName: "map")
    static let home                     = UIImage(systemName: "house")
    static let person                   = UIImage(systemName: "person")
}

enum Images {
    static let placeholder                 = UIImage(named: "restaurant")
    static let restaurantImg               = UIImage(named: "restaurant1")
    static let restaurantPlaceholder       = UIImage(named: "placeholder")
    static let restaurant1                 = UIImage(named: "rest-1")
    static let restaurant3                 = UIImage(named: "rest-3")
    static let rubayat                     = UIImage(named: "rubayat")
    static let padlock                     = UIImage(named: "padlock")
    static let register                    = UIImage(named: "cadastro")
    static let login                       = UIImage(named: "login")
    static let heartFilled                 = UIImage(named: "heartFilled")
    static let hearttoFullfill             = UIImage(named: "heart-empty")
    static let favoritePlace               = UIImage(named: "favoritePlace")
    static let editIcon                    = UIImage(named: "pencil")
}

enum Colors {
    static let white                    = UIColor("#ffffff")
    static let gray200                  = UIColor("#CCCCCC")
    static let gray300                  = UIColor("#999999")
    static let gray500                  = UIColor("#2C2C2E")
    static let gray800                  = UIColor("#1C1C1E")
    static let black                    = UIColor("#000000")
    static let red500                   = UIColor("#E73030")
    static let gradient900              = UIColor("#090808")
    static let gradient100              = UIColor("#000000", alpha: 0.35)
    static let gradient040              = UIColor("#000000", alpha: 0.40)
    static let darkness                 = UIColor(red: 13, green: 25, blue: 33, alpha: 0)
}

enum Fonts {
    static let poppinsRegular           = "Poppins-Regular"
    static let poppinsBold              = "Poppins-Bold"
    static let poppinsMedium            = "Poppins-Medium"
}
