<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class pedido extends CI_Controller {
    
    /* Funciones de inicializacion */
    
    public function __construct() {
        parent::__construct();
        //Carga modelos
        $this->load->model('pedido_model');
    }
    
    
    /* Funciones de consulta de datos */
    
    public function index() {        
        //Se ejecuta la consulta
        $query = $this->pedido_model->listar_pedidos();

        //Se preparan los parametros de la vista
        $data['main']='pedido/listar';
        $data['title']='Altuve | Pedidos';
        $data['query'] = $query;
        
        //Se carga la vista con plantilla
        $this->load->view('includes/template',$data);
    }
    
    public function despachar($pd_id) {        
        //Se ejecuta la consulta
        $query_productos = $this->pedido_model->listar_detalle_pedido($pd_id);
        
        //Consultas de encabezado
        $query_pedido = $this->pedido_model->mostrar_pedido($pd_id);
        //Se extran los valores de la consulta
        $row_pedido = $query_pedido->row();        
        //Consultas de encabezado
        $query_cliente = $this->pedido_model->mostrar_cliente($row_pedido->cliente_id);
        //Se extran los valores de la consulta
        $row_cliente = $query_cliente->row();
        
        //Se preparan los parametros de la vista
        $data['main']='pedido/despachar';
        $data['title']='Altuve | Despachar pedido';
        $data['row_pedido'] = $row_pedido;
        $data['row_cliente'] = $row_cliente;
        $data['query_productos'] = $query_productos;
        
        //Se carga la vista con plantilla
        $this->load->view('includes/template',$data);
    }
    
    public function rechazar($pd_id) {        
        //Se ejecuta la consulta
        $query_productos = $this->pedido_model->listar_detalle_pedido($pd_id);
        
        //Consultas de encabezado
        $query_pedido = $this->pedido_model->mostrar_pedido($pd_id);
        //Se extran los valores de la consulta
        $row_pedido = $query_pedido->row();        
        //Consultas de encabezado
        $query_cliente = $this->pedido_model->mostrar_cliente($row_pedido->cliente_id);
        //Se extran los valores de la consulta
        $row_cliente = $query_cliente->row();
        
        //Se preparan los parametros de la vista
        $data['main']='pedido/rechazar';
        $data['title']='Altuve | Rechazar pedido';
        $data['row_pedido'] = $row_pedido;
        $data['row_cliente'] = $row_cliente;
        $data['query_productos'] = $query_productos;
        
        //Se carga la vista con plantilla
        $this->load->view('includes/template',$data);
    }
    
    
    /* Funciones de manipulacion de datos */
    
    public function procesar_despacho($pd_id) {
        if ( isset($_POST['dpid']) AND
             isset($_POST['prid']) AND         
             isset($_POST['prcn']) AND
             isset($_POST['dpid']) != null AND
             isset($_POST['prid']) != null AND         
             isset($_POST['prcn']) != null) {
            
            //Procesa
            $dpid = array();
            $prid = array();
            $prcn = array();            
            $count = 0;            
            foreach( $_POST['dpid'] as $val ) {
                $dpid[] = $val;
            }
            foreach( $_POST['prid'] as $val ) {
                $prid[] = $val;
            }
            foreach( $_POST['prcn'] as $val ) {
                $prcn[] = $val;                
                $count++;
            }
            
            $this->db->trans_start();
            for ($i = 0; $i <= $count-1; $i++) {                
                //Consultas de encabezado
                $query_dp = $this->pedido_model->mostrar_detalle_pedido($dpid[$i]);                 
                //Se extran los valores de la consulta
                $query_dp = $query_dp->row();
                if ($dpid[$i] != $query_dp->cantidad){
                    $dp_actualizado = $this->pedido_model->actualizar_detalle_pedido($dpid[$i], $prcn[$i]);
                    //pedido, producto, movimiento, almacen, cantidad
                    $in_actualizado_v = $this->pedido_model->actualizar_inventario($pd_id, $query_dp->codigoprod, 2, 1, -$prcn[$i]);
                    $in_actualizado_r = $this->pedido_model->actualizar_inventario($pd_id, $query_dp->codigoprod, 6, 2, $prcn[$i]);
                }
            }
            //Actualiza el estado del pedido a despachado
            $pedido_actualizado = $this->pedido_model->estado_pedido($pd_id, 2);
            $this->db->trans_complete();
            
            //Retorna a principal con cambios guardados
            redirect('pedido');
            
        }else{
            
            //Retorna a principal si no hay detalle
            redirect('pedido');
            
        }
    }
    
    public function procesar_rechazo($pd_id) {        
        //Se ejecuta la consulta para recuperar el detalle
        $query_dp = $this->pedido_model->listar_detalle_pedido($pd_id);
        
        //Si contiene datos se procesa
        if ($query_dp) {                        
            
            //$this->db->trans_start();
            foreach ($query_dp->result() as $row_dp){                 
                //pedido, producto, movimiento, almacen, cantidad
                $in_insertado_d_listo = $this->pedido_model->insertar_inventario($pd_id, $row_dp->pr_codigo, 2, 1, $row_dp->dp_cantidad);
                $in_insertado_d_ruta = $this->pedido_model->insertar_inventario($pd_id, $row_dp->pr_codigo, 6, 2, -$row_dp->dp_cantidad);

            }
            //Actualiza el estado del pedido a rechazado
            $pedido_actualizado = $this->pedido_model->estado_pedido($pd_id, 3);
            $this->db->trans_complete();
            
            //Retorna a principal con cambios guardados
            redirect('pedido');
            
        }else{
            
            //Retorna a principal si no hay detalle
            redirect('pedido');
            
        }
    }
    
}