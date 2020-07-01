-- crea las DB y las tablas 
-- Elimina la DB
-- ENGINE = InnoDB : se recomienda usar esta ingeniería para poder usar transaccion
drop database dbPendientes;

-- Crea la DB
CREATE database IF NOT EXISTS dbPendientes DEFAULT CHARACTER SET utf8mb4;
-- Indica la BD que se usará 
use dbPendientes;

-- ----------------------------------------------------------------------------------
-- Tabla pendientes
-- ----------------------------------------------------------------------------------
create table if not exists personas(
	id_personas     int         not null     auto_increment,
    nombre       varchar(60)    not null,
    correo       varchar(30)      null,
    telefono     varchar(30)      null,
    primary key (id_personas)
)ENGINE = InnoDB;

-- ----------------------------------------------------------------------------------
-- Tabla estatusPendientes
-- ----------------------------------------------------------------------------------
create table if not exists estatusPendiente(
	id_EstatusPendiente    int       not null      auto_increment,
    estatus             varchar(20)   not null,
    primary key (id_estatusPendiente)
)ENGINE = InnoDB;

-- ----------------------------------------------------------------------------------
-- Tabla tipoIngEg
-- ----------------------------------------------------------------------------------
create table if not exists tipoIngEg(
	id_tipoIngEg       int        not null      auto_increment,
    descripcion    varchar(30)    not null,
    primary key (id_tipoIngEg)
);

-- ----------------------------------------------------------------------------------
-- Tabla grupoIngEg
-- ----------------------------------------------------------------------------------
create table if not exists grupoIngEg(
	id_grupoIngEg       int       not null     auto_increment,
    descripcion      varchar(30),
    observaciones    varchar(50),
    primary key (id_grupoIngEg)
);

-- ----------------------------------------------------------------------------------
-- Tabla usuarios
-- ----------------------------------------------------------------------------------
create table if not exists usuarios(
	id_usuarios       int           not null   auto_increment,
    nombre         varchar(30)      not null,
    password       varchar(45)      not null,
    idPersonas         int          not null,
    primary key (id_usuarios),
	
    -- se crea un indice
    index fkUsuariosPersonas_idx (idPersonas asc),
    
    -- el convenio recomendado es poner primero la relacion de muchos 
    constraint fkUsuariosPersonas
    foreign key (idPersonas)
    references personas (id_personas)
    on delete no action
    on update no action
);

-- ----------------------------------------------------------------------------------
-- Tabla pendientes
-- ----------------------------------------------------------------------------------
create table if not exists pendientes(
	id_pendientes        int         not null      auto_increment,
    fechaCreacion      datetime      not null,
    gechaEntrega       datetime      not null,
    descripcion        varchar(250)  not null,
    idEstatusPendiente    int        not null,
    observaciones      varchar(250)    null,
    idPersonaQueAsigno    int        not null,
    idPersonaAsignado     int        not null,
    solucionPendiente  varchar(250)    null,
    primary key (id_pendientes),

    INDEX fkPendientesEstatusPendiente_idx (idEstatusPendiente ASC),
    INDEX fkPendientesPersonaQueAsigno_idx (idPersonaQueAsigno ASC),
    INDEX fkPendientesPersonaAsignado_idx (idPersonaAsignado ASC),
    
    constraint fkPendientesEstatusPendiente
    foreign key (idEstatusPendiente)
    references estatusPendiente (id_estatusPendiente)
    on delete no action 
    on update no action, 
    
    constraint fkPendientesPersonaQueAsigno
    foreign key (idPersonaQueAsigno)
    references personas (id_personas)
    on delete no action
    on update no action,
    
    constraint fkPendientesPersonaAsignado
    foreign key (idPersonaAsignado)
    references personas (id_personas)
    on delete no action
    on update no action
);

-- ----------------------------------------------------------------------------------
-- Tabla ingresosEgresos
-- ----------------------------------------------------------------------------------
create table if not exists ingresosEgresos(
	id_ingresosEgresos        int        not null      auto_increment,
    descripcion           varchar(30)    not null,
    idTipoIngEg               int,
    idGrupoIngEg              int,
    observaciones         varchar(50),
    primary key (id_ingresosEgresos),
    
    INDEX fkIngresosEgresosTipoIngEg_idx (idTipoIngEg ASC),
    INDEX fkIngresosEgresosGrupoIngEg_idx (idGrupoIngEg ASC),
    
    constraint fkIngresosEgresosTipoIngEg
    foreign key (idTipoIngEg)
    references tipoIngEg (id_tipoIngEg)
    on delete no action
    on update no action,
    
    constraint fkIngresosEgresosGrupoIngEg
    foreign key (idGrupoIngEg)
    references grupoIngEg (id_grupoIngEg)
    on delete no action
    on update no action
);

-- ----------------------------------------------------------------------------------
-- Tabla entradaSalidaDinero
-- ----------------------------------------------------------------------------------
create table if not exists entradaSalidaDinero(
	id_entradaSalidaDinero      int        not null      auto_increment,
    fechaES                  datetime,
    idIngresosEgresos           int,
    montoIE                 decimal(6,2)   not null,
    idPersonas                  int,
    observaciones           varchar(250)     null,
    primary key (id_entradaSalidaDinero),
    
    index fkEntradaSalidaDineroIngresosEgresos_idx (idIngresosEgresos asc),
    index fkEntradaSalidaDineroPersonas_idx (idPersonas asc),
    
    constraint fkEntradaSalidaDineroIngresosEgresos
    foreign key (idIngresosEgresos)
    references ingresosEgresos (id_IngresosEgresos)
    on delete no action
    on update no action,
    
    constraint fkEntradaSalidaDineroPersonas
    foreign key (idPersonas)
    references personas (id_personas)
    on delete no action
    on update no action
);
