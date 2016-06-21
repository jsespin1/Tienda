API - Javier Espinosa, Gerardo Marambio

Sólo administradores pueden interactuar con la API
username: jsespinosa
password: 123456

*el otro usuario admin lo creó Felipe

-Get all products

	GET fathomless-plains-96262.herokuapp.com/api/v1/products

-Get one product

	GET fathomless-plains-96262.herokuapp.com/api/v1/products/663d90496c383544d9e8a6a1292a9200

-Crear producto -> Requiere Body Raw + header Content-Type: application/json + Id del prod en url

	PUT fathomless-plains-96262.herokuapp.com/api/v1/products/101
	*si no existe el uuid indicado en la url, crea un nuevo producto con nueva id y uuid.

	{
  	"product": {
    	"nombre": "Renault Clio",
    	"precio": 4000,
    	"descripcion": "El mejor auto del mundo",
    	"imagen": "imagen.jpg"
  	}
	}

-Actualizar 1 -> Requiere Body Raw + header Content-Type: application/json + UUID del prod en url

	
	PUT fathomless-plains-96262.herokuapp.com/api/v1/products/663d90496c383544d9e8a6a1292a9200

	{
  	"product": {
    	"nombre": “Ferrari 458 Italia“,
    	"precio": 300000,
    	"descripcion": "El mejor auto del mundo",
    	"imagen": “ferrari1.png”,
  	}
	}

Actualizar 2 -> Requiere Body Raw + header Content-Type: application/json + Uuid del prod en url

	PATCH fathomless-plains-96262.herokuapp.com/api/v1/products/663d90496c383544d9e8a6a1292a9200

	{
  	"product": {
    	"descripcion": “Casi el mejor auto del mundo"
  	}
	}

-Delete

	DELETE fathomless-plains-96262.herokuapp.com/api/v1/products/663d90496c383544d9e8a6a1292a9200


-Head

	HEAD fathomless-plains-96262.herokuapp.com/api/v1/products/663d90496c383544d9e8a6a1292a9200

