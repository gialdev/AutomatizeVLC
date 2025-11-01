# 📺 Sistema de Reproducción Automática de Videos - HDMI/VLC

Sistema automatizado para reproducir videos en bucle en una segunda pantalla (HDMI/TV) usando VLC Media Player. Ideal para displays públicos, señalización digital o sistemas de información.

## 📋 Descripción

Este proyecto contiene scripts para configurar la reproducción automática de videos en una segunda pantalla conectada vía HDMI. Los videos se reproducen en bucle de forma continua al iniciar el sistema Windows.

## 🎯 Características

- ✅ Reproducción automática al iniciar Windows
- ✅ Ejecución en bucle infinito de todos los videos
- ✅ Configuración para segunda pantalla (monitor 2)
- ✅ Soporte para múltiples formatos de video (MP4, AVI, MKV, MOV, WMV)
- ✅ Pantalla completa sin barras de título
- ✅ Ejecución como tarea programada del sistema
- ✅ Monitoreo continuo del proceso VLC

## 📁 Estructura del Proyecto

```
AUTOPLAYVLC/
│
├── Automatize_V.bat      # Script principal de reproducción
├── IniciarVideosTV.xml   # Tarea programada de Windows (Task Scheduler)
└── README.md             # Este archivo
```

## 🔧 Requisitos

- **Sistema Operativo**: Windows 10/11
- **VLC Media Player**: Instalado en `C:\Program Files\VideoLAN\VLC\vlc.exe`
- **Configuración**: Múltiples monitores (pantalla principal + segunda pantalla/HDMI)

## 📂 Configuración de Rutas

El script busca los videos en:
```
C:\ProgramData\Videos
```

**Formatos soportados:**
- `.mp4`
- `.avi`
- `.mkv`
- `.mov`
- `.wmv`

## 🚀 Instalación y Uso

### Paso 1: Preparar la carpeta de videos

1. Crea la carpeta `C:\ProgramData\Videos` si no existe
2. Coloca todos los videos que deseas reproducir en esta carpeta

### Paso 2: Verificar VLC

Asegúrate de que VLC esté instalado en la ruta predeterminada:
```
C:\Program Files\VideoLAN\VLC\vlc.exe
```

Si VLC está en otra ubicación, edita la línea 12 de `Automatize_V.bat`:

```batch
set "VLC=C:\Ruta\A\Tu\VLC\vlc.exe"
```

### Paso 3: Configurar la tarea programada

#### Opción A: Importar la tarea XML (Recomendado)

1. Abre el **Programador de tareas** de Windows (Task Scheduler)
2. Haz clic en **"Importar tarea..."** en el panel derecho
3. Selecciona el archivo `IniciarVideosTV.xml`
4. Ajusta la ruta del script en la acción si es necesario (línea 45 del XML)
5. Guarda la tarea

#### Opción B: Ejecutar manualmente

1. Ejecuta `Automatize_V.bat` manualmente cuando desees iniciar la reproducción
2. O crea un acceso directo y configúralo para ejecutarse al inicio

### Paso 4: Configurar múltiples monitores

1. Conecta tu segunda pantalla o TV vía HDMI
2. Configura Windows para usar múltiples monitores
3. Asegúrate de que el monitor 2 esté configurado como segunda pantalla

## ⚙️ Personalización

### Cambiar el número de pantalla

Si deseas reproducir en una pantalla diferente, edita la línea 52 de `Automatize_V.bat`:

```batch
--qt-fullscreen-screennumber=1  # Cambia 1 por el número de pantalla deseado (0 = primera, 1 = segunda, etc.)
```

### Modificar el tiempo de espera inicial

Edita la línea 31 para cambiar los segundos de espera:

```batch
timeout /t 10 /nobreak  # Cambia 10 por los segundos deseados
```

### Cambiar el intervalo de monitoreo

Edita la línea 57 para ajustar la frecuencia de verificación:

```batch
timeout /t 60 /nobreak  # Cambia 60 por los segundos deseados
```

## 🔍 Cómo Funciona

1. **Inicio automático**: La tarea programada se ejecuta al iniciar Windows o al iniciar sesión
2. **Espera inicial**: El script espera 10 segundos para asegurar que todo el sistema esté listo
3. **Búsqueda de videos**: Escanea la carpeta `C:\ProgramData\Videos` en busca de videos
4. **Reproducción**: Inicia VLC en pantalla completa en el monitor 2 con todos los videos en bucle
5. **Monitoreo**: Verifica cada 60 segundos que VLC siga ejecutándose
6. **Reinicio automático**: Si VLC se cierra, el script termina (puede ser reiniciado por la tarea programada)

## 📝 Parámetros de VLC Utilizados

- `--fullscreen`: Reproduce en pantalla completa
- `--loop`: Reproduce en bucle infinito
- `--no-video-title-show`: Oculta el título del video
- `--qt-fullscreen-screennumber=1`: Selecciona el monitor 2
- `--playlist-autostart`: Inicia la reproducción automáticamente
- `--no-qt-name-in-title`: Oculta el nombre en la barra de título

## 🛠️ Solución de Problemas

### VLC no se encuentra
- Verifica que VLC esté instalado en la ruta especificada
- O actualiza la variable `VLC` en el script con la ruta correcta

### No se reproducen videos
- Verifica que exista la carpeta `C:\ProgramData\Videos`
- Asegúrate de que haya videos en formato soportado
- Revisa los permisos de la carpeta

### Los videos no aparecen en la segunda pantalla
- Verifica la configuración de múltiples monitores en Windows
- Ajusta `--qt-fullscreen-screennumber` según tu configuración
- Asegúrate de que la segunda pantalla esté configurada como extensión del escritorio

### La tarea programada no se ejecuta
- Verifica los permisos de usuario
- Revisa que la ruta del script en el XML sea correcta
- Comprueba que la tarea esté habilitada en el Programador de tareas

## 👤 Autor

**GialDev**

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Añadir nueva característica'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## ⚠️ Notas Importantes

- Este script está diseñado para ejecutarse continuamente hasta que se apague la PC
- Asegúrate de tener suficiente espacio en disco para tus videos
- El script requiere permisos administrativos para funcionar correctamente
- Recomendado para uso en sistemas dedicados o kioscos

## 📞 Soporte

Si encuentras algún problema o tienes sugerencias, por favor abre un issue en el repositorio.

---

⭐ Si este proyecto te ha sido útil, ¡considera darle una estrella!

