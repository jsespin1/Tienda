$(document).ready(function(){
	//Obtenemos el formulario de nuevo usuario
	var $form = $('#formulario_nuevo_usuario');
	var $form2 = $('#formulario_cambiar_contrasena');
	var $form3 = $('#formulario_agregar_producto');
	var $form4 = $('#formulario_agregar_promocion');

	
	if ($form.length > 0) {
		var contador = 0;
		$form.on("submit", function(evento){

			if(contador>0){

				$('.error').remove();
			}
			var valid = true;
			//Vemos si el campo de Nombre esta completo
			valid = valid && document.getElementById('user_nombre').value; 
			//Vemos si el campo de apellido esta completo
			valid = valid && document.getElementById('user_apellido').value; 
			//Vemos si el campo de usuario esta completo
			valid = valid && document.getElementById('user_username').value; 
			//Vemos si el campo de correo esta completo
			valid = valid && document.getElementById('user_email').value; 
			//Vemos si el campo de contrasena esta completo
			valid = valid && document.getElementById('user_password').value; 
			//Vemos si el campo de confirmar contrasena esta completo
			valid = valid && document.getElementById('user_password_confirmation').value;

			//Comprobamos que las contraseñas sean iguales
			if (document.getElementById('user_password').value != document.getElementById('user_password_confirmation').value) {

				valid = false;
				alert("Las Contraseñas no coinciden");
			}

			if(!checkPassword(document.getElementById('user_password').value)){
				alert("Las Contraseñas deben tener al menos 6 caracteres, un numero, una letra minuscula y una letra mayuscula.");
			}
			
			
			

			if(!valid){
				

				if (!document.getElementById('user_nombre').value) {
					
					imprimir_campo('user_nombre');	
				}
				

				if (!document.getElementById('user_apellido').value ) {

					imprimir_campo('user_apellido');
				}
				

				if (!document.getElementById('user_username').value ) {
					imprimir_campo('user_username');
				}
				

				if (validarEmail(document.getElementById('user_email').value)) {
					
				}
				

				if (!document.getElementById('user_password').value ) {
					
					imprimir_campo('user_password');
				}
				

				if (!document.getElementById('user_password_confirmation').value) {
					
					imprimir_campo('user_password_confirmation');
					
				}
				
      			
				contador++;
				evento.preventDefault();
			}
			
			

		});

	}
	if ($form2.length > 0) {
		var contador;
		contador = 0;
		$form2.on("submit", function(evento){

			if(contador>0){

				$('.error').remove();
			}
			var valid = true;

			valid = valid && document.getElementById('user_password').value;
			valid = valid && document.getElementById('user_password_confirmation').value;
			valid = valid && checkPassword(document.getElementById('user_password').value);

			if(!valid){

				console.log("entre al false");
				if (!document.getElementById('user_password').value ) {
					
					imprimir_campo('user_password');
				}
				

				if (!document.getElementById('user_password_confirmation').value) {
						
						imprimir_campo('user_password_confirmation');
						
					}
				if (document.getElementById('user_password').value != document.getElementById('user_password_confirmation').value) {

					valid = false;
					alert("Las Contraseñas no coinciden");
				}

				evento.preventDefault();
			}
			

			
			


		});

	}
	if ($form3.length > 0) {
		var contador = 0;
		$form3.on("submit", function(evento){
			if(contador>0){

				$('.error').remove();
			}
			var valid = true;
			//Vemos si el campo de Nombre esta completo
			valid = validarSiNumero(document.getElementById('producto_precio').value);
			valid = valid && document.getElementById('producto_nombre').value;



			if (!valid) {

				if (!document.getElementById('producto_nombre').value) {
					
					imprimir_campo('producto_nombre');	
				}

				evento.preventDefault();
			}
			
		});
	}

	if ($form4.length > 0) {

		var contador=0;
		$form4.on("submit", function(evento){
			if(contador>0){

				$('.error').remove();
			}
			var valid = true;
			//Vemos si el campo de Nombre esta completo
			valid = validarSiNumero(document.getElementById('promocion_subtotal').value)
			valid = validarSiNumero(document.getElementById('promocion_descuento').value);
			valid = valid && document.getElementById('promocion_nombre').value;

			if (!valid) {

				if (!document.getElementById('promocion_nombre').value) {
					
					imprimir_campo('promocion_nombre');	
				}
				if (!document.getElementById('promocion_subtotal').value) {
					imprimir_campo('promocion_subtotal');	

				}
				if(!document.getElementById('promocion_descuento').value){
					imprimir_campo('promocion_descuento');	
				}

				evento.preventDefault();
			}

		});

	}


});

var imprimir_campo = function(tag){

	var err = document.createElement('div');
	err.className = 'error';
	err.innerHTML = "Falta el campo";
	document.getElementById(tag).parentNode.appendChild(err);

}

function validarEmail( email ) {
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if ( !expr.test(email) ){
        alert("Error: La dirección de correo " + email + " es incorrecta.");
        imprimir_campo('user_email');
    	return false;
    }


}

function checkPassword(str)
  {
    // at least one number, one lowercase and one uppercase letter
    // at least six characters
    var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
    if ( !re.test(str) ){
    	
    	return false;
    }
    else{return true;}
    
  }

  function validarSiNumero(numero){
    if (!/^([0-9])*$/.test(numero)){
      alert("El valor " + numero + " no es un número");
      return false;
    }
    else{
      return true;
    }
  }








