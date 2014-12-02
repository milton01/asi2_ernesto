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
                    
                <h3 class="nomargin">Cambiar clave</h3>
                <p class="mt5 mb20"><?php echo anchor('master/index', '<small>¿Ya tienes cuenta? Ir a LOGIN</small>', 'title="¿Ya tienes cuenta?"');?></p>
                
                <div class="mb10">
                    <label class="control-label">Password Antiguo</label>
                    <input type="password" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Nuevo password</label>
                    <input type="password" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Repetir password</label>
                    <input type="password" class="form-control" />
                </div>
                <br/>
                <button class="btn btn-success btn-block">Guardar</button>
            </form>
        </div><!-- col-sm-6 -->

    </div><!-- row -->

    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2014. Derechos reservados. Altuve
        </div>
    </div>

</div><!-- signuppanel -->