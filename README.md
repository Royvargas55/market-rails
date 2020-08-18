**Descripcion del Proyecto**

Este proyecto se basa en una empresa que requiere un Pagina Web para los clientes, estos que a su vez buscan los servicios de la empresa para adquirir sus productos. En este caso esta empresa se dedica a brindar servicios de software, donde sus clientes pueden presentar una solicitud para poder poner en marcha el desarrollo.

Por otro lado, los usuarios de la empresa también se ven involucrados en este proceso, ya que serán los encargados de recibir las solicitudes en las que aplican sus clientes. Este procesos tiene varias fases, por lo que el cliente se mantendrá en espera mientras, las personas encargadas de velar por que se cumplan los requisitos de las solicitudes emitidas. En el caso de que su solicitud es aprobada o bien no lo es, se le notificara al cliente sobre su estado.

**Tecnologías Utilizadas**

 - Ruby con el framework "Ruby on rails" utilizando MVC
 - Base de datos PostgresSQL, utilizando su ORM "Active Record"
 - Control de versiones GitHub
 - Controlador de dependencias "Gemfiles"
 - RSpec para verificar la calidad del código escrito (Testing)
 
 **Gemas Utilizadas**
 
 - Friendly_ID  
 - Devise  
 - Ionicon  
 - Service workers
 - RSpec
 - FactoryGirl
 - Shoulda
 - NyanCatFormatter
 
 **Testing Automático (RSpec)**
 - Se implementó FactoryGirl que generara información para probar los modelos y controladores de la aplicación
 - El uso de Shoulda  para un código más escalable y sostenible.
 - NyanCatFormatter  que crea un rastro de resultados de pruebas. También cuenta la cantidad de ejemplos a medida que se ejecutan y resalta las especificaciones fallidas y pendientes.

**Funcionalidades del Proyecto realizada hasta la fecha**

 - [x] Registros y Login
 - [x] Almacenar datos del formulario de nuevo proyecto de cada usuario 
 - [x] Cargar proyectos de cada usuario
 - [x] Notificación de nueva solicitud para aprobar el jefe (Mail)
 - [x] Cargar proyectos en el aprobador jefe
 - [x] Asignar precio del proyecto
 - [x] Notificacion de condicion del proyecto al cliente
 - [x] Notificacion al aprobados financiero de nueva solicitud de proyecto
 - [x] Filtro de las solicitudes de los ultimos 3 o 6 meses para aprobador jefe
 - [x] Carga solicitudes rechazadas por el aprobador jefe
 - [x]  Carga proyectos segun la categoria del aprobador financiero
 - [x] Carga solicitudes aprobadas y rechazadas por el aprobador jefe
