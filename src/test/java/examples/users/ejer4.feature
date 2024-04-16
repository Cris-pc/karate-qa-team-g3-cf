Feature: Certificar ends point resques in

  Scenario: caso 12 busqueda por comentarios postid
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/comments'
    And param postId = "1"
    When method get
    Then status 200

  Scenario: caso 13 busqueda por comentarios postid
    * def body =
    """
    {
    'userId':1,
    'title': 'post de prueba',
    'body': 'body de prueba'
    }
    """
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts'
    And request body
    When method post
    Then status 201
    * print response
    And match response.title == "post de prueba"


  Scenario: caso 14 esquema de validacion doc string
    * def body =
    """
    {
    'userId':1,
    'title': 'post de prueba',
    'body': 'body de prueba'
    }
    """
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts'
    And request body
    When method post
    Then status 201
    * print response
    And match response ==
    """
    {
     "userId": #number,
     "title": #string,
     "body": #string,
     "id": #number
    }
    """

    #este token obtenido nos dara el token para el feature del ejer 5
  @name=loginprod1
  Scenario: caso 15 login exitoso
    * def body =
    """
    {
      "email": "eve.holt@reqres.in",
     "password": "cityslicka"
    }
    """
    Given url 'https://reqres.in'
    And path '/api/login'
    And request body
    When method post
    Then status 200
    * print response
    And match response.token == "#string"
    * def autoken = response.token
    * print autoken