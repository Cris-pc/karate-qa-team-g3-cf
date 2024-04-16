Feature: Certificar ends point resques in


  Background:
    * def responselogin = call read('ejer4.feature@name=loginprod1')
    * def obtenertoken = responselogin.autoken
    * print obtenertoken
    * url 'https://reqres.in'
    * header Authorization = "Bearer " + obtenertoken

  Scenario: caso 1 obtener token de login
    Given path  '/api/users'
    And request  {"name": "morpheus","job": "leader"}
    When method post
    Then status 201

  Scenario: caso 2 obtener token verificar login incorrecto
    Given path  '/api/login'
    And request  {"email": "peter@klaven"}
    When method post
    Then status 400
    And match response.error == "Missing password"

  Scenario: caso 3 obtener token y verificar single user
    Given path  '/api/users/2'
    When method get
    Then status 200
    And match response == read ('responseget.json')


