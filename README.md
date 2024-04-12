# Test-app-oraxis

Este proyecto implementa una serie de prácticas y tecnologías para garantizar un desarrollo eficiente y de alta calidad.

## Arquitectura VIPER

El proyecto sigue la arquitectura VIPER (View, Interactor, Presenter, Entity, Router), lo que proporciona una organización clara y modular del código. Cada componente tiene responsabilidades específicas, lo que facilita el mantenimiento y la escalabilidad del proyecto.

## Capa Repository

La capa de repositorio se encarga de separar la lógica de negocio de la fuente de datos. Esto permite cambiar la implementación de almacenamiento de datos (por ejemplo, de una base de datos local a una API remota) sin afectar al resto de la aplicación. Además, facilita la escritura de pruebas unitarias al aislar la lógica de negocio de la lógica de acceso a datos.

## UITest

Se incluyen pruebas de interfaz de usuario (UITest) para garantizar la calidad del software. Estas pruebas automatizadas permiten simular la interacción del usuario con la aplicación y validar su comportamiento en diferentes escenarios y condiciones.

## GitFlow

El flujo de trabajo GitFlow se utiliza para gestionar las ramas y versiones del proyecto de manera estructurada. Este enfoque facilita la colaboración entre equipos, el seguimiento de cambios y la implementación de nuevas características y correcciones de errores de manera controlada.

## Separación de Ambientes por Schemas de Xcode y Xconfig

Se utiliza la separación de ambientes mediante esquemas de Xcode y archivos de configuración (Xconfig). Esto permite configurar diferentes entornos (como desarrollo, pruebas y producción) con sus propias variables de entorno y configuraciones específicas, facilitando el despliegue y la gestión del proyecto en diferentes contextos.

## Instalación

1. Clona este repositorio en tu máquina local.
2. Abre el proyecto en Xcode.
3. Instala las dependencias del proyecto utilizando Cocoapods:

```bash
pod install
Configura las variables de entorno en los archivos Xconfig según sea necesario para la separación de ambientes.

## Uso

Una vez instalado, puedes abrir el proyecto en Xcode y comenzar a trabajar en él. Asegúrate de seguir las convenciones de la arquitectura VIPER y utilizar las pruebas de interfaz de usuario para garantizar el comportamiento esperado de la aplicación.

## Contribución

Si deseas contribuir a este proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una rama para tu nueva funcionalidad (git checkout -b feature/nueva-funcionalidad).
3. Realiza tus cambios y haz commits (git commit -am 'Añade nueva funcionalidad').
4. Sube tus cambios a tu fork (git push origin feature/nueva-funcionalidad).
5. Crea un nuevo pull request.

## Créditos

Este proyecto fue creado por Tu Nombre.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para obtener más detalles.