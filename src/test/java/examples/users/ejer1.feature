Feature: Certificar ends point resques in


  Scenario: CONSULTAR USUARIO POR ID CASO 1
    Given url 'https://reqres.in'
    And path '/api/users/2'
    When method get
    Then status 200


  Scenario: CONSULTAR USUARIO POR ID CASO 2
    * def id = 2
    Given url 'https://reqres.in'
    And path '/api/users/'+id
    When method get
    * print response
    And match response.data.id == 2
    And match response.data.first_name == "Janet"
    And match response.data.last_name == "Weaver"
    Then status 200


