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
                    
                <h3 class="nomargin">Registrate</h3>
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
                    <label class="control-label">NIT (Sin guiones)</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">DUI (Sin guiones)</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Número de registro (Sin guiones)</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Giro</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Nombre jurídico del negocio</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Nombre comercial del negocio</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Teléfono fijo (Sin guiones)</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Celular (Sin guiones)</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Fax (Sin guiones)</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Correo electrónico</label>
                    <input type="email" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Dirección</label>
                    <input type="text" class="form-control" />
                </div>
                <div class="mb10">
                    <label class="control-label">Departamento</label>
                    <div class="col-sm-20">
                        <select class="form-control chosen-select" data-placeholder="Departamento">
                            <option value=""></option>
                            <option value="Ahuachapan">Ahuachapán</option>
                            <option value="Santa Ana">Santa Ana</option>
                            <option value="Sonsonate">Sonsonate</option>
                            <option value="La Libertad">La Libertad</option>
                            <option value="Chalatenango">Chalatenango</option>
                            <option value="San Salvador">San Salvador</option>
                            <option value="Cuscatlan">Cuscatlán</option>
                            <option value="La Paz">La Paz</option>
                            <option value="San Vicente">San Vicente</option>
                            <option value="Cabañas">Cabañas</option>
                            <option value="Usulutan">Usulután</option>
                            <option value="San Miguel">San Miguel</option>
                            <option value="Morazán">Morazán</option>
                            <option value="La Union">La Unión</option>
                        </select>
                    </div>
                </div>
                <div class="mb10">
                    <label class="control-label">Municipio</label>                    
                    <div class="col-sm-20">
                        <select class="form-control chosen-select" data-placeholder="Municipio">
                            <option value=""></option>
                            <option value="Ahuachapan">Ahuachapán</option>
                            <option value="Apaneca">Apaneca</option>
                            <option value="Atiquizaya">Atiquizaya</option>
                            <option value="Concepción de Ataco">Concepción de Ataco</option>
                            <option value="El Refugio">El Refugio</option>
                            <option value="Guaymango">Guaymango</option>
                            <option value="Jujutla">Jujutla</option>
                            <option value="San Francisco Menéndez">San Francisco Menéndez</option>
                            <option value="San Lorenzo">San Lorenzo</option>
                            <option value="San Pedro Puxtla">San Pedro Puxtla</option>
                            <option value="Tacuba">Tacuba</option>
                            <option value="Turín">Turín</option>                            
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