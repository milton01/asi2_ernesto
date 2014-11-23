<?=heading($title, 2);?>
<?php foreach($results as $result): ?>	
  <?=form_open('products/add'); ?> 	 
	<div class="products">	
	 <p><?=$result->descripcion;?></p>
	   
  <div class="image"><?=img(base_url().'images/'.$result->imagen);?></div>
  
  <div class="detalles"><?='Pantalla: '.$result->descripcion;?></div>
	            
  <div class="price"><?='Precio: '.'$'.$result->preciov;?></div>

		<div class="option">
	    <!-- 	<?php if($result->valores):?>
	     		
					<?=form_label($result->opcion);?>
					<?=form_dropdown($result->opcion,$result->valores);?>

				<?php endif; ?> -->
				
			<?=form_hidden('id', $result->codigo); ?>
			<?=form_hidden('segment', $this->uri->segment(3));?>
			<?=form_submit('action', 'Comprar'); ?>
	  </div>		
  </div><!-- End Products -->
            <?=form_close(); ?>
  <?php endforeach; ?> 	
 			
<div id="pagination"><?=$this->pagination->create_links();?></div>