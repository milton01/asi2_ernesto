<div class="signuppanel">

    <div class="row">

        <div class="col-md-6">

            <div class="signup-info">
                <div class="logopanel">
                   <?=img('images/logo-login.png');?>  
                </div><!-- logopanel -->

                <div class="mb20">
                </div>
            </div><!-- signup-info -->

        </div><!-- col-sm-6 -->

        <div class="col-md-6">

            <form method="post" action="#">
                    
                <h3 class="nomargin">Registrar Proveedor</h3>
                <p class="mt5 mb20"><?php echo anchor('master/index', '<small>¿Ya tienes cuenta? Ir a LOGIN</small>', 'title="¿Ya tienes cuenta?"');?></p>
                
                <div class="mb10">
                    <label class="control-label">NIT (Sin guiones)</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Giro</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Registro</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Nombre de la empresa</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Persona de contacto</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Telefono</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Correo</label>
                    <input type="email" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Direccion</label>
                    <input type="email" class="form-control" />
                </div>
                <br/>
                <button class="btn btn-success btn-block">Registrarse</button>
            </form>
        </div><!-- col-sm-6 -->

    </div><!-- row -->

    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2014. Derechos reservados. Altuve
        </div>
    </div>

</div><!-- signuppanel -->