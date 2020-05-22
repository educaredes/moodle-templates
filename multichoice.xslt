<?xml version="1.0" encoding="UTF-8"?>
<!--
  multichoice.xslt is an example template for parametrization of 
  moodle essay questions in moodle-xml format
  
  Author: Luis Bellido Triana (luis.bellido@upm.es)

  Copyright (C) 2020 DIT-UPM
      Departamento de Ingeniería de Sistemas Telemáticos
      Universidad Politécnica de Madrid
      SPAIN

  Available at: http://github.com/educaredes/moodle-templates

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  exclude-result-prefixes="xsl dc dcterms xsi" version="2.0">
  <xsl:output method="xml" encoding="utf-8" indent="yes" />
  <xsl:param name="outdir" required="yes" />
  <xsl:template match="/">
    <xsl:apply-templates select="personalization/q" />
  </xsl:template>

  <xsl:template match="q">
    <xsl:variable name="cat" select="@cat" />
    <xsl:variable name="xmlfile"
      select="concat($outdir, '/',  $cat, '.xml')" />

    <xsl:result-document href="{$xmlfile}">
      <xsl:comment>Created with a template based on multichoice.xslt from https://github.com/educaredes/moodle-templates</xsl:comment><xsl:text>
</xsl:text>
      <quiz>
        <question type="category">
          <category>
            <text>$course$/top</text>
          </category>
        </question>
        <question type="category">
          <category>
            <text>$course$/top/<xsl:value-of select="$cat" />
            </text>
          </category>
        </question>
        <xsl:apply-templates select="item" />
      </quiz>
    </xsl:result-document>

  </xsl:template>

  <xsl:template match="item">
    <question type="multichoice">
      <name>
        <text><xsl:value-of select="../@cat" />-<xsl:value-of select="id" />
        </text>
      </name>
      <questiontext format="html">
        <text>
          <xsl:if 
            test="../@id='1'">What is the value of the following operation? &lt;br&gt;&lt;br&gt;
            <xsl:value-of select="operation" />
          </xsl:if>

          <xsl:if 
            test="../@id='2'">What is the value of c after the following Java line?&lt;br&gt;&lt;br&gt;
            <xsl:value-of select="char" />&lt;br&gt;&lt;br&gt;
          </xsl:if>
        </text>
      </questiontext>
    <generalfeedback format="html">
      <text></text>
    </generalfeedback>
    <defaultgrade>1</defaultgrade>
    <penalty>1</penalty>
    <hidden>0</hidden>
    <idnumber></idnumber>
    <single>true</single>
    <shuffleanswers>true</shuffleanswers>
    <answernumbering>none</answernumbering>
    <correctfeedback format="html">
      <text></text>
    </correctfeedback>
    <partiallycorrectfeedback format="html">
      <text></text>
    </partiallycorrectfeedback>
    <incorrectfeedback format="html">
      <text></text>
    </incorrectfeedback>
    <shownumcorrect/>
    <answer fraction="100" format="html">
      <text><xsl:value-of select="sol" /></text>
      <feedback format="html">
        <text></text>
      </feedback>
    </answer>
    <answer fraction="-50" format="html">
      <text><xsl:value-of select="wrong1" /></text>
      <feedback format="html">
        <text></text>
      </feedback>
    </answer>
    <answer fraction="-50" format="html">
      <text><xsl:value-of select="wrong2" /></text>
      <feedback format="html">
        <text></text>
      </feedback>
    </answer>
    <answer fraction="0" format="html">
      <text>No contestar</text>
      <feedback format="html">
        <text></text>
      </feedback>
    </answer>
    </question>

  </xsl:template>
</xsl:stylesheet>
