<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ruta extends CI_Controller {
    
    /* Funciones de inicializacion */
    
    public function __construct() {
        parent::__construct();
        //Carga modelos aca
        $this->load->model('ruta_model');
    }
    
    
    /* Funciones de consulta de datos */
    
    public function index() {        
        //Se ejecuta la consulta
        $query = $this->ruta_model->listar_rutas();

        //Se preparan los parametros de la vista
        $data['main']='ruta/listar';
        $data['title']='Altuve | Rutas';
        $data['query'] = $query;
        
        //Se carga la vista con plantilla
        $this->load->view('includes/template',$data);
    }
        
    public function ruta_pedidos($rt_id, $excede=null) {        
        //Se ejecuta la consulta
        $query_pd_sinasignar = $this->ruta_model->listar_ruta_pedidos($rt_id, 2); //Estado despachado
        $query_pd_asignados = $this->ruta_model->listar_ruta_pedidos($rt_id, 3); //Estado confirmado
        
        //Consultas de encabezado
        $query_ruta = $this->ruta_model->mostrar_ruta($rt_id);
        //Se extran los valores de la consulta
        $row_ruta = $query_ruta->row();
        
        //Consultas de encabezado
        $query_transporte = $this->ruta_model->mostrar_transporte($rt_id);
        //Se extran los valores de la consulta
        $row_transporte = $query_transporte->row();
        
        //Consultas de encabezado
        $query_ruta_transporte_volumen = $this->ruta_model->mostrar_ruta_transporte_volumen($rt_id);
        //Se extran los valores de la consulta
        $row_ruta_transporte_volumen = $query_ruta_transporte_volumen->row();
        
        
        //Se preparan los parametros de la vista
        $data['main']='ruta/ruta_pedidos';
        $data['title']='Altuve | Ruta | Pedidos';
        $data['rt_id'] = $rt_id;
        $data['excede'] = $excede;        
        $data['row_ruta'] = $row_ruta;
        $data['row_transporte'] = $row_transporte;
        $data['row_ruta_transporte_volumen'] = $row_ruta_transporte_volumen;
        $data['query_pd_sinasignar'] = $query_pd_sinasignar;
        $data['query_pd_asignados'] = $query_pd_asignados;
        
        //Se carga la vista con plantilla
        $this->load->view('includes/template',$data);
    }
    
    
    /* Funciones de manipulacion de datos */
    
    public function agregar_pedido($rt_id, $pd_id) {
        if ( $pd_id != null ) {
            
            //Consultas de encabezado
            $query_transporte = $this->ruta_model->mostrar_transporte($rt_id);
            //Se extran los valores de la consulta
            $row_transporte = $query_transporte->row();
            
            //Consultas de encabezado
            $query_ruta_transporte_volumen = $this->ruta_model->mostrar_ruta_transporte_volumen($rt_id);
            //Se extran los valores de la consulta
            $row_ruta_transporte_volumen = $query_ruta_transporte_volumen->row();
            
            //Consultas de encabezado
            $query_pedido_volumen = $this->ruta_model->mostrar_pedido_volumen($pd_id);
            //Se extran los valores de la consulta
            $row_pedido_volumen = $query_pedido_volumen->row();
            
            if ( !( ($row_pedido_volumen->pd_volumen + $row_ruta_transporte_volumen->rt_volumen) > $row_transporte->capacidad_volumen ) ){
            
                $this->db->trans_start();
                    //Actualiza el estado del ruta a despachado
                    $pedido_actualizado = $this->ruta_model->estado_pedido($pd_id, 3);
                $this->db->trans_complete();
            
            }else{
                //Retorna a principal con cambios guardados
                redirect('ruta/ruta_pedidos/'.$rt_id.'/1');
            }
                
        }        
        //Retorna a principal con cambios guardados
        redirect('ruta/ruta_pedidos/'.$rt_id);
    }
    
    public function remover_pedido($rt_id, $pd_id) {
        if ( $pd_id != null ) {
            
            $this->db->trans_start();
                //Actualiza el estado del ruta a despachado
                $pedido_actualizado = $this->ruta_model->estado_pedido($pd_id, 2);
            $this->db->trans_complete();
                
        }        
        //Retorna a principal con cambios guardados
        redirect('ruta/ruta_pedidos/'.$rt_id);
    }
    
}