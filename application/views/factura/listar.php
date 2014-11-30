<div class="row">
	<div class="col-md-2"></div>
	<div class="form 	col-md-8">
		<div class="form-group">
			<!-- Standard button -->
			<a href="factura/nuevo" class="btn btn-primary">Agregar</a>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row">
	<div class="col-md-2">
		
	</div>
	<div class="col-md-8">
		<div class="table-responsive">
			<table id="pedidos-pendientes" class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>Fecha Venta</th>
						<th>Fecha Pedido</th>
						<th>Cliente</th>
						<th>Forma de Pago</th>
						<th>Estado</th>
						<th>Ruta Entrega</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody>
					<? foreach ( $pedidos->result() as $pedido ) : ?>
					<tr>
						<td><?=$pedido->id_venta?></td>
						<td><?=$pedido->fecha_venta?></td>
						<td><?=$pedido->fecha_pedido?></td>
						<td><?=$pedido->razon_social?></td>
						<td><?=$pedido->forma_pago?></td>
						<td><?=$pedido->estado_venta?></td>
						<td><?=$pedido->ruta_venta?></td>
						<td>
							#botones
						</td>
					</tr>
					<? endforeach; ?>
				</tbody>
			</div>
			
		</div>
		<div class="col-md-2">
			
		</div>
	</div>
	<script src="<?=base_url("js/factura.js")?>"></script>