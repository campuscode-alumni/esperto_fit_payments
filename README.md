# EspertoFit

## Sistema de Cobranças e Pagamentos

### Ruby version
2.6.4

### API
-Disponibiliza os metodos de pagamentos disponiveis:
```JSON
{
    "id":1,
    "name":"Cartão de Crédito",
    "tax":5,
    "limit_days":4
},
{   
    "id":2,
    "name":"Boleto",
    "tax":0,
    "limit_days":15
}
```
- Disponibiliza o histórico de mensalidades:

```
get "/api/v1/payments/**cpf**"
```
# Consultar todos os pagamentos para um determinado cpf:


### *Exemplo de resultado:*

```json

{
   "cpf": "123456",
   "payments":[
      {
         "value"    :40.0,
         "dt_venc"    :"2019-09-15",
         "status"    :"pending"
      },
      {
         "value"    :40.0,
         "dt_venc"    :"2019-10-15",
         "status"    :"pending"
      },

      ...

   ]
}
  ```

### API Consultar todos os pagamentos para um determinado cpf

get "/api/v1/registrations/payments"

Exemplo:

http://localhost:3000/api/v1/registrations/payments?cpf=123456

get "/api/v1/registrations/payments", params: { registration: {cpf: '222'}}

Exemplo de resultado:
```json
[
   {
       "id": 1,
       "created_at": "2019-09-13T18:03:03.378Z",
       "updated_at": "2019-09-14T20:52:30.170Z",
       "value": 40.0,
       "dt_venc": "2019-09-13",
       "registration_id": 1,
       "pay_method_id": 1,
       "status": "unpaid"
   },
   {
       "id": 2,
       "created_at": "2019-09-13T18:03:03.428Z",
       "updated_at": "2019-09-14T20:53:59.633Z",
       "value": 40.0,
       "dt_venc": "2019-10-13",
       "registration_id": 1,
       "pay_method_id": 1,
       "status": "unpaid"
   },
….
]
```

### API recebe como notificação dados de uma nova matricula e gera mensalidades

 **POST** /api/v1/notifications/

 - Parametros para gerar os pagamentos
    ```json
    {
      "client": {
        "name": "Matilda chata",
        "cpf": "666666",
        "plan_id": 1,
        "unity_id": 1,
        "pay_method_id": 1
      }
    }
    ```

- Resultado
  ```json
  {
    "name": "Matilda chata",
    "cpf": "666666",
    "payments": [
      {
        "value": 167.38,
        "dt_venc": "2019-09-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2019-10-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2019-11-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2019-12-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-01-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-02-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-03-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-04-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-05-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-06-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-07-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-08-18",
        "status": "pending"
      }
    ]
  }
  ```

- Lançar aulas avulsa
# Listar todos os planos:
```
get "/api/v1/plans"
```
### **Exemplo:**

```
{
    http://localhost:3000/api/v1/plans
}
```

### Resultado:

```
[
    {
        "id": 1,
        "name": "Paulista",
        "value": null
    }

    ...

]
```

# Listar todas as unidades:
```
get "/api/v1/unity"
```
### **Exemplo:**

```
{
http://localhost:3000/api/v1/plans
}
```

### Resultado:

```
[
    {
        "id": 1,
        "name": "Paulista",
        "value": null
    }

    ...

]
```

# Listar todas os metodos de pagamento:
```
get "/api/v1/pay_methods"
```
### **Exemplo:**

```
{
http://localhost:3000/api/v1/pay_methods
}
```

### Resultado:

```
[
    {
        "id": 1,
        "name": "boleto"
    },

    ...
]


```

# Informar matrícula para gerar os pagamentos da matrícula:
```
 post 'http://localhost:3000/api/v1/registrations', params: { name: 'Godofredo', cpf: '123456', unity_id: unity.id, plan_id: plan.id, pay_method_id: pay_method.id}
```
### Resultado:

```
[
    {
        "id": 1,
        "name": "Godofredo",
        "cpf": "123456",
        "unity": "Paulista",
        "plan": "Executivo",
        pagamentos: [
            {
                "cpf": "123456",
                "status": "pending",
                "value": 40.0
                "dt_venc": "2019-10-19"
            }
            {
                "cpf": "123456",
                "status": "pending",
                "value": 40.0
                "dt_venc": "2019-11-19"
            }
            {
                "cpf": "123456",
                "status": "pending",
                "value": 40.0
                "dt_venc": "2019-12-19"
            }
            ...
        ]
    }
]





# Consultar metodo de pagamento pelo nome:
```
 get 'http://localhost:3000/api/v1/pay_methods', params: { name: 'Boleto'}
```
### **Exemplo:**

```
{
http://localhost:3000/api/v1/pay_methods?name=boleto
}
```

### Resultado:

```
[
    {
        "id": 1,
        "name": "boleto"
    }
]

```
<<<<<<< HEAD
- Lançar aulas avulsa
=======
#Lançar aulas avulsa 
>>>>>>> d3dd84988d23eea30e3d8fe9cc95a015230d3833
  post '/api/v1/single_class'

  Exemplo
  ```
   post '/api/v1/single_class', params: {single_class:
    { name: 'Boxe',
      unit: 'Paulista',
      date: '2019-09-17',
      price: 100,
      cpf: '123456'
       } }
  ```

- Banir usuario transformando suas faturas pendentes em canceladas

post "/api/v1/payments/ban" params: { cpf: '123456' }
```json
   {"msg": "CPF 123456 com todas as suas faturas canceladas"}
```

### API
-Aplica cupom em mensalidade em aberto 
```JSON
{
    "message":"Sucesso ao aplicar cupom"
},
{
    "message":"Este cupom já foi utilizado"
},
{
    "message":"Esta promoçāo já foi encerrada"
},
{
    "message":"Cupom nāo encontrado"
}
```
- Disponibiliza a mensagem sobre a solicitação feita
```
post "/api/v1/promotions/promotion_id/apply" params: {code:'CODIGO0001', registration:'ID'}
```

### API
-Valida status de cupom 
```JSON
{
    "message":"ativo"
},
{
    "message":"aplicado"
},
{
    "message":"não encontrado"
}
```
- Disponibiliza a mensagem sobre a solicitação feita
```
get "/api/v1/promotions/:promotion_id/cupons/:id/validate" 