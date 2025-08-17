# Sistema de Bolsa de Trabajo en Tiempo Real

## Descripción
Este proyecto es una **plataforma de bolsa de trabajo en tiempo real** desarrollada en **Java (JDK 21)** con **MySQL (XAMPP 3.3.0)**.  
El sistema permite que **empresas publiquen vacantes** y que **postulantes apliquen en tiempo real**, utilizando **hilos y concurrencia** para simular interacciones simultáneas.  

Se implementan **estructuras concurrentes, colas compartidas y notificaciones en tiempo real**, asegurando sincronización y evitando condiciones de carrera.  

---

## Objetivos
- Implementar **hilos** para múltiples empresas que publican vacantes de manera concurrente.  
- Crear **hilos para postulantes** que buscan y aplican a vacantes.  
- Manejar **colas compartidas** para solicitudes recibidas.  
- Notificar en tiempo real a las empresas cuando un candidato aplica.  
- Asegurar **sincronización de datos** y evitar inconsistencias.  
- Desarrollar una **interfaz gráfica (mínimo 3 ventanas)**:
  - **Panel de Empresas** → Crear y publicar vacantes.  
  - **Panel de Postulantes** → Buscar y aplicar a vacantes.  
  - **Panel de Administración** → Ver estadísticas y postulaciones activas.  

---

## Tecnologías utilizadas
- **Lenguaje:** Java (JDK 21)  
- **IDE:** IntelliJ IDEA  
- **Base de Datos:** MySQL (XAMPP v3.3.0)  
- **Concurrencia:** Hilos, colas sincronizadas, eventos  
- **GUI:** Java Swing / JavaFX (dependiendo de implementación)  

---

## Instalación y configuración

### 1. Clonar repositorio

git clone https://github.com/usuario/sistema_vacantes.git
cd sistema_vacantes

### 2. Configurar Base de Datos
Iniciar XAMPP y activar MySQL.

Crear la base de datos:
CREATE DATABASE sistema_vacantes;
Importar el archivo sistema_vacantes.sql incluido en la carpeta /sql.

Configurar las credenciales en el archivo de conexión (ejemplo):
String url = "jdbc:mysql://localhost:3306/bolsa_trabajo";
String user = "root";
String password = "";

### 3. Ejecutar el Proyecto
Abrir en IntelliJ IDEA
Compilar y ejecutar con JDK 21

### Nota: También puedes generar el .jar desde File > Project Structure > Artifacts > Build

### 4. Ejecutar desde Terminal

java -jar sistema_vacantes.jar


## Funcionalidades principales
• Publicación de vacantes en tiempo real (empresas).
• Aplicación de postulantes concurrentes.
• Notificaciones instantáneas al empleador.
• Visualización de estadísticas en panel de administración.
• Control de sincronización y manejo de concurrencia.

## Arquitectura y Concurrencia
• Hilos de Empresas: generan vacantes concurrentemente.
• Hilos de Postulantes: aplican a empleos en paralelo.
• Colas Concurrentes: gestionan las solicitudes.
• Eventos y Notificaciones: comunican en tiempo real.
•Bloqueos / Monitores: evitan condiciones de carrera.

## Interfaz Gráfica (GUI)
El sistema cuenta con al menos 3 paneles:
Empresas → Crear vacantes.
Postulantes → Buscar y aplicar.
Administración → Gestion y control.

## Autores
### Proyecto académico desarrollado por:
• Rubi Maria Cobos Ramos
• Ingridh Maricela Gracia Flores
• Veyra Maria Gutierrez Gomez
• Jesus Emmanuel Lopez Zuñiga
•Jennifer Elizabeth Yepez Lopez
