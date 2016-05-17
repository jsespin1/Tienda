# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#------------------------Autos--------------------------#

Product.delete_all
descripcion1 = "El Ferrari 458 Italia es un automóvil superdeportivo, diseñado por Pininfarina y producido por el fabricante italiano Ferrari desde el año 2010 como remplazo del Ferrari F430. Fue revelado a la prensa el 28 de julio de 2009 y presentado en el Salón del Automóvil de Fráncfort de 2009.1"
Product.create! id: 1, nombre: "Ferrari 458 Italia", tipo: "auto", precio: 300000, descripcion: descripcion1, active: true, imagen: "ferrari1.png"
descripcion2 = "El Reventón tiene una carrocería con un diseño , con formas angulosas y rectas. La carrocería está construida en fibra de carbono y pintada de color verde grisáceo, aunque no tiene brillo metálico. Las partículas metálicas que lo componen le dan efecto de profundidad a la luz del sol, y dependiendo de cómo le impacte la luz, el coche puede lucir de uno u otro color."
Product.create! id: 2, nombre: "Lamborghini Reventón", tipo: "auto", precio: 370000, descripcion: descripcion2, active: true, imagen: "lamborghini1.svg"
descripcion3 = "El Maserati GranTurismo, mejor que ningún otro vehículo de cuatro plazas, combina una clase y una elegancia sin par con una vocación deportiva sin medias tintas. Las líneas exteriores expresan tensión dinámica y deportividad desde todos los puntos de vista. Desde la gran boca ovalada que delimita la calandra hasta la parte trasera del vehículo, la carrocería se ajusta sobre la parte mecánica como un vestido ceñido sobre una silueta sinuosa."
maserati = Product.create! id: 3, nombre: "Maserati GT", tipo: "auto", precio: 190000, descripcion: descripcion3, active: true, imagen: "maserati.png"

#------------------------Perros--------------------------#

descripcion4 = "El pastor alemán u ovejero alemán (en alemán: Deutscher Schäferhund) es una raza canina que proviene de Alemania.2 La raza es relativamente nueva, ya que su origen se remonta a 1899.3 Forman parte del grupo de pastoreo, debido a que fueron perros desarrollados originalmente para reunir y vigilar ovejas."
Product.create! id: 4, nombre: "Pastor Alemán", tipo: "perro", precio: 3000, descripcion: descripcion4, active: true, imagen: "aleman.png"
descripcion5 = "El Bulldog Francés es un perro de compañía. Ni más ni menos. No fue criado para cazar aves en el campo ni para meterse en madrigueras de conejos. Es listo y refinado y fue criado para hacer compañía al hombre. De todas formas, el que le agrade sentarse en el sofá con su amo y ver la televisión mientras le metemos una golosina ocasional en la boca no quiere decir que no le guste la diversión o que no sea activo."
Product.create! id: 5, nombre: "Bulldog Francés", tipo: "perro", precio: 5000, descripcion: descripcion5, active: true, imagen: "buldog.png"
descripcion6 = "Los perros pitbull son perros notables, de tamaño mediano, estructura sólida, pelo corto y una musculatura bien definida. Aunque se conoce a esta raza con el nombre genérico de pitbull, el nombre correcto en castellano es pit bull terrier americano. 
Si bien el nombre de la raza da a pensar que el pitbull se originó en Estados Unidos, el origen de esta raza se remonta a la Gran Bretaña del siglo XIX. 
Creado originalmente para ser un perro de pelea, el pitbull presenta características físicas que le confieren gran fuerza y agilidad. También es un perro muy resistente al dolor físico y tiene un coraje que supera cualquier expectativa. "
Product.create! id: 6, nombre: "Pitbull", tipo: "perro", precio: 1500, descripcion: descripcion6, active: true, imagen: "pitbul.png"
descripcion7 = "El boxer es un perro compacto y poderoso, de tamaño medio y de cuerpo cuadrado (su longitud es igual a su altura).
El pelaje del boxer es corto y brillante, y los colores permitidos son el leonado y el atigrado, con muchas variantes. Las manchas blancas son aceptadas y apreciadas, siempre que no superen un tercio de la superficie total del cuerpo del boxer. No son apreciadas las manchas blancas que cubran la mayor parte de la cabeza del boxer, o que cubran un lado de la misma."
boxer = Product.create! id: 7, nombre: "Boxer", tipo: "perro", precio: 2000, descripcion: descripcion7, active: true, imagen: "boxer.png"

#------------------------Promociones--------------------------#
#Boxer y Maserati
Promocion.delete_all
comentario1 =  "Solo por tiempo limitado aprovecha de llevarte a un modico precio el nuevo Maserati Gran Turismo con su respectivo guardián
Esta es una camada de Boxer importados directamente desde Alemania. Criados para ser defensivos y amistosos."
promocion1 = Promocion.create! id: 1, nombre: "Maserati+Boxer", cantidad_productos: 2, descuento: 30000, comentario: comentario1, active: true, imagen: "promocion1.png"
promocion1.products << maserati
promocion1.products << boxer
promocion1.save
