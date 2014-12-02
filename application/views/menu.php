
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
                                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"></a>								
                                                                <ul class="dropdown-menu square primary margin-list-rounded with-triangle">
                                                                    <li><?php echo anchor('cambio_password', 'Cambiar Password');?></li>							
                                                                    <li><?php echo anchor('master', 'Cerrar session');?></li>							
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
                                    </li>                               
                                    <li>
					<?php echo anchor('pedido', 'Ver pedido');?>
                                    </li>
                                    <li>
                                            <?php echo anchor('ruta', 'Registro de Compras');?>
                                    </li>
                                    <li>
                                            <?php echo anchor('ruta', 'Liquidacion de rutas');?>
                                    </li>
                                   <li>
                                            <?php echo anchor('ruta', 'Llenar camion.................>');?>
                                        <ul class="submenu visible">
                                            <li class="active selected"><?php echo anchor('ruta', 'Agregar pedidos a la ruta');?></li>
                                            <li class="active selected"><?php echo anchor('ruta', 'Facturacion de pedidos');?></li>
                                        </ul>
                                    </li>
                                    <li>
                                            <?php echo anchor('ruta', 'Ventas directas...........>');?> 
                                        <ul class="submenu visible">
                                            <li class="active selected"><?php echo anchor('ruta', 'Agregar pedido');?></li>
                                            <li class="active selected"><?php echo anchor('ruta', 'Facturacion de pedido');?></li>
                                        </ul>
                                    </li>
                                    <li>
                                            <?php echo anchor('ruta', 'Reportes...................>');?>
                                        <ul class="submenu visible">
                                            <li class="active selected"><?php echo anchor('ruta', 'Compras');?></li>
                                            <li class="active selected"><?php echo anchor('ruta', 'Inventario');?></li>
                                            <li class="active selected"><?php echo anchor('ruta', 'Inventario minimo');?></li>
                                            <li class="active selected"><?php echo anchor('ruta', 'Ventas por ruta');?></li>
                                            <li class="active selected"><?php echo anchor('ruta', 'Ventas por dia');?></li>
                                            <li class="active selected"><?php echo anchor('ruta', 'Ventas por mes');?></li>
                                            <li class="active selected"><?php echo anchor('ruta', 'Ventas por año');?></li>
                                        </ul>
                                    </li>
                                   <li>
                                     
                                            <?php echo anchor('ruta', 'Mantenimientos........>');?>
                                        <ul class="submenu visible">
                                            <li class="active selected"><?php echo anchor('registro', 'Registrar cliente');?></li>
                                            <li class="active selected"><?php echo anchor('registro/agregar_empleado', 'Registrar empleado');?></li>
                                            <li class="active selected"><?php echo anchor('registro/agregar_proveedor', 'Registrar proveedor');?></li>
                                            <li class="active selected"><?php echo anchor('registro/agregar_estatus', 'Status para diferentes tablas');?></li>
                                            <li class="active selected"><?php echo anchor('registro/agregar_tipo_mov_inventario', 'Tipo de movimiento de inventario');?></li>
                                        </ul>
                                    </li>
                                </ul>
    </div>
  </div>
                <script src="<?=base_url()?>assets/js/jquery.min.js"></script>
		<script src="<?=base_url()?>assets/js/bootstrap.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/retina/retina.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/nicescroll/jquery.nicescroll.js"></script>
		<script src="<?=base_url()?>assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/backstretch/jquery.backstretch.min.js"></script>
 
		<!-- PLUGINS -->
		<script src="<?=base_url()?>assets/plugins/skycons/skycons.js"></script>
		<script src="<?=base_url()?>assets/plugins/prettify/prettify.js"></script>
		<script src="<?=base_url()?>assets/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/owl-carousel/owl.carousel.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/chosen/chosen.jquery.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/icheck/icheck.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="<?=base_url()?>assets/plugins/timepicker/bootstrap-timepicker.js"></script>
		<script src="<?=base_url()?>assets/plugins/mask/jquery.mask.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/validator/bootstrapValidator.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/datatable/js/bootstrap.datatable.js"></script>
		<script src="<?=base_url()?>assets/plugins/summernote/summernote.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/markdown/markdown.js"></script>
		<script src="<?=base_url()?>assets/plugins/markdown/to-markdown.js"></script>
		<script src="<?=base_url()?>assets/plugins/markdown/bootstrap-markdown.js"></script>
		<script src="<?=base_url()?>assets/plugins/slider/bootstrap-slider.js"></script>
		
		<!-- EASY PIE CHART JS -->
		<script src="<?=base_url()?>assets/plugins/easypie-chart/easypiechart.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/easypie-chart/jquery.easypiechart.min.js"></script>
		
		<!-- KNOB JS -->
		<!--[if IE]>
		<script type="text/javascript" src="assets/plugins/jquery-knob/excanvas.js"></script>
		<![endif]-->
		<script src="<?=base_url()?>assets/plugins/jquery-knob/jquery.knob.js"></script>
		<script src="<?=base_url()?>assets/plugins/jquery-knob/knob.js"></script>

		<!-- FLOT CHART JS -->
		<script src="<?=base_url()?>assets/plugins/flot-chart/jquery.flot.js"></script>
		<script src="<?=base_url()?>assets/plugins/flot-chart/jquery.flot.tooltip.js"></script>
		<script src="<?=base_url()?>assets/plugins/flot-chart/jquery.flot.resize.js"></script>
		<script src="<?=base_url()?>assets/plugins/flot-chart/jquery.flot.selection.js"></script>
		<script src="<?=base_url()?>assets/plugins/flot-chart/jquery.flot.stack.js"></script>
		<script src="<?=base_url()?>assets/plugins/flot-chart/jquery.flot.time.js"></script>

		<!-- MORRIS JS -->
		<script src="<?=base_url()?>assets/plugins/morris-chart/raphael.min.js"></script>
		<script src="<?=base_url()?>assets/plugins/morris-chart/morris.min.js"></script>
		
		<!-- C3 JS -->
		<script src="<?=base_url()?>assets/plugins/c3-chart/d3.v3.min.js" charset="utf-8"></script>
		<script src="<?=base_url()?>assets/plugins/c3-chart/c3.min.js"></script>
		
		<!-- MAIN APPS JS -->
		<script src="<?=base_url()?>assets/js/apps.js"></script>
		
	</body>
</html>