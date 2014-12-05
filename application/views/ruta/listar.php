<div class="contentpanel">

    <div class="row">

        <div class="col-md-12">

            <table id="rutas" class="table table-striped">
                <caption>Rutas</caption>
                <thead>
                    <tr>
                        <th width="5%">#</th>
                        <th width="10%">Cod. Ruta</th>
                        <th>Nombre Ruta</th>
                        <th width="10%">Transporte</th>
                        <th width="20%">Opciones</th>
                    </tr>
                </thead>
                <tbody>
<?php
    if ($query){
        $j=1;
        foreach ($query->result() as $row)
        {
            if($row->tn_estado==8) $boton = anchor('ruta/ruta_pedidos/'.$row->rt_id, 'Pedidos', 'title="Pedidos de ruta" class="btn btn-success btn-sm"');
            else if($row->tn_estado==9) $boton = anchor('#'.$row->rt_id, 'En Ruta', 'title="Transporte en ruta" class="btn btn-warning btn-sm disabled"');
            else $boton = anchor('#'.$row->rt_id, 'Sin Vehiculo', 'title="No hay vehiculo asignado" class="btn btn-info btn-sm disabled"');
            echo '<tr>
                    <td>'.$j.'</td>
                    <td>'.$row->rt_id.'</td>
                    <td>'.$row->rt_nombre.'</td>
                    <td>'.$row->tn_placa.'</td>
                    <td>'.$boton.'</td>
                </tr>';
            $j++;
        }
    }
?>
                </tbody>
            </table>
            
        </div><!-- col-sm-6 -->

    </div><!-- row -->

    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2014. Derechos reservados. Altuve
        </div>
    </div>

</div><!-- signuppanel -->