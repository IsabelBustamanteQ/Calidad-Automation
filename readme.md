Run a feature file
==================
...\999RubySamples>cucumber features\1calc.feature

Run a feature file without report dialog
==================================
...\999RubySamples>cucumber features\1calc.feature --publish-quiet

Run a feature file and export results to HTML format
====================================================
...\999RubySamples>cucumber features\1calc.feature -f html -o reportExecution.html

Run an specific scenario in a feature file
==========================================
...\999RubySamples>cucumber features\1calc.feature  -t @onlyThis
...\999RubySamples>cucumber features\1calc.feature  -t @onlyThis -f html -o reports\reportExecution.html

Run all features
================
...\999RubySamples>cucumber features
