<body class="login tooltips">
                <!--
		===========================================================
		BEGIN PAGE
		===========================================================
		-->
		<div class="login-header text-center">
                    <?=img('images/logo-login.png');?>
		</div>
		<div class="login-wrapper">
			<div class="alert alert-warning alert-bold-border fade in alert-dismissable">
			  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			  Ingrese su correo electrónico para recuperar contraseña.
			</div>
			<form role="form">
				<div class="form-group has-feedback lg left-feedback no-label">
				  <input type="email" class="form-control no-border input-lg rounded" placeholder="Enter email">
				  <span class="fa fa-envelope form-control-feedback"></span>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-warning btn-lg btn-perspective btn-block">REINICIAR CONTRASEÑA</button>
				</div>
			</form>
			<p class="text-center"><?php echo anchor('master/index', '<small>Iniciar sesion</small>', 'title="Iniciar sesion"');?></p>
		</div><!-- /.login-wrapper -->
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
		
	</body>
</html>