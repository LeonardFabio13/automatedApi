@run
Feature: Obtener un pedido específico

  Background:
    * def requestPedido = read('classpath:resourse/request/bodyCrearOrder.json')
    * def requestPedidoCreate = read('classpath:resourse/request/bodyOrderCreate.json')
    * def requestPedidoBad = read('classpath:resourse/request/bodyOrderBad.json')
  #----------------Creación de órdenes-----------------------
  Scenario: Obtener respuesta 200
    Given url petStore
    And path '/store/order'
    And request requestPedido
    When method post
    Then status 200
    And match response == requestPedidoCreate

  Scenario: Obtener respuesta 400
    Given url petStore
    And path '/store/or'
    And request requestPedido
    When method post
    Then status 404


  Scenario: Obtener respuesta 500
    Given url petStore
    And path '/store/order'
    And request requestPedidoBad
    When method post
    Then status 500
    And match response.code == 500
    And match response.type == 'unknown'
    And match response.message == 'something bad happened'


#----------------Obtención de órdenes-----------------------
  Scenario: Obtener respuesta 200
    Given url petStore
    And path 'store/order/213'
    When method get
    Then status 200

  Scenario: Obtener una respuesta 400
    Given url petStore
    And path 'store/order/1000000'
    When method get
    Then status 404
    And match response.code == 1
    And match response.type == 'error'
    And match response.message == 'Order not found'


    #----------------Eliminación de órdenes-----------------------
  Scenario: Obtener respuesta 200
    Given url petStore
    And path '/store/order/213'
    When method delete
    Then status 200
    And match response.code == 200
    And match response.type == 'unknown'
    And match response.message == "213"

  Scenario: Obtener respuesta 400
    Given url petStore
    And path '/store/order/212'
    When method delete
    Then status 404
    And match response.code == 404
    And match response.type == 'unknown'
    And match response.message == "Order Not Found"

