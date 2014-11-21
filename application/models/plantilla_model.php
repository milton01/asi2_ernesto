<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

    class Plantilla_model extends CI_Model{

        /* Funciones de consulta de datos */

        function tabla_listar(){        
            //Con framework
            //$this->db->select("id");        
            //$this->db->select('id_persona, nombres, apellidos, natalicio, id_departamento');        
            //$this->db->from('personas');  
            //$this->db->where('id', $id); 
            //$query = $this->db->get();   
            
            //Query directa
            $query = $this->db->query("SELECT 
                                            id 
                                       FROM 
                                            tabla
                                       WHERE
                                            1");
            //Devolvemos al controlador los datos
            if ($query->num_rows() > 0) return $query; 
        }

        /* Funciones de manipulacion de datos */

        function tabla_insertar($campo){

            $data = array( 
                           'campo'            => $campo
                           );

            return $this->db->insert('tabla',$data);   
                
        }

        function persona_actualizar($id, $campo){

            $data = array( 
                           'campo'          => $nombres
                           );
            $this->db->where('id', $id);           
            return $this->db->update('tabla',$data);        
        }
        
        function tabla_eliminar($id){

            $this->db->where('id', $id);           
            return $this->db->delete('tabla');                  
        }
        
    }
    
?>
