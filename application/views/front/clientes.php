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

    $cliente_id = array('name'=>'cliente_id', 'id'=>'cliente_id','class'=>'input','placeholder'=>'ID',
                      'value'=>set_value('cliente_id'), 'size'=> '35', 'disabled'=>'diabled' );
            
    $nit = array('name'=>'nit', 'id'=>'nit','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('nit'), 'size'=> '35',);

    $dui = array('name'=>'dui', 'id'=>'dui','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('dui'), 'size'=> '35',);

    $registro = array('name'=>'registro', 'id'=>'registro','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('registro'), 'size'=> '35',);

    $giro = array('name'=>'giro', 'id'=>'giro','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('giro'), 'size'=> '35',);

    $nombre_j = array('name'=>'nombre_j', 'id'=>'nombre_j','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('nombre_j'), 'size'=> '35',);

    $nombre_c = array('name'=>'nombre_c', 'id'=>'nombre_c','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('nombre_c'), 'size'=> '35',);

    $contacto = array('name'=>'contacto', 'id'=>'contacto','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('contacto'), 'size'=> '35',);

    $telefono_1 = array('name'=>'telefono_1', 'id'=>'telefono_1','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('telefono_1'), 'size'=> '35',);

    $telefono_2 = array('name'=>'telefono_2', 'id'=>'telefono_2','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('telefono_2'), 'size'=> '35',);

    $celular = array('name'=>'celular', 'id'=>'celular','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('celular'), 'size'=> '35',);

    $fax = array('name'=>'fax', 'id'=>'fax','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('fax'), 'size'=> '35',);

    $correo = array('name'=>'correo', 'id'=>'correo','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('correo'), 'size'=> '35',);

    $tipo = array('name'=>'tipo', 'id'=>'tipo','class'=>'input','placeholder'=>'nit','disabled'=>'diabled',
                      'value'=>set_value('tipo'), 'size'=> '35',);

    $categoria = array('name'=>'categoria', 'id'=>'categoria','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('categoria'), 'size'=> '35',);

    $direccion = array('name'=>'direccion', 'id'=>'direccion','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('direccion'), 'size'=> '35',);

    $municipio = array('name'=>'municipio', 'id'=>'municipio','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('municipio'), 'size'=> '35',);


    $departamento = array('name'=>'departamento', 'id'=>'departamento','class'=>'input','placeholder'=>'nit',
                      'value'=>set_value('departamento'), 'size'=> '35',);

    $statu_cred = array('name'=>'statu_cred', 'id'=>'statu_cred','class'=>'input','placeholder'=>'nit','disabled'=>'diabled',
                      'value'=>set_value('statu_cred'), 'size'=> '35',);

    $ruta_id = array('name'=>'ruta_id', 'id'=>'ruta_id','class'=>'input','placeholder'=>'nit','disabled'=>'diabled',
                      'value'=>set_value('ruta_id'), 'size'=> '35',);

    $status_id = array('name'=>'status_id', 'id'=>'status_id','class'=>'input','placeholder'=>'nit','disabled'=>'diabled',
                      'value'=>set_value('status_id'), 'size'=> '35',);

    $usuario = array('name'=>'nombreU', 'id'=>'nombreU','class'=>'input','placeholder'=>'Usuario',
                      'value'=>set_value('nombreU'), 'size'=> '35',);

    $Password = array('name'=>'passwordU', 'id'=>'passwordU','class'=>'input','placeholder'=>'Password',
                      'value'=>set_value('passwordU'), 'size'=> '35',);

                       

if(validation_errors()):     
 ?> 
<div id="error"><?=validation_errors();?></div>
<?php endif ?>

<?=form_open('clientes/add', $attributes);?> 
<div class="padding"><?=form_label('ID');?></div>
<div class="padding"><?=form_input($cliente_id);?></div>

<div class="padding"><?=form_label('nit')?></div>
<div class="padding"><?=form_input($nit)?></div>

<div class="padding"><?=form_label('dui');?></div>
<div class="padding"><?=form_input($dui);?></div>

<div class="padding"><?=form_label('registro')?></div>
<div class="padding"><?=form_input($registro)?></div>

<div class="padding"><?=form_label('giro')?></div>
<div class="padding"><?=form_input($giro)?></div>

<div class="padding"><?=form_label('nombre_j');?></div>
<div class="padding"><?=form_input($nombre_j);?></div>

<div class="padding"><?=form_label('nombre_c')?></div>
<div class="padding"><?=form_input($nombre_c)?></div>

<div class="padding"><?=form_label('contacto');?></div>
<div class="padding"><?=form_input($contacto);?></div>

<div class="padding"><?=form_label('telefono_1')?></div>
<div class="padding"><?=form_input($telefono_1)?></div>

<div class="padding"><?=form_label('telefono_2');?></div>
<div class="padding"><?=form_input($telefono_2);?></div>

<div class="padding"><?=form_label('celular');?></div>
<div class="padding"><?=form_input($celular);?></div>

<div class="padding"><?=form_label('fax')?></div>
<div class="padding"><?=form_input($fax)?></div>

<div class="padding"><?=form_label('correo');?></div>
<div class="padding"><?=form_input($correo);?></div>

<div class="padding"><?=form_label('tipo')?></div>
<div class="padding"><?=form_input($tipo)?></div>

<div class="padding"><?=form_label('categoria');?></div>
<div class="padding"><?=form_input($categoria);?></div>

<div class="padding"><?=form_label('direccion')?></div>
<div class="padding"><?=form_input($direccion)?></div>

<div class="padding"><?=form_label('municipio');?></div>
<div class="padding"><?=form_input($municipio);?></div>

<div class="padding"><?=form_label('departamento')?></div>
<div class="padding"><?=form_input($departamento)?></div>

<div class="padding"><?=form_label('statu_cred');?></div>
<div class="padding"><?=form_input($statu_cred);?></div>

<div class="padding"><?=form_label('ruta_id')?></div>
<div class="padding"><?=form_input($ruta_id)?></div>

<div class="padding"><?=form_label('status_id')?></div>
<div class="padding"><?=form_input($status_id)?></div>

<div class="padding"><?=form_label('Usuario')?></div>
<div class="padding"><?=form_input($usuario)?></div>

<div class="padding"><?=form_label('Password')?></div>
<div class="padding"><?=form_input($Password)?></div>

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
</html>