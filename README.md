# moodle-templates
XSLT templates to create parameterized questions for moodle / Plantillas XSLT para generar preguntas de moodle a partir de parámetros

## Requirements
The examples are tested with the XSLT processor library saxon9he.jar, requiring Java SE 6 or later. You can check:  

- [Saxonica](http://www.saxonica.com/html/documentation/about/gettingstarted/gettingstartedjava.html)

## Quick guide 
1. Download saxon9he.jar (or later) to the jar folder

2. Check make.sh to change the saxon jar information if needed

3. Run 

```shell
./make.sh
```
It will create two files for each question type template in the "output" directory. Each file is a question bank in a category. 

4. Import the files as new question banks, selecting "Moodle xml format". 

5. Check the questions created in *-CatA and *-CatB

