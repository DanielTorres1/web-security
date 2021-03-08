Para actualizar el proyecto en servidores de producción, es necesario:

1. Instalar dependencias nuevas
```sh
npm install
```

2. Ejecutar actualizaciones en la Base de Datos a partir de migraciones
```sh
npm run seeders-migrations
```

3. Reiniciar el api del servicio en PM2
```sh
pm2 restart proyecto-api
```