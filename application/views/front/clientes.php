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

    $NIT = array('name'=>'nit', 'id'=>'nit','class'=>'input','placeholder'=>'Numero de Nit',
                      'value'=>set_value('nit'), 'size'=> '35',);
            
    $DUI = array('name'=>'dui', 'id'=>'dui','class'=>'input','placeholder'=>'Numero unico de identidad',
                      'value'=>set_value('dui'), 'size'=> '35',);
            
    $Registro = array('name'=>'registro', 'id'=>'registro','class'=>'input','placeholder'=>'Registro de la empresa',
                      'value'=>set_value('registro'), 'size'=> '35',);
            
    $Giro = array('name'=>'giro', 'id'=>'giro','class'=>'input','placeholder'=>'giro',
                      'value'=>set_value('giro'), 'size'=> '35',);
            
    $Nombre = array('name'=>'nombre1', 'id'=>'nombre1','class'=>'input','placeholder'=>'Escriba su nombre completo',
                      'value'=>set_value('nombre1'), 'size'=> '35',);

    $Tienda = array('name'=>'nombre2', 'id'=>'nombre2','class'=>'input','placeholder'=>'Escriba el nombre de su negocio',
                      'value'=>set_value('nombre2'), 'size'=> '35',);

    $Contacto = array('name'=>'contacto', 'id'=>'contacto','class'=>'input','placeholder'=>'Como se entero de la empresa',
                      'value'=>set_value('contacto'), 'size'=> '35',);

    $Telefono = array('name'=>'telefono1', 'id'=>'telefono1','class'=>'input','placeholder'=>'Telefono',
                      'value'=>set_value('telefono1'), 'size'=> '35',);

    $Telefono2 = array('name'=>'telefono2', 'id'=>'telefono2','class'=>'input','placeholder'=>'Telefono',
                      'value'=>set_value('telefono2'), 'size'=> '35',);

    $Celular = array('name'=>'celular', 'id'=>'celular','class'=>'input','placeholder'=>'Celular',
                      'value'=>set_value('celular'), 'size'=> '35',);

    $fax = array('name'=>'fax', 'id'=>'fax','class'=>'input','placeholder'=>'Numero de fax',
                      'value'=>set_value('fax'), 'size'=> '35',);

    $Correo = array('name'=>'correo', 'id'=>'correo','class'=>'input','placeholder'=>'Correo',
                      'value'=>set_value('correo'), 'size'=> '35',);

    $Municipio = array('name'=>'municipio', 'id'=>'municipio','class'=>'input','placeholder'=>'Municipio',
                      'value'=>set_value('municipio'), 'size'=> '35',);

    $Direccion = array('name'=>'direccion', 'id'=>'direccion','class'=>'input','placeholder'=>'Direccion',
                      'value'=>set_value('direccion'), 'size'=> '35',);

    $Departamento = array('name'=>'departamento', 'id'=>'departamento','class'=>'input','placeholder'=>'Departamento',
                      'value'=>set_value('departamento'), 'size'=> '35',);


                

if(validation_errors()):     
 ?> 
<div id="error"><?=validation_errors();?></div>
<?php endif ?>

<?=form_open('clientes/add', $attributes);?> 
<div class="padding"><?=form_label('NIT');?></div>
<div class="padding"><?=form_input($NIT);?></div>
<div class="padding"><?=form_label('DUI')?></div>
<div class="padding"><?=form_input($DUI)?></div>
<div class="padding"><?=form_label('Registro')?></div>
<div class="padding"><?=form_input($Registro)?></div>
<div class="padding"><?=form_label('Giro')?></div>
<div class="padding"><?=form_input($Giro)?></div>
<div class="padding"><?=form_label('Nombre')?></div>
<div class="padding"><?=form_input($Nombre)?></div>
<div class="padding"><?=form_label('Tienda')?></div>
<div class="padding"><?=form_input($Tienda)?></div>
<div class="padding"><?=form_label('Contacto')?></div>
<div class="padding"><?=form_input($Contacto)?></div>
<div class="padding"><?=form_label('Telefono')?></div>
<div class="padding"><?=form_input($Telefono)?></div>
<div class="padding"><?=form_label('Segundo Telefono')?></div>
<div class="padding"><?=form_input($Telefono2)?></div>
<div class="padding"><?=form_label('Celuar')?></div>
<div class="padding"><?=form_input($Celular)?></div>
<div class="padding"><?=form_label('Fax')?></div>
<div class="padding"><?=form_input($fax)?></div>
<div class="padding"><?=form_label('Correo')?></div>
<div class="padding"><?=form_input($Correo)?></div>
<div class="padding"><?=form_label('direccion')?></div>
<div class="padding"><?=form_input($Direccion)?></div>
<div class="padding"><?=form_label('departamento')?></div>
<div class="padding"><?=form_input($Departamento)?></div>
<div class="padding"><?=form_label('municipio')?></div>
<div class="padding"><?=form_input($Municipio)?></div>

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