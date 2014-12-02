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
                    
                <h3 class="nomargin">Registrar Empleado</h3>
                <p class="mt5 mb20"><?php echo anchor('master/index', '<small>¿Ya tienes cuenta? Ir a LOGIN</small>', 'title="¿Ya tienes cuenta?"');?></p>
                <div class="mb10">
                    <label class="control-label">Nombre de usuario</label>
                    <input type="text" class="form-control" />
                </div>

                <div class="mb10">
                    <label class="control-label">Contraseña</label>
                    <input type="password" class="form-control" />
                </div>

                <div class="mb10">
                    <label class="control-label">Repetir contraseña</label>
                    <input type="password" class="form-control" />
                </div>
               
                <div class="mb10">
                    <label class="control-label">DUI (Sin guiones)</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Nombres</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Apellidos</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Cargo</label>
                    <div class="col-sm-20">
                        <select class="form-control chosen-select" data-placeholder="--- Seleccione una opcion ---">
                            <option value=""></option>
                            <option value="Administrador">Administrador</option>
                            <option value="Bodeguero">Bodeguero</option>
                            <option value="Vendedor">Vendedor</option>
                            <option value="Televendedor">Televendedor</option>
                        </select>
                    </div>
                </div>
                <div class="mb10">
                    <label class="control-label">Fecha ingreso</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Celular (Sin guiones)</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Dirección</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Ruta</label>
                    <div class="col-sm-20">
                        <select class="form-control chosen-select" data-placeholder="--- Seleccione una opcion ---">
                            <option value=""></option>
                            <option value="9011">9011</option>
                            <option value="9012">9012</option>
                            <option value="9013">9013</option>
                            <option value="9014">9014</option>
                        </select>
                    </div>
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