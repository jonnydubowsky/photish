Feature: Photish
  In order to generate a basic image gallery
  As a CLI
  I want to run a single command to create a static site

  Scenario: Outputs the provided directories using full arg names
    Given a config file at "/var/tmp/site"
    When I run `photish generate --site-dir /var/tmp/site --photo-dir /var/tmp/photo --output-dir /var/tmp/output`
    Then the output should contain "/var/tmp/site"
    And the output should contain "/var/tmp/photo"
    And the output should contain "/var/tmp/output"
