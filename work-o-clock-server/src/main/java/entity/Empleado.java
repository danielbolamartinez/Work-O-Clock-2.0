/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "empleados")
@Data //Genera getters, setters, toString,equals y hashcode
@NoArgsConstructor //Genera consructor vacío, en JPA son necesarias para crear instanciasd de las entidades.
@AllArgsConstructor //Genera contructor con todos los campos como parámetros.
public class Empleado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nombre;

    @Column(nullable = false)
    private String apellidos;

    @Column(unique = true, nullable = false)
    private String email;

    @Column(unique = true, nullable = false)
    private String username;

    @Column(nullable = false)
    private String contraseña;

    private LocalDate fecha_alta;

    private Boolean activo = true;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "empleados_roles",
        joinColumns = @JoinColumn(name = "empleado_id"),
        inverseJoinColumns = @JoinColumn(name = "rol_id")
    )
    private List<Rol> roles;

    @OneToMany(mappedBy = "empleado", cascade = CascadeType.ALL)
    private List<Jornada> jornadas;

    @OneToMany(mappedBy = "empleado", cascade = CascadeType.ALL)
    private List<Fichaje> fichajes;

    @OneToMany(mappedBy = "empleado", cascade = CascadeType.ALL)
    private List<Auditoria> auditorias;
}
