<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pedido_model extends CI_Model{
    
    /* Funciones de inicializacion */
    
    function tiempo_ahora(){
        return date('Y-m-d H:i:s');
    }
    
    function fecha_ahora(){
        return date('Y-m-d');
    }

    /* Funciones de consulta de datos */

    function listar_pedidos(){
        //Define el arreglo con parametros escapados para la query
        $data = array();
        $data[] = 1; //Define el estado
        
        //Query directa            
        $query = $this->db->query("SELECT 
                                    pd.id AS pd_id,
                                    cl.cliente_id AS cl_id,
                                    cl.nombre_c AS cl_nombre,
                                    (select SUM(dp.cantidad * pr.preciov) from detalle_pedido dp natural join producto pr where dp.pedido_id = pd.id) as pd_monto,
                                    (select st.nombre from `status` st WHERE st.id = pd.status_id) AS pd_status
                                    FROM 
                                    pedido pd NATURAL JOIN cliente cl 
                                    WHERE 
                                    pd.status_id = 1;", $data);
        //Devolvemos al controlador los datos
        if ($query->num_rows() > 0) return $query; 
    }
    
    function listar_detalle_pedido($pd_id){
        //Define el arreglo con parametros escapados para la query
        $data = array();
        $data[] = $pd_id; //Define el registro seleccionado
        
        //Query directa            
        $query = $this->db->query("SELECT
                                    dp.id AS dp_id,
                                    pr.codigo AS pr_codigo,
                                    pr.descripcion AS pr_descripcion,
                                    dp.cantidad AS dp_cantidad
                                   FROM 
                                    detalle_pedido dp, producto pr
                                   WHERE
                                    dp.codigoprod = pr.codigo AND
                                    dp.pedido_id = ?", $data);
        //Devolvemos al controlador los datos
        if ($query->num_rows() > 0) return $query; 
    }

    function mostrar_pedido($pd_id){
        //Query con framework (parametros automaticamente escapados)
        $this->db->select();        
        $this->db->from('pedido');  
        $this->db->where('id', $pd_id);         
        $query = $this->db->get();
        //Devolvemos al controlador los datos
        if ($query->num_rows() > 0) return $query;        
    }
    
    function mostrar_cliente($pd_id){
        //Query con framework (parametros automaticamente escapados)
        $this->db->select();        
        $this->db->from('cliente');  
        $this->db->where('cliente_id', $pd_id);         
        $query = $this->db->get();
        //Devolvemos al controlador los datos
        if ($query->num_rows() > 0) return $query;        
    }
    
    function mostrar_detalle_pedido($dp_id){
        //Query con framework (parametros automaticamente escapados)
        $this->db->select();        
        $this->db->from('detalle_pedido');  
        $this->db->where('id', $dp_id);        
        $query = $this->db->get();
        //Devolvemos al controlador los datos
        if ($query->num_rows() > 0) return $query;        
    }
    
    function max_inventario(){
        //Recupera el ultimo id
        $this->db->select();        
        $this->db->from('inventario');  
        $this->db->select_max('id');;         
        $query = $this->db->get();
        $row = $query->row();
        return $row->id + 1;
    }
    
    /* Funciones de manipulacion de datos */

    function insertar_inventario($pd_id, $pr_id, $mv_id, $al_id, $in_cantidad){
        
        

        $data = array(  
                        'id' => $this->max_inventario(),
                        'no_transaccion' => $pd_id,                        
                        'codigoprod' => $pr_id,                        
                        'tipo_mov' => $mv_id,
                        'movimientoid' => $mv_id,
                        'almacenid' => $al_id,
                        'cantidad' => $in_cantidad,
                        'fecha_mov' => $this->fecha_ahora()
                        );
        return $this->db->insert('inventario',$data);   

    }

    function estado_pedido($pd_id, $st_id){

        $data = array( 
                        'status_id' => $st_id
                        );
        $this->db->where('id', $pd_id);           
        return $this->db->update('pedido',$data);        
    }
    
    function actualizar_detalle_pedido($dp_id, $dp_cantidad){
        $data = array( 
                        'cantidad' => $dp_cantidad
                        );
        $this->db->where('id', $dp_id);           
        return $this->db->update('detalle_pedido',$data);
    }
    
    function actualizar_inventario($pd_id, $pr_id, $mv_id, $al_id, $in_cantidad){
        $data = array( 
                        'cantidad' => $in_cantidad,
                        'fecha_mov' => $this->fecha_ahora()
                        );
        $this->db->where('no_transaccion', $pd_id);
        $this->db->where('codigoprod', $pr_id);        
        $this->db->where('tipo_mov', $mv_id);
        $this->db->where('movimientoid', $mv_id);
        $this->db->where('almacenid', $al_id);
        return $this->db->update('inventario',$data);
    }
    
    function eliminar($id){

        $this->db->where('id', $id);           
        return $this->db->delete('tabla');                  
    }

}
    
?>
