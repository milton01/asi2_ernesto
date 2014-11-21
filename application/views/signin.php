<div class="signinpanel">

    <div class="row">

        <div class="col-md-7">

            <div class="signin-info">
                <div class="logopanel">
                    <img src="images/logo-login.png"/>
                </div><!-- logopanel -->

                <div class="mb20"></div>

                <h5><strong>Bienvenido al sistema de distribución</strong></h5>
                <ul>
                    <li><i class="fa fa-arrow-circle-o-right mr5"></i> Control de usuarios</li>
                    <li><i class="fa fa-arrow-circle-o-right mr5"></i> Control de transporte</li>
                    <li><i class="fa fa-arrow-circle-o-right mr5"></i> Registro de clientes</li>
                    <li><i class="fa fa-arrow-circle-o-right mr5"></i> Pedidos</li>
                    <li><i class="fa fa-arrow-circle-o-right mr5"></i> Estado de pedidos</li>
                </ul>
                <div class="mb20"></div>
            </div><!-- signin0-info -->

        </div><!-- col-sm-7 -->

        <div class="col-md-5">

            <form method="post" action="">
                <h4 class="nomargin">Iniciar sesión</h4>
                <p class="mt5 mb20">Inicia sesión para acceder a su cuenta.</p>

                <input type="text" class="form-control uname" placeholder="Nombre de usuario" />
                <input type="password" class="form-control pword" placeholder="Contraseña" />
                <a href=""><small>Olvido su contraseña?</small></a> | <?php echo anchor('master/registro', '<small>Registrate</small>', 'title="Registrate"');?>
                <button class="btn btn-success btn-block">Iniciar sesión</button>

            </form>
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