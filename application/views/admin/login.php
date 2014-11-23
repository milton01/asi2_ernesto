<?php
     $logued = $this->session->userdata('logued_in');
	 $session = $this->session->userdata('session_id');
    
if($logued === TRUE || $session === TRUE ){ /* Si está loguiado los enviamos a las funciones del administrador */
	  		$data['title'] = 'Administrador'; 
			$data['user'] =  $this->session->userdata('user');
			
			$this->load->view('admin/header_admin',$data);
            $this->load->view('admin/admin');
			$this->load->view('front/footer'); exit();
	
 } 	
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="<?=base_url();?>assets/template/images/favicon.png" type="image/png">

<title><?=$title?></title>

<link href="<?=base_url();?>assets/css/style.default.css" rel="stylesheet">
<script type="text/javascript" src="<?=base_url();?>assets/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
$('#username').focus();	
$('#username').blur(function(){		 
	 var user = $(this).val();
	    
	  if(user==''){
	    	
	    $('#msg_username').html('El Usuario es requerido').css('color','red');
	    	
	    }else{
		
		$.post('login/valid_login_ajax', {username : user}, function(data){
            					
				 if(data!=1){
				 
	                    $('#msg_username').html('El Usuario es Incorrecto').css('color','red');
	                      }else {	                  
	                      $('#msg_username').html('El Usuario es correcto').css('color','green');	                      	
	                      	 
	                      }     				 
				 });             		                              	        	  	 
	    				
	/*	var info = { username: user }; 
		
            $.ajax({            	
            	url: 'login/valid_login_ajax',  
            	type: 'POST',          	
            	data: info,
            	success: function(msg){  // alert(msg);		
	                      if(msg!=1){
	                      	
	                      	$('#msg_username').html('El Usuario es Incorrecto').css('color','red');
	                      }else {	                  
	                      $('#msg_username').html('El Usuario es correcto').css('color','green');	                      	
	                      	 
	                      }     	         		
            	}
            	          	
            });	 */	 
			
	    } //fin del else

	  });	  
});	

$(document).ready(function(){
$('#password').blur(function(){		 
	 var user = $(this).val();
	    
	  if(user==''){
	    	
	    $('#msg_password').html('La Contraseña es requerida').css('color','red');
	    	
	    }else{
	    				
		   $('#msg_password').empty();
	    }

	});	  
});	
</script>
</head>

<body class="signin">

<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<section>
  
    <div class="signinpanel">
        
        <div class="row">
            
            <div class="col-md-7">
                
                <div class="signin-info">
                    <div class="logopanel">
                        <img src="<?=base_url();?>assets/images/logo-login.png"/>
                    </div><!-- logopanel -->
                
                    <div class="mb20"></div>
                
                    <h5><strong>Sistema Altuve</strong></h5>
                    <ul>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> <?=anchor('clientes','Registrate');?></li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> Control de transporte</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> Registro de clientes</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> Pedidos</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> Estado de pedidos</li>
                    </ul>
                    <div class="mb20"></div>
                </div><!-- signin0-info -->
            
            </div><!-- col-sm-7 -->
            
            <div class="col-md-5">
	
<?php $attributes = array('id' => 'form_login'); 

    $username = array('name'=>'username', 'id'=>'username','class'=>'input','placeholder'=>'Usuario',
                      'value'=>set_value('username'), 'size'=> '35',);
    $password = array('name'=>'password', 'id'=>'password','class'=>'input','placeholder'=>'Contraseña',
                      'type'=>'password', 'size'=> '35',);

if(validation_errors()):	   
 ?> 
<div id="error"><?=validation_errors();?></div>
<?php endif ?>

<?=form_open('login', $attributes);?>	
<div class="padding"><?=form_label('Usuario');?></div>
<div id='msg_username' class="padding"></div> 
<div class="padding"><?=form_input($username);?></div>
<div class="padding"><?=form_label('Contraseña')?></div>
<div id='msg_password' class="padding"></div> 
<div class="padding"><?=form_input($password)?></div>

<?=form_submit(array('name' => 'submit','class'=>'submit',
                                               'value' => 'Acceder'))?>
<?=form_close();?>

</div><!-- col-sm-5 -->
            
        </div><!-- row -->
        
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2014. Derechos reservados. Altuve
            </div>
            <div class="pull-right">
            </div>
        </div>
        
    </div><!-- signin -->
  
</section>


<script src="<?=base_url();?>assets/js/jquery-1.10.2.min.js"></script>
<script src="<?=base_url();?>assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<?=base_url();?>assets/js/bootstrap.min.js"></script>
<script src="<?=base_url();?>assets/js/modernizr.min.js"></script>
<script src="<?=base_url();?>assets/js/retina.min.js"></script>

<script src="<?=base_url();?>assets/js/custom.js"></script>

</body>
</html>