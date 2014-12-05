<div class="contentpanel">

    <div class="row">

        <div class="col-md-12">

            <table id="rutas" class="table table-striped">
                <caption>Ruta: <?=$row_ruta->nombre;?> | Pedidos Pendientes</caption>
                <thead>
                    <tr>
                        <th width="5%">#</th>
                        <th width="10%">Cod. Cliente</th>
                        <th>Cliente</th>
                        <th width="10%">Pedido</th>
                        <th width="10%">Monto</th>
                        <th width="10%">Volumen</th>
                        <th width="10%">Estado</th>
                        <th width="10%">Opciones</th>
                    </tr>
                </thead>
                <tbody>
<?php
    if ($query_pd_sinasignar){
        $j=1;
        foreach ($query_pd_sinasignar->result() as $row)
        {
            echo '<tr>
                    <td>'.$j.'</td>
                    <td>'.$row->cl_id.'</td>
                    <td>'.$row->cl_nombre.'</td>
                    <td>'.$row->pd_id.'</td>
                    <td>$ '.$row->pd_monto.'</td>
                    <td>'.$row->pd_volumen.' m<sup>3</sup></td>
                    <td>'.$row->pd_status.'</td>                
                    <td>
                        '.anchor('ruta/agregar_pedido/'.$rt_id."/".$row->pd_id, 'Agregar', 'title="Agregar a transporte" class="btn btn-success btn-sm"').'                        
                    </td>
                </tr>';
            $j++;
        }
    }
?>
                </tbody>
            </table>
            
        </div><!-- col-md-12 -->

    </div><!-- row -->
    
<?php if (isset($excede) and $excede==1){ ?>    
    <div style="width: 100%; margin-bottom: 10px;" class="btn btn-danger">
        Pedido excede capacidad de transporte
    </div><!-- row -->
<?php } ?>

    
    <div class="row">

        <div class="col-md-12">

            <table id="rutas" class="table table-striped">
                <caption>Transporte: <?=$row_transporte->placa;?> | Pedidos Asignados</caption>
                <thead>
                    <tr>
                        <td colspan="1">Capacidad:</td>                    
                        <td colspan="1"> <?=$row_ruta_transporte_volumen->rt_volumen;?> m<sup>3</sup> / <?=$row_transporte->capacidad_volumen;?> m<sup>3</sup> </td>                        
                        <td colspan="6"><progress style="width: 100%" value="<?=$row_ruta_transporte_volumen->rt_volumen;?>" max="<?=$row_transporte->capacidad_volumen;?>"></progress></td>
                    </tr>
                    <tr>
                        <th width="5%">#</th>
                        <th width="10%">Cod. Cliente</th>
                        <th>Cliente</th>
                        <th width="10%">Pedido</th>
                        <th width="10%">Monto</th>
                        <th width="10%">Volumen</th>
                        <th width="10%">Estado</th>
                        <th width="10%">Opciones</th>
                    </tr>
                </thead>
                <tbody>
<?php
    $j=0;
    if ($query_pd_asignados){
        $j=1;
        foreach ($query_pd_asignados->result() as $row)
        {
            echo '<tr>
                    <td>'.$j.'</td>
                    <td>'.$row->cl_id.'</td>
                    <td>'.$row->cl_nombre.'</td>
                    <td>'.$row->pd_id.'</td>
                    <td>$ '.$row->pd_monto.'</td>
                    <td>'.$row->pd_volumen.' m<sup>3</sup></td>
                    <td>'.$row->pd_status.'</td>                
                    <td>                        
                        '.anchor('ruta/remover_pedido/'.$rt_id."/".$row->pd_id, 'Remover', 'title="Remover de transporte" class="btn btn-danger btn-sm"').'
                    </td>
                </tr>';
            $j++;
        }
    }
?>
                </tbody>
            </table>
            
        </div><!-- col-md-12 -->

    </div><!-- row -->
    
    <div>
        <?php
            if ($j!=0) echo anchor('ruta/cargar_transporte/'.$rt_id, 'Cargar Transporte', 'title="Cargar Transporte" class="btn btn-success btn-sm"')." ";            
            echo anchor('ruta', 'Cancelar', 'title="Cancelar" class="btn btn-primary btn-sm"');
        ?>
    </div>
    
    

    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2014. Derechos reservados. Altuve
        </div>
    </div>

</div><!-- signuppanel -->