@regression @products
Feature: Create New Products

    Background: User login to jurnal mobile
    Given user login as 'user_create_products'

    @android
    Scenario Outline: User should be able to create product
      When user go to 'products menu' screen
      And user create new products using '<products_detail>'
      Then product should be successfully created

    Examples:
      | case_id                                                                                     | products_detail          |
      | A97968,A97970,A97972,A97974,A97976,A97978,A97980,A97982,A97984,A97986,A97988,A97990         | products_default         |
      | A97967,A97969,A97971,A979773,A97975,A97977,A97979,A97981,A97983,A97985,A97987,A97989        | products_default         |

    @android
    Scenario: A97958,A97959,A97960,A97961,A97927,A97996- User view detail of product on products overview tab
      When user go to 'products menu' screen
      And user search product with 'Sales'
      Then product search result displayed on the list

    @android
    Scenario Outline: User should be able to edit product
      When user go to 'products menu' screen
      And user edit products using '<products_detail>'
      Then product should be successfully edited

    Examples:
      | case_id                                                                                                         | products_detail          |
      | A98012,A98013,A98014,A98015,A98016,A98018,A98019,A98021,A98022,A98023,A98024,A98025,A98027,A98028,A98029        | products_updated         |
