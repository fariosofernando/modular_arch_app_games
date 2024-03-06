# Arquitetura Modular no Flutter

No Flutter, a arquitetura modular pode ser implementada de várias maneiras, incluindo a modularização dos componentes e a modularização das features.

## Modularização dos Componentes:
   > Nesse caso, organizamos o código em `módulos` com base nos componentes do aplicativo, como páginas, widgets, serviços, etc.

   Cada módulo pode conter uma ou mais partes do aplicativo, como a tela inicial, tela de login, etc. O [Flutter Modular](https://pub.dev/packages/flutter_modular) é uma ferramenta popular para lidar com a injeção de dependência, definição de rotas únicas para cada módulo, provedor de instâncias (como o Provider), entre outros aspectos relacionados à modularização.

A estrutura do projeto pode ser algo como:
```dart
   [projeto]
   ├── lib
   │     └── src
   │      └── modules
   │          ├── home
   │          ├── login
```

A estrutura do projeto usando o `Flutter Modular` pode ser algo como:
```dart             
├── features                                 # All features or Modules 
│   ├─ auth                                  # Auth's MVC       
│   │  ├── auth_model.dart   
│   │  ├── auth_controller.dart  
│   │  └── auth_page.dart                      
│   ├─ home                                  # Home's MVC       
│   │  ├── home_model.dart   
│   │  ├── home_controller.dart  
│   │  └── home_page.dart                        
│   └─ product                               # Product's MVC     
│      ├── product_model.dart   
│      ├── product_controller.dart
│      └── product_page.dart                    
├── core                                     # Tools and utilities
├── app_widget.dart                          # Main Widget containing MaterialApp 
└── main.dart                                # runApp
```

## Modularização das Features:
 > Na modularização das features, os módulos geralmente são mais focados na lógica de negócios e na implementação das funcionalidades específicas da aplicação, enquanto a definição da interface do usuário (UI) é tratada nos `MODULOS PRINCIPAIS`, como o app (MOBILE) ou webapp.

A ideia por trás dessa abordagem é manter a lógica de negócios separada da UI, o que permite uma maior reutilização de código e facilita a manutenção do projeto. Isso significa que os módulos de feature podem conter classes, serviços, controladores, repositórios e outros elementos relacionados à implementação da funcionalidade, enquanto a UI é definida nos aplicativos principais, onde os módulos de feature são integrados e utilizados.

A estrutura do projeto pode ser algo como:
```
[projeto]
├── webapp
├── app
│   └── pubspec.yaml                       # No arquivo de configuração import o `authentication_module`: dependencies
|                                                                                                            authentication_module:
|                                                                                                                 path: ../modules/authentication_module 
└── modules
    └── authentication_module
```

> Neste repositorio a modulariazação é baseada em features.

## Conclusão:
Ambas as abordagens têm suas vantagens e podem ser aplicadas dependendo dos requisitos do projeto e das preferências da equipe de desenvolvimento. O importante é garantir que a arquitetura modular seja implementada de forma a promover a reutilização de código, a manutenibilidade e a escalabilidade do aplicativo.
