
	<body class="tooltips">
		<!--
		===========================================================
		BEGIN PAGE
		===========================================================
		-->
		<div class="wrapper">
			<!-- BEGIN TOP NAV -->
			<div class="top-navbar">
				<div class="top-navbar-inner">
					
					<!-- Begin Logo brand -->
					<div class="logo-brand">
                                          <img src="<?=base_url()?>images/logo-login.png" />    
					</div><!-- /.logo-brand -->
					<!-- End Logo brand -->
					
					<div class="top-nav-content">
						
						<!-- Begin button sidebar left toggle -->
						<div class="btn-collapse-sidebar-left">	
							<i class="fa fa-long-arrow-right icon-dinamic"></i>
						</div><!-- /.btn-collapse-sidebar-left -->
						<!-- End button sidebar left toggle -->
						
						
						
						<!-- Begin button nav toggle -->
						<div class="btn-collapse-nav" data-toggle="collapse" data-target="#main-fixed-nav">
							<i class="fa fa-plus icon-plus"></i>
						</div><!-- /.btn-collapse-sidebar-right -->
						<!-- End button nav toggle -->
						
						
						<!-- Begin user session nav -->
						<ul class="nav-user navbar-right">
                                                    <img src="<?=base_url()?>assets/img/avatar/avatar-1.jpg" />
                                                    Bienvenid@, <strong>Veronica López</strong>
							<li class="dropdown">
                                                            <a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown"></a>
								
                                                                <ul class="dropdown-menu square primary margin-list-rounded with-triangle">
                                                                    <li><a href="#fakelink">Cambiar password</a></li>								
								<li><a href="login.html">Cerrar sesion</a></li>
                                                                </ul>
							  </a>
							</li>
						</ul>
						<!-- End user session nav -->
						
						<!-- Begin Collapse menu nav -->
						<div class="collapse navbar-collapse" id="main-fixed-nav">
						</div><!-- /.navbar-collapse -->
						<!-- End Collapse menu nav -->
					</div><!-- /.top-nav-content -->
				</div><!-- /.top-navbar-inner -->
			</div><!-- /.top-navbar -->
			<!-- END TOP NAV -->
			
			
			
			<!-- BEGIN SIDEBAR LEFT -->
			<div class="sidebar-left sidebar-nicescroller">
				<ul class="sidebar-menu">
                                    <li>
					<?php echo anchor('master', 'Confirmacion de clientes');?>
                                    </li>
                                    <li>
					<?php echo anchor('master', 'Carrito de compras');?>
                                    </li>                               <li>
					<?php echo anchor('pedido', 'Ver pedido');?>
                                    </li>
                                   <li class="inactive">
                                            <?php echo anchor('ruta', 'Llenar camion.................>');?>
                                        <ul class="submenu visible">
                                            <li><?php echo anchor('ruta', 'Agregar pedidos a la ruta');?></li>
                                            <li><?php echo anchor('ruta', 'Facturacion de pedidos');?></li>
                                        </ul>
                                    </li>
                                    <li class="active selected">
                                            <?php echo anchor('ruta', 'Liquidacion de rutas');?>
                                    </li>
                                    <li class="inactive">
                                            <?php echo anchor('ruta', 'Ventas directas...........>');?> 
                                        <ul class="submenu visible">
                                            <li><?php echo anchor('ruta', 'Agregar pedido');?></li>
                                            <li><?php echo anchor('ruta', 'Facturacion de pedido');?></li>
                                        </ul>
                                    </li>
                                    <li class="inactive">
                                            <?php echo anchor('ruta', 'Reportes...................>');?>
                                        <ul class="submenu visible">
                                            <li><?php echo anchor('ruta', 'Ventas por ruta');?></li>
                                            <li><?php echo anchor('ruta', 'Ventas por dia');?></li>
                                            <li><?php echo anchor('ruta', 'Ventas por mes');?></li>
                                            <li><?php echo anchor('ruta', 'Ventas por año');?></li>
                                        </ul>
                                    </li>
                                    <li class="inactive">
                                            <?php echo anchor('ruta', 'Mantenimientos........>');?>
                                        <ul class="submenu visible">
                                            <li><?php echo anchor('ruta', 'Registrar cliente');?></li>
                                            <li><?php echo anchor('ruta', 'Registrar empleado');?></li>
                                            <li><?php echo anchor('ruta', 'Registrar proveedor');?></li>
                                            <li><?php echo anchor('ruta', 'Status para diferentes tablas');?></li>
                                            <li><?php echo anchor('ruta', 'Tipo de movimiento de inventario');?></li>
                                        </ul>
                                    </li>
                                    <div class="visible-xs hidden-sm hidden-md hidden-lg">   
            <div class="media userlogged">
                <img alt="" src="images/photos/loggeduser.png" class="media-object">
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
        <li class="active"><a href="index.html"><i class="fa fa-home"></i> <span>Inicio</span></a></li>
        <li><a href="usuarios.html"><i class="fa fa-user"></i> <span>Usuarios</span></a></li>
        <li><a href="transportes.html"><i class="fa fa-truck"></i> <span>Transporte</span></a></li>
        <li><a href="clientes.html"><i class="fa fa-suitcase"></i> <span>Clientes</span></a></li>
        <li class="nav-parent"><a href="tables.html"><i class="fa fa-th-list"></i> <span>Pedidos</span></a>
        <ul class="children">
            <li><a href="#.html"><i class="fa fa-caret-right"></i> link</a></li>
            <li><a href="#.html"><i class="fa fa-caret-right"></i> link</a></li>
            <li><a href="#.html"><i class="fa fa-caret-right"></i> link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- leftpanelinner -->
  </div>
				</ul>
			</div><!-- /.sidebar-left -->
			<!-- END SIDEBAR LEFT -->
			
			
			
			<!-- BEGIN SIDEBAR RIGHT HEADING -->
			<div class="sidebar-right-heading">
				<ul class="nav nav-tabs square nav-justified">
				  <li class="active"><a href="#online-user-sidebar" data-toggle="tab"><i class="fa fa-comments"></i></a></li>
				  <li><a href="#notification-sidebar" data-toggle="tab"><i class="fa fa-bell"></i></a></li>
				  <li><a href="#task-sidebar" data-toggle="tab"><i class="fa fa-tasks"></i></a></li>
				  <li><a href="#setting-sidebar" data-toggle="tab"><i class="fa fa-cogs"></i></a></li>
				</ul>
			</div><!-- /.sidebar-right-heading -->
			<!-- END SIDEBAR RIGHT HEADING -->
			
			
			
			<!-- BEGIN SIDEBAR RIGHT -->
			<div class="sidebar-right sidebar-nicescroller">
				<div class="tab-content">
				  <div class="tab-pane fade in active" id="online-user-sidebar">
					<ul class="sidebar-menu online-user">
						<li class="static">ONLINE USERS</li>
					</ul>
				  </div>
                                    <div>
				  <div class="tab-pane fade" id="task-sidebar">
					<ul class="sidebar-menu sidebar-task">
						<li class="static">UNCOMPLETED</li>
						<li><a href="#fakelink" data-toggle="tooltip" title="in progress" data-placement="left">
							<i class="fa fa-clock-o icon-task-sidebar progress"></i>
							Creating documentation
							<span class="small-caps">Deadline : Next week</span>
						</a></li>
						<li><a href="#fakelink" data-toggle="tooltip" title="uncompleted" data-placement="left">
							<i class="fa fa-exclamation-circle icon-task-sidebar uncompleted"></i>
							Eating sand
							<span class="small-caps">Deadline : 2 hours ago</span>
						</a></li>
						<li><a href="#fakelink" data-toggle="tooltip" title="uncompleted" data-placement="left">
							<i class="fa fa-exclamation-circle icon-task-sidebar uncompleted"></i>
							Sending payment
							<span class="small-caps">Deadline : 2 seconds ago</span>
						</a></li>
						<li><a href="#fakelink" data-toggle="tooltip" title="in progress" data-placement="left">
							<i class="fa fa-clock-o icon-task-sidebar progress"></i>
							Uploading new version
							<span class="small-caps">Deadline : Tomorrow</span>
						</a></li>
						
						<li class="static">COMPLETED</li>
						<li><a href="#fakelink" data-toggle="tooltip" title="completed" data-placement="left">
							<i class="fa fa-check-circle-o icon-task-sidebar completed"></i>
							Drinking coffee
							<span class="small-caps">Completed : 10 hours ago</span>
						</a></li>
						<li><a href="#fakelink" data-toggle="tooltip" title="completed" data-placement="left">
							<i class="fa fa-check-circle-o icon-task-sidebar completed"></i>
							Walking to nowhere
							<span class="small-caps">Completed : Yesterday</span>
						</a></li>
						<li><a href="#fakelink" data-toggle="tooltip" title="completed" data-placement="left">
							<i class="fa fa-check-circle-o icon-task-sidebar completed"></i>
							Sleeping under bridge
							<span class="small-caps">Completed : Feb 10 2014</span>
						</a></li>
						<li><a href="#fakelink" data-toggle="tooltip" title="completed" data-placement="left">
							<i class="fa fa-check-circle-o icon-task-sidebar completed"></i>
							Buying some cigarettes
							<span class="small-caps">Completed : Jan 15 2014</span>
						</a></li>
						
						<li class="static text-center"><button class="btn btn-success btn-sm">See all tasks</button></li>
					</ul>
				  </div><!-- /#task-sidebar -->
				  <div class="tab-pane fade" id="setting-sidebar">
					<ul class="sidebar-menu">
						<li class="static">ACCOUNT SETTING</li>
					</ul>
				  </div><!-- /#setting-sidebar -->
				</div><!-- /.tab-content -->
			</div><!-- /.sidebar-right -->
			<!-- END SIDEBAR RIGHT -->
			
			
			
			<!-- BEGIN PAGE CONTENT -->
			<div class="page-content">
				
				
				<div class="container-fluid">
					<!-- Begin page heading -->
					<h1 class="page-heading">Carrito de compras <small>Detalle de productos</small></h1>
					<!-- End page heading -->
				
					<!-- Begin breadcrumb -->
					<ol class="breadcrumb default square rsaquo sm">
						<li><a href="index.html"><i class="fa fa-home"></i></a></li>
						<li><a href="#fakelink">Productos</a></li>
						<li class="active">Carrito de compras</li>
					</ol>
					<!-- End breadcrumb -->
					
					<div class="the-box no-border">
						<div class="table-responsive">
						</div><!-- /.table-responsive -->
						<p class="text-right">
                                                <button class="btn btn-warning"><i class="fa fa-refresh"></i> Update cart</button>
						<button class="btn btn-success"><i class="fa fa-check"></i> Check pout</button>
						</p>
					</div><!-- /.the-box no-border -->
					
					
				
				</div><!-- /.container-fluid -->
				
				
				
				<!-- BEGIN FOOTER -->
				<footer>
					&copy; 2014 <a href="#fakelink">Altuve</a><br />
					Sistema de distribución
				</footer>
				<!-- END FOOTER -->
				
				
			</div><!-- /.page-content -->
		</div><!-- /.wrapper -->
		<!-- END PAGE CONTENT -->
		
		
	
		
		
		
		<!--
		===========================================================
		END PAGE
		===========================================================
		-->
		
		<!--
		===========================================================
		Placed at the end of the document so the pages load faster
		===========================================================
		-->
		<!-- MAIN JAVASRCIPT (REQUIRED ALL PAGE)-->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/plugins/retina/retina.min.js"></script>
		<script src="assets/plugins/nicescroll/jquery.nicescroll.js"></script>
		<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="assets/plugins/backstretch/jquery.backstretch.min.js"></script>
 
		<!-- PLUGINS -->
		<script src="assets/plugins/skycons/skycons.js"></script>
		<script src="assets/plugins/prettify/prettify.js"></script>
		<script src="assets/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
		<script src="assets/plugins/owl-carousel/owl.carousel.min.js"></script>
		<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
		<script src="assets/plugins/icheck/icheck.min.js"></script>
		<script src="assets/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="assets/plugins/timepicker/bootstrap-timepicker.js"></script>
		<script src="assets/plugins/mask/jquery.mask.min.js"></script>
		<script src="assets/plugins/validator/bootstrapValidator.min.js"></script>
		<script src="assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
		<script src="assets/plugins/datatable/js/bootstrap.datatable.js"></script>
		<script src="assets/plugins/summernote/summernote.min.js"></script>
		<script src="assets/plugins/markdown/markdown.js"></script>
		<script src="assets/plugins/markdown/to-markdown.js"></script>
		<script src="assets/plugins/markdown/bootstrap-markdown.js"></script>
		<script src="assets/plugins/slider/bootstrap-slider.js"></script>
		
		<!-- EASY PIE CHART JS -->
		<script src="assets/plugins/easypie-chart/easypiechart.min.js"></script>
		<script src="assets/plugins/easypie-chart/jquery.easypiechart.min.js"></script>
		
		<!-- KNOB JS -->
		<!--[if IE]>
		<script type="text/javascript" src="assets/plugins/jquery-knob/excanvas.js"></script>
		<![endif]-->
		<script src="assets/plugins/jquery-knob/jquery.knob.js"></script>
		<script src="assets/plugins/jquery-knob/knob.js"></script>

		<!-- FLOT CHART JS -->
		<script src="assets/plugins/flot-chart/jquery.flot.js"></script>
		<script src="assets/plugins/flot-chart/jquery.flot.tooltip.js"></script>
		<script src="assets/plugins/flot-chart/jquery.flot.resize.js"></script>
		<script src="assets/plugins/flot-chart/jquery.flot.selection.js"></script>
		<script src="assets/plugins/flot-chart/jquery.flot.stack.js"></script>
		<script src="assets/plugins/flot-chart/jquery.flot.time.js"></script>

		<!-- MORRIS JS -->
		<script src="assets/plugins/morris-chart/raphael.min.js"></script>
		<script src="assets/plugins/morris-chart/morris.min.js"></script>
		
		<!-- C3 JS -->
		<script src="assets/plugins/c3-chart/d3.v3.min.js" charset="utf-8"></script>
		<script src="assets/plugins/c3-chart/c3.min.js"></script>
		
		<!-- MAIN APPS JS -->
		<script src="assets/js/apps.js"></script>
		
	</body>
</html>