# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
descripcion1 = "El Ferrari 458 Italia es un automóvil superdeportivo, diseñado por Pininfarina y producido por el fabricante italiano Ferrari desde el año 2010 como remplazo del Ferrari F430. Fue revelado a la prensa el 28 de julio de 2009 y presentado en el Salón del Automóvil de Fráncfort de 2009.1"
Product.create! id: 1, name: "Ferrari 458 Italia", tipo: "auto", precio: 300000, descripcion: descripcion1, active: true, imagen: "ferrari1.png"
descripcion2 = "El Reventón tiene una carrocería con un diseño , con formas angulosas y rectas. La carrocería está construida en fibra de carbono y pintada de color verde grisáceo, aunque no tiene brillo metálico. Las partículas metálicas que lo componen le dan efecto de profundidad a la luz del sol, y dependiendo de cómo le impacte la luz, el coche puede lucir de uno u otro color."
Product.create! id: 2, name: "Lamborghini Reventón", tipo: "auto", precio: 370000, descripcion: descripcion2, active: true, imagen: "lamborghini1.svg"
descripcion3 = "El Maserati GranTurismo, mejor que ningún otro vehículo de cuatro plazas, combina una clase y una elegancia sin par con una vocación deportiva sin medias tintas. Las líneas exteriores expresan tensión dinámica y deportividad desde todos los puntos de vista. Desde la gran boca ovalada que delimita la calandra hasta la parte trasera del vehículo, la carrocería se ajusta sobre la parte mecánica como un vestido ceñido sobre una silueta sinuosa."
Product.create! id: 3, name: "Maserati Gran Turismo", tipo: "auto", precio: 190000, descripcion: descripcion3, active: true, imagen: "maserati.png"


