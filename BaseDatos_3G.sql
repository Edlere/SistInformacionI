create table Cliente(
  DNICliente char(8) not null primary key,
  PrimerNombre varchar (20) not null,
  SegundoNombre varchar (20) not null,
  PrimerApellido varchar (20) not null,
  SegundoApellido varchar (20) not null
);

create table Compra(
IdCompra char(8) not null primary key,
DNICliente char (8) not null,
Fechadecompra date not null,
MontoCompra double not null
);

alter table Cliente
add constraint foreign key (DNICliente) references Cliente (DNICliente)
on update cascade
on delete cascade
;

create table Categoria(
Idcategoria char (3) not null primary key
Nombrecat varchar (20) not null

);




create table Articulo(
Idarticulo char (6) not null primary key,
Nombreart  varchar(20) not null ,
Precio double not null,
Descripcion varchar(75) not null,
Idcategoria char (3) not null

);

alter table Articulo
add constraint foreign key (Idcategoria) references Categoria (Idcategoria)
on update cascade
on delete cascade
;


create table CompraArticulo (
Idarticulo char (6) not null,
Idcompra char (8) not null,
Cantidad integer not null,
primary key(Idarticulo,Idcompra)
)
;

alter table CompraArticulo
add constraint foreign key (Idarticulo) references Articulo (Idarticulo)
on update cascade
on delete cascade
;

alter table CompraArticulo
add constraint foreign key (Idcompra) references Compra(Idcompra)
on update cascade
on delete cascade
;

create table Proveedor(
Idproveedor char (8) not null primary key,
RUC char (11) not null,
Nombrepro varchar not null
);

create table Pedido(
Idpedido char (8) not null primary key,
Precio double not null,
Idproveedor char(6) not null,
MontoPedido double not null
Fechadepedido date not null
);

alter table Pedido
add constraint foreign key (Idpedido) references Pedido (Idpedido)
on update cascade
on delete cascade
;

alter table Pedido
add constraint foreign key (Idproveedor) references Proveedor(Idproveedor)
on update cascade
on delete cascade
;



create table ArticuloPedido(
Idarticulo char (6) not null.
Idpedido char (8) not null,
CantidadPedido integer not null,
primary key(Idarticulo,Idpedido)
)
;


alter table ArticuloPedido
add constraint foreign key (Idarticulo) references Articulo (Idarticulo)
on update cascade
on delete cascade
;

alter table Pedido
add constraint foreign key (Idpedido) references Pedido(Idpedido)
on update cascade
on delete cascade
;
