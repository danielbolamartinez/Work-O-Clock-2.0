# Roadmap de Desarrollo del Servidor - Work O'Clock 2.0

## Fase 1: Modelado de datos

* Crear entidades (`@Entity`) para:

  * Empleado
  * Rol
  * Empleado_Rol
  * Fichaje
  * Auditoría
  * Jornada
* Definir relaciones (1:N, N:N).
* Crear repositorios (`JpaRepository`) para cada entidad.

**Objetivo:** Modelos y base de datos funcionando con Hibernate.

---

## Fase 3: Seguridad

* Configurar Spring Security:

  * Password encoder (BCrypt)
  * JWT filters
  * Configurar rutas públicas vs protegidas
* Implementar login:

  * Endpoint `/login` o `/auth`
  * Devuelve JWT
* Middleware para validar JWT en cada request protegido.

**Objetivo:** Solo usuarios autenticados pueden acceder a endpoints críticos.

---

## Fase 4: Endpoints básicos (CRUD)

* **Empleados**:

  * `GET /empleados` → listar todos
  * `GET /empleados/{id}` → obtener uno
  * `POST /empleados` → crear
  * `PUT /empleados/{id}` → actualizar
  * `DELETE /empleados/{id}` → eliminar/desactivar
* **Roles**: CRUD similar
* **Fichajes**:

  * Registrar entrada/salida
  * Obtener histórico de un empleado
* **Auditoría**:

  * Guardar acciones importantes
  * Consultar logs (solo admin)

**Objetivo:** Endpoints funcionando con datos reales en MySQL.

---

## Fase 5: Integración y pruebas

* Usar Postman o Insomnia para probar todos los endpoints.
* Verificar que JWT funciona correctamente.
* Probar relaciones entre entidades:

  * Crear empleado con roles
  * Registrar fichajes
  * Consultar auditoría

**Objetivo:** Endpoints seguros y funcionales.

---

## Fase 6: Optimización y producción

* Manejar excepciones con `@ControllerAdvice`.
* Configurar logs (SLF4J o Logback).
* Considerar HTTPS/SSL para producción.
* Revisar queries complejas y rendimiento de la base de datos.
* Preparar Docker o empaquetado (`jar`) para despliegue.

---

## Roadmap visual simplificado

```
1. Modelado de datos y repositorios
      ↓
3. Seguridad: Spring Security + JWT
      ↓
4. CRUD de empleados, roles, fichajes, auditoría
      ↓
5. Integración y pruebas con Postman
      ↓
6. Optimización y despliegue
```
