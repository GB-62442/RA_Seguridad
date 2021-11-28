
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/28/2021 04:33:11
-- Generated from EDMX file: C:\Users\T450s\source\repos\Seguridad_RA\RA\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [seguridad_api];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_equipo_pokemon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[equipo] DROP CONSTRAINT [FK_equipo_pokemon];
GO
IF OBJECT_ID(N'[dbo].[FK_equipo_usuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[equipo] DROP CONSTRAINT [FK_equipo_usuario];
GO
IF OBJECT_ID(N'[dbo].[FK_evolucion_pokemon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[evolucion] DROP CONSTRAINT [FK_evolucion_pokemon];
GO
IF OBJECT_ID(N'[dbo].[FK_evolucion_tipo_evolucion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[evolucion] DROP CONSTRAINT [FK_evolucion_tipo_evolucion];
GO
IF OBJECT_ID(N'[dbo].[FK_tipopkmn_pokemon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tipopkmn] DROP CONSTRAINT [FK_tipopkmn_pokemon];
GO
IF OBJECT_ID(N'[dbo].[FK_tipopkmn_tipo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tipopkmn] DROP CONSTRAINT [FK_tipopkmn_tipo];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[equipo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[equipo];
GO
IF OBJECT_ID(N'[dbo].[evolucion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[evolucion];
GO
IF OBJECT_ID(N'[dbo].[pokemon]', 'U') IS NOT NULL
    DROP TABLE [dbo].[pokemon];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[tipo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tipo];
GO
IF OBJECT_ID(N'[dbo].[tipo_evolucion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tipo_evolucion];
GO
IF OBJECT_ID(N'[dbo].[tipopkmn]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tipopkmn];
GO
IF OBJECT_ID(N'[dbo].[usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'evolucion'
CREATE TABLE [dbo].[evolucion] (
    [evolucion_id] int  NOT NULL,
    [pokemon] int  NOT NULL,
    [tipoe] int  NOT NULL,
    [orden] int  NOT NULL
);
GO

-- Creating table 'pokemon'
CREATE TABLE [dbo].[pokemon] (
    [pokemon_id] int IDENTITY(1,1) NOT NULL,
    [pokemon_nombre] varchar(50)  NULL,
    [pokemon_desc] varchar(max)  NULL,
    [pokemon_altura] decimal(18,0)  NULL,
    [pokemon_peso] decimal(18,0)  NULL,
    [pokemon_img] varchar(500)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'tipo'
CREATE TABLE [dbo].[tipo] (
    [tipo_id] int IDENTITY(1,1) NOT NULL,
    [tipo_nombre] nvarchar(max)  NULL
);
GO

-- Creating table 'tipo_evolucion'
CREATE TABLE [dbo].[tipo_evolucion] (
    [tipoe_id] int IDENTITY(1,1) NOT NULL,
    [tipoe_nombre] varchar(50)  NULL
);
GO

-- Creating table 'tipopkmn'
CREATE TABLE [dbo].[tipopkmn] (
    [tipopkmn_id] int  NOT NULL,
    [tipo_id] int  NOT NULL,
    [pokemon_id] int  NOT NULL
);
GO

-- Creating table 'usuario'
CREATE TABLE [dbo].[usuario] (
    [usuario_id] int IDENTITY(1,1) NOT NULL,
    [usuario_nombre] nvarchar(max)  NOT NULL,
    [usuario_apellido] nvarchar(max)  NULL,
    [usuario_nickname] nchar(20)  NOT NULL,
    [usuario_genero] nvarchar(max)  NULL,
    [usuario_pass] varchar(max)  NULL,
    [usuario_tel] varchar(10)  NULL
);
GO

-- Creating table 'equipo'
CREATE TABLE [dbo].[equipo] (
    [pokemon] int  NOT NULL,
    [usuario] int  NOT NULL,
    [orden] smallint  NOT NULL,
    [id_equipopkmn] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [evolucion_id] in table 'evolucion'
ALTER TABLE [dbo].[evolucion]
ADD CONSTRAINT [PK_evolucion]
    PRIMARY KEY CLUSTERED ([evolucion_id] ASC);
GO

-- Creating primary key on [pokemon_id] in table 'pokemon'
ALTER TABLE [dbo].[pokemon]
ADD CONSTRAINT [PK_pokemon]
    PRIMARY KEY CLUSTERED ([pokemon_id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [tipo_id] in table 'tipo'
ALTER TABLE [dbo].[tipo]
ADD CONSTRAINT [PK_tipo]
    PRIMARY KEY CLUSTERED ([tipo_id] ASC);
GO

-- Creating primary key on [tipoe_id] in table 'tipo_evolucion'
ALTER TABLE [dbo].[tipo_evolucion]
ADD CONSTRAINT [PK_tipo_evolucion]
    PRIMARY KEY CLUSTERED ([tipoe_id] ASC);
GO

-- Creating primary key on [tipopkmn_id] in table 'tipopkmn'
ALTER TABLE [dbo].[tipopkmn]
ADD CONSTRAINT [PK_tipopkmn]
    PRIMARY KEY CLUSTERED ([tipopkmn_id] ASC);
GO

-- Creating primary key on [usuario_id] in table 'usuario'
ALTER TABLE [dbo].[usuario]
ADD CONSTRAINT [PK_usuario]
    PRIMARY KEY CLUSTERED ([usuario_id] ASC);
GO

-- Creating primary key on [pokemon], [usuario], [orden] in table 'equipo'
ALTER TABLE [dbo].[equipo]
ADD CONSTRAINT [PK_equipo]
    PRIMARY KEY CLUSTERED ([pokemon], [usuario], [orden] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [pokemon] in table 'evolucion'
ALTER TABLE [dbo].[evolucion]
ADD CONSTRAINT [FK_evolucion_pokemon]
    FOREIGN KEY ([pokemon])
    REFERENCES [dbo].[pokemon]
        ([pokemon_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_evolucion_pokemon'
CREATE INDEX [IX_FK_evolucion_pokemon]
ON [dbo].[evolucion]
    ([pokemon]);
GO

-- Creating foreign key on [evolucion_id] in table 'evolucion'
ALTER TABLE [dbo].[evolucion]
ADD CONSTRAINT [FK_evolucion_tipo_evolucion]
    FOREIGN KEY ([evolucion_id])
    REFERENCES [dbo].[tipo_evolucion]
        ([tipoe_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [pokemon] in table 'equipo'
ALTER TABLE [dbo].[equipo]
ADD CONSTRAINT [FK_equipo_pokemon]
    FOREIGN KEY ([pokemon])
    REFERENCES [dbo].[pokemon]
        ([pokemon_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [pokemon_id] in table 'tipopkmn'
ALTER TABLE [dbo].[tipopkmn]
ADD CONSTRAINT [FK_tipopkmn_pokemon]
    FOREIGN KEY ([pokemon_id])
    REFERENCES [dbo].[pokemon]
        ([pokemon_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_tipopkmn_pokemon'
CREATE INDEX [IX_FK_tipopkmn_pokemon]
ON [dbo].[tipopkmn]
    ([pokemon_id]);
GO

-- Creating foreign key on [tipo_id] in table 'tipopkmn'
ALTER TABLE [dbo].[tipopkmn]
ADD CONSTRAINT [FK_tipopkmn_tipo]
    FOREIGN KEY ([tipo_id])
    REFERENCES [dbo].[tipo]
        ([tipo_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_tipopkmn_tipo'
CREATE INDEX [IX_FK_tipopkmn_tipo]
ON [dbo].[tipopkmn]
    ([tipo_id]);
GO

-- Creating foreign key on [usuario] in table 'equipo'
ALTER TABLE [dbo].[equipo]
ADD CONSTRAINT [FK_equipo_usuario]
    FOREIGN KEY ([usuario])
    REFERENCES [dbo].[usuario]
        ([usuario_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_equipo_usuario'
CREATE INDEX [IX_FK_equipo_usuario]
ON [dbo].[equipo]
    ([usuario]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------