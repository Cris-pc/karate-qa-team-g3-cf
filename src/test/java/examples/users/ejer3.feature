Feature: Certificar ends point resques in

#SIEMPRE when con el metodo and con el request
  Scenario Outline: UPDATE USUARIO POR ID CASO 1
    Given url 'https://reqres.in'
    And path '/api/users/2'
    And request
    """
     {
      "name": "<VNAME>",
       "job": "<VJOB>"
       }
    """
    When method PUT
    Then status 200
    And match response.name == "morpheus"
    And match response.job == "zion resident"
    And match response.updatedAt != null
    Examples:
      |VNAME|VJOB|
      |morpheus|zion resident|



  Scenario: DELETE USUARIO POR ID CASO 9
    Given url 'https://reqres.in'
    And path '/api/users/2'
    When method DELETE
    Then status 204

