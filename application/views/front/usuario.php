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
  
<?=heading($title,4);

$attributes = array('id' => 'form_login', 'class'=>'users'); 

    $usuario = array('name'=>'nombreU', 'id'=>'nombreU','class'=>'input','placeholder'=>'Usuario',
                      'value'=>set_value('nombreU'), 'size'=> '35',);

    $Password = array('name'=>'passwordU', 'id'=>'passwordU','class'=>'input','placeholder'=>'Password',
                      'value'=>set_value('passwordU'), 'size'=> '35',);

                       

if(validation_errors()):     
 ?> 
<div id="error"><?=validation_errors();?></div>
<?php endif ?>

<?=form_open('clientes/addU', $attributes);?> 

<div class="padding"><?=form_label('Usuario')?></div>
<div class="padding"><?=form_input($usuario)?></div>

<div class="padding"><?=form_label('Password')?></div>
<div class="padding"><?=form_input($Password)?></div>

<?=form_hidden('id_cliente', $id_cli); ?>
<?=form_submit(array('name' => 'submit','class'=>'submit','value' => 'Guardar'))?>
<?=form_close();?>
<div class="clear"></div>
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