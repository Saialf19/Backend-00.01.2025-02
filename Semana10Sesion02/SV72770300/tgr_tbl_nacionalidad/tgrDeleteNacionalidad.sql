DELIMITER $$
 drop trigger if exists tgrDeleteNacionalidad;
create trigger tgrDeleteNacionalidad after delete on tbl_nacionalidad
for each row
begin
	INSERT INTO tbl_nacionalidad_audit
(`id`,
`descripcion`,
`is_activo`,
`usuario_creacion`,
`fecha_creacion`,
`usuario_modificacion`,
`fecha_modificacion`,
accion, user)
VALUES
(
	old.id,
    old.descripcion,
    old.is_activo,
    old.usuario_creacion,
    old.fecha_creacion,
    old.usuario_modificacion,
    old.fecha_modificacion,
    'D',
    current_user()
);

end

$$

delimiter ;