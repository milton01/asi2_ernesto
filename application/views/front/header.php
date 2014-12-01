<?php
/*     $logued = $this->session->userdata('logued_in');
	 $session = $this->session->userdata('session_id');
    
if($logued === FALSE || $session === FALSE ){ // por seguridad hacemos doble verificación; aunque estas 
                                              // 2 variables siempre van a tener el mismo estado 
	redirect('login'); exit();
	
}*/	
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="<?=base_url();?>assets/images/favicon.png" type="image/png">
  <link rel="stylesheet" type="text/css" href="<?=base_url();?>assets/template/style.css"/>

  <title>Altuve</title>
  <script src="<?=base_url();?>assets/js/jquery-1.10.2.min.js"></script>
  <link href="<?=base_url();?>assets/css/style.default.css" rel="stylesheet">
  <link href="<?=base_url();?>assets/css/jquery.datatables.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body>

<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<section>
  
  <div class="leftpanel">
    
    <div class="logopanel">
        <img src="<?=base_url();?>assets/images/logo.png"/>
    </div><!-- logopanel -->
        
    <div class="leftpanelinner">    
        
        <!-- This is only visible to small devices -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">   
            <div class="media userlogged">
                <img alt="" src="<?=base_url();?>assets/images/photos/loggeduser.png" class="media-object">
                <div class="media-body">
                    <h4>José López</h4>
                </div>
            </div>
          
            <h5 class="sidebartitle actitle">Cuenta</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="profile.html"><i class="fa fa-user"></i> <span>Perfil</span></a></li>
              <li><a href="#"><i class="fa fa-cog"></i> <span>Configuración de cuenta</span></a></li>
              <li><a href="#"><i class="fa fa-question-circle"></i> <span>Ayuda</span></a></li>
              <li><a href="signout.html"><i class="fa fa-sign-out"></i> <span>Cerrar sesión</span></a></li>
            </ul>
        </div>
      
      <h5 class="sidebartitle">Menú</h5>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li class="active"><a href="blank.html"><i class="fa fa-home"></i> <span>Inicio</span></a></li>
        <li><a href="usuarios.html"><i class="fa fa-user"></i> <span>Usuarios</span></a></li>
        <li><a href="transportes.html"><i class="fa fa-truck"></i> <span>Transporte</span></a></li>
        <li><a href="clientes.html"><i class="fa fa-suitcase"></i> <span>Clientes</span></a></li>
        <li class="nav-parent"><a href="tables.html"><i class="fa fa-th-list"></i> <span>Pedidos</span></a>
        <ul class="children">
            <li><a href="buttons.html"><i class="fa fa-caret-right"></i> Buttons</a></li>
            <li><a href="icons.html"><i class="fa fa-caret-right"></i> Icons</a></li>
            <li><a href="typography.html"><i class="fa fa-caret-right"></i> Typography</a></li>
            <li><a href="alerts.html"><i class="fa fa-caret-right"></i> Alerts &amp; Notifications</a></li>
            <li><a href="tabs-accordions.html"><i class="fa fa-caret-right"></i> Tabs &amp; Accordions</a></li>
            <li><a href="sliders.html"><i class="fa fa-caret-right"></i> Sliders</a></li>
            <li><a href="graphs.html"><i class="fa fa-caret-right"></i> Graphs &amp; Charts</a></li>
            <li><a href="widgets.html"><i class="fa fa-caret-right"></i> Panels &amp; Widgets</a></li>
            <li><a href="extras.html"><i class="fa fa-caret-right"></i> Extras</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->
  
  <div class="mainpanel">
    
    <div class="headerbar">
      
      <a class="menutoggle"><i class="fa fa-bars"></i></a>
      
      <form class="searchform" action="http://themepixels.com/demo/webpage/bracket/index.html" method="post">
        <input type="text" class="form-control" name="keyword" placeholder="Buscar..." />
      </form>
      
      <div class="header-right">
        <ul class="headermenu">
          <li>
                
         <?php if($total_items=$this->cart->total_items()):?> 
		<li class="title"><?=anchor('products/cart', '#Productos: '.$total_items);?></li>
		<?php endif; ?>


       
       
          
          
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="<?=base_url();?>assets/images/photos/loggeduser.png" alt="" />
                José López
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><?=anchor('login/logout', 'Cerrar Sesión');?></li>
              </ul>
            </div>
          </li>
          
        </ul>
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
    
    <div class="pageheader">
      <h2><i class="fa fa-home"></i> Bienvenido <span>Sistema de distribución</span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">Página actual:</span>
        <ol class="breadcrumb">
          <li class="active">Inicio</li>
        </ol>
      </div>
    </div>