Feature: Certificar ends point resques in METODO POST

  Scenario: REGISTRO SATISFACTORIO USUARIO POR ID CASO 1
    Given url 'https://reqres.in'
    And path '/api/register'
    When request {"email": "eve.holt@reqres.in","password": "pistol"}
    And method POST
    And match response.id != null
    Then status 200

  Scenario Outline: REGISTRO SATISFACTORIO USUARIO POR ID CASO 2
    * def body = {"email": "<EMAIL>","password": "<PASSWORD>"}
    Given url 'https://reqres.in'
    And path '/api/register'
    When request body
    And method POST
    And match response.id != null
    Then status 200
    Examples:
        |EMAIL|PASSWORD|
        |eve.holt@reqres.in|pistol|


  Scenario Outline: REGISTRO SATISFACTORIO USUARIO POR ID CASO 3
    * def body =
       """
          {
          "email": "<EMAIL>",
          "password": "<PASSWORD>"}
       """
    Given url 'https://reqres.in'
    And path '/api/register'
    When request body
    And method POST
    And match response.id != null
    Then status 200
    Examples:
      |EMAIL|PASSWORD|
      |eve.holt@reqres.in|pistol|