# Ser Manos

Bienvenido a Ser Manos, una aplicación móvil desarrollada en Flutter que tiene como objetivo conectar a personas dispuestas a ofrecer su tiempo como voluntarios con organizaciones que requieren ayuda. La aplicación proporciona una plataforma intuitiva para encontrar oportunidades de voluntariado y facilita la colaboración entre voluntarios y organizaciones.

## Monitoreo de eventos

Seleccionamos tres eventos principales para justificar el seguimiento.

### select_content

En primer lugar, "select_content" hace referencia a la interacción de un usuario con un voluntariado a una noticia. Es decir, se registra este evento cada vez que un usuario entra en el detalle de una entidad.

#### Parámetros:

- content_type: volunteering/news
- content_id: Id de la entidad

El principal objetivo de este evento es tener un seguimiento de la popularidad de los voluntariados y las noticias. Pudiendo observar cuales son los que más atraen al usuario.

### apply_volunteering / dropout_volunteering

En segundo lugar, se registra cuando un usuario envía una solicitud de participación o cuando un usuario cancela la misma. Este evento es esencial dentro del objetivo final de la aplicación, la participación en voluntariados. En consecuancia, este evento es un claro indicador de la efectividad que esta teniendo la aplicación.

Adicionalmente, este evento se puede complementar con "select_content". Si tomamos la cantidad de veces que los usuarios entran en un voluntariado con la cantidad de veces que aplican al mismo podemos obtener diversas conclusiones. Por ejemplo, si "select_content" es alto pero "apply_volunteering" es bajo puede ser un indicador de que el voluntariado es interesante pero la disponibilidad requerida o las restricciones son demasiado fuertes.

## sign_up

Por último, "sign_up" hace un seguimientod de el registro de nuevos usuarios. Este evento tiene un foco más hacia la popularidad de la app como un todo y no a cada voluntariado en particular.

## Testing

Para ejecutar las pruebas, utiliza el siguiente comando desde el directorio principal del proyecto:

```bash
flutter test -t <etiqueta>

```

Etiquetas de Pruebas
Las pruebas están organizadas utilizando etiquetas (tags) para facilitar la ejecución selectiva de conjuntos específicos de pruebas. Puedes utilizar las siguientes etiquetas según tus necesidades:

- golden
- profile
- unit
- volunteering
- user
- news
- image
- auth

```bash
flutter test -t <etiqueta>

```
