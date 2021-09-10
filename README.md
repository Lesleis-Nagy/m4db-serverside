## Formats for queries
The JSON data format for a new query looks like
```json
{
  "geometry": {
    "name": "<geometry name>",
    "size": "<geometry size>",
    "size_convention": "[optional, default 'ESVD'] <one of: 'ESVD', 'ECVL'>",
    "unit": "[optional, default 'um'] <one of: 'm', 'cm', 'mm', 'um', 'nm', 'pm'>"
  },
  "materials": [
    {
      "name": "<material_name>",
      "temperature": "<material_temperature in C>",
      "submesh_id": "<geometry submesh id>"
    }
  ],
  "start_field": "<see below>",
  "external_field": {
    "x_direction": "<the x direction of the external field>",
    "y_direction": "<the y direction of the external field>",
    "z_direction": "<the z direction of the external field>",
    "strength": "<the external field strength>",
    "unit": "[optional, default: 'uT'] <one of: 'T', 'mT', 'uT', 'nT', 'pT'>"
  },
  
}
```


### start_field
The `start_field` can be a random field with an optional integer
```json
{
  "type": "random",
  "seed": "[optional] an integer"
}
```
or a uniform field (note: `x_direction`, `y_direction` and `z_direction` will be normalized)
```json
{
  "type": "uniform",
  "x_direction": "<the x direction of the uniform start field>",
  "y_direction": "<the y direction of the uniform start field>",
  "z_direction": "<the z direction of the uniform start field>"
}
```
or an existing model field (note: there is no checking to see if the `geometry` is compatible)
```json
{
  "type": "existing_model",
  "unique_id": "<a database unique id>"
}
```