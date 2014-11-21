<div class="contentpanel">

    <div class="row">

        <div class="col-md-12">

            <table id="pedidos" class="table table-striped">
                <caption>Pedidos</caption>
                <thead>
                    <tr>
                        <th width="5%">#</th>
                        <th width="10%">Cod. Cliente</th>
                        <th>Cliente</th>
                        <th width="10%">Cod. Pedido</th>
                        <th width="20%">Monto</th>
                        <th width="5%">Estado</th>
                        <th width="20%">Opciones</th>
                    </tr>
                </thead>
                <tbody>
<?php
    if ($query){
        $j=1;
        foreach ($query->result() as $row)
        {
            echo '<tr>
                    <td>'.$j.'</td>
                    <td>'.$row->cl_id.'</td>
                    <td>'.$row->cl_nombre.'</td>
                    <td>'.$row->pd_id.'</td>
                    <td>'.$row->pd_monto.'</td>
                    <td>'.$row->pd_status.'</td>                
                    <td>
                        '.anchor('pedido/despachar/'.$row->pd_id, 'Despachar', 'title="Despachar pedido" class="btn btn-success btn-sm"').'
                        '.anchor('pedido/rechazar/'.$row->pd_id, 'Rechazar', 'title="Rechazar pedido" class="btn btn-danger btn-sm"').'
                    </td>
                </tr>';
            $j=1;
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