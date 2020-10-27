<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xsi europeana" version="2.0"
  xmlns:crm="http://www.cidoc-crm.org/rdfs/cidoc_crm_v5.0.2_english_label.rdfs#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:edm="http://www.europeana.eu/schemas/edm/"
  xmlns:europeana="http://www.europeana.eu/schemas/ese/"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:ore="http://www.openarchives.org/ore/terms/"
  xmlns:owl="http://www.w3.org/2002/07/owl#"
  xmlns:rdaGr2="http://rdvocab.info/ElementsGr2/"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:skos="http://www.w3.org/2004/02/skos/core#"
  xmlns:wgs84="http://www.w3.org/2003/01/geo/wgs84_pos#"
  xmlns:xalan="http://xml.apache.org/xalan"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:variable name="var0">
    <item>TEXT</item>
    <item>VIDEO</item>
    <item>IMAGE</item>
    <item>SOUND</item>
    <item>3D</item>
  </xsl:variable>
  <xsl:template match="/">
    <xsl:apply-templates select="/europeana:record"/>
  </xsl:template>
  <xsl:template match="/europeana:record">
    <!-- rdf:RDF, id: 0 -->
    <rdf:RDF>
      <!-- edm:ProvidedCHO, id: 1 -->
      <edm:ProvidedCHO>
        <xsl:if test="europeana:isShownAt">
          <xsl:attribute name="rdf:about">
            <xsl:for-each select="europeana:isShownAt">
              <xsl:if test="position() = 1">
                <xsl:value-of select="."/>
              </xsl:if>
            </xsl:for-each>
          </xsl:attribute>
        </xsl:if>
        <!-- dc:coverage, id: 6 -->
        <xsl:for-each select="dc:coverage">
          <dc:coverage>
            <xsl:value-of select="."/>
          </dc:coverage>
        </xsl:for-each>
        <!-- dc:creator, id: 9 -->
        <xsl:for-each select="dc:creator">
          <dc:creator>
            <xsl:value-of select="."/>
          </dc:creator>
        </xsl:for-each>
        <!-- dc:description, id: 15 -->
        <xsl:for-each select="dc:description">
          <dc:description>
            <xsl:value-of select="."/>
          </dc:description>
        </xsl:for-each>
        <!-- dc:format, id: 18 -->
        <xsl:for-each select="dc:format">
          <dc:format>
            <xsl:value-of select="."/>
          </dc:format>
        </xsl:for-each>
        <!-- dc:identifier, id: 21 -->
        <xsl:for-each select="dc:identifier">
          <dc:identifier>
            <xsl:value-of select="."/>
          </dc:identifier>
        </xsl:for-each>
        <!-- dc:publisher, id: 25 -->
        <xsl:for-each select="dc:publisher">
          <dc:publisher>
            <xsl:value-of select="."/>
          </dc:publisher>
        </xsl:for-each>
        <!-- dc:title, id: 40 -->
        <xsl:for-each select="dc:title">
          <dc:title>
            <xsl:value-of select="."/>
          </dc:title>
        </xsl:for-each>
        <!-- dc:type, id: 42 -->
        <xsl:for-each select="dc:type">
          <dc:type>
            <xsl:value-of select="."/>
          </dc:type>
        </xsl:for-each>
        <!-- dcterms:isPartOf, id: 68 -->
        <xsl:for-each select="dcterms:isPartOf">
          <dcterms:isPartOf>
            <xsl:value-of select="."/>
          </dcterms:isPartOf>
        </xsl:for-each>
        <!-- edm:type, id: 134 -->
        <xsl:for-each select="europeana:type">
          <xsl:if test="position() = 1">
            <xsl:if test="index-of($var0/item, replace(.,'^\s*(.+?)\s*$', '$1')) > 0">
              <edm:type>
                <xsl:value-of select="."/>
              </edm:type>
            </xsl:if>
          </xsl:if>
        </xsl:for-each>
      </edm:ProvidedCHO>
      <!-- ore:Aggregation, id: 295 -->
      <ore:Aggregation>
        <xsl:attribute name="rdf:about">
          <xsl:text>http://mint-projects.image.ntua.gr/data/euscreenXL/Aggregation_</xsl:text>
          <xsl:for-each select="europeana:isShownAt">
            <xsl:if test="position() = 1">
              <xsl:value-of select="."/>
            </xsl:if>
          </xsl:for-each>
        </xsl:attribute>
        <!-- edm:aggregatedCHO, id: 297 -->
        <edm:aggregatedCHO>
          <xsl:if test="dc:identifier">
            <xsl:attribute name="rdf:resource">
              <xsl:for-each select="dc:identifier">
                <xsl:if test="position() = 1">
                  <xsl:value-of select="."/>
                </xsl:if>
              </xsl:for-each>
            </xsl:attribute>
          </xsl:if>
        </edm:aggregatedCHO>
        <!-- edm:dataProvider, id: 299 -->
        <xsl:for-each select="europeana:dataProvider">
          <xsl:if test="position() = 1">
            <edm:dataProvider>
              <xsl:value-of select="."/>
            </edm:dataProvider>
          </xsl:if>
        </xsl:for-each>
        <!-- edm:isShownAt, id: 304 -->
        <edm:isShownAt>
          <xsl:if test="europeana:isShownAt">
            <xsl:attribute name="rdf:resource">
              <xsl:for-each select="europeana:isShownAt">
                <xsl:if test="position() = 1">
                  <xsl:value-of select="."/>
                </xsl:if>
              </xsl:for-each>
            </xsl:attribute>
          </xsl:if>
        </edm:isShownAt>
        <!-- edm:object, id: 308 -->
        <edm:object>
          <xsl:if test="europeana:object">
            <xsl:attribute name="rdf:resource">
              <xsl:for-each select="europeana:object">
                <xsl:if test="position() = 1">
                  <xsl:value-of select="."/>
                </xsl:if>
              </xsl:for-each>
            </xsl:attribute>
          </xsl:if>
        </edm:object>
        <!-- edm:provider, id: 312 -->
        <edm:provider>
          <xsl:attribute name="rdf:resource">
            <xsl:text>Digitale Collectie</xsl:text>
          </xsl:attribute>
        </edm:provider>
        <!-- edm:rights, id: 318 -->
        <edm:rights>
          <xsl:if test="europeana:rights">
            <xsl:attribute name="rdf:resource">
              <xsl:for-each select="europeana:rights">
                <xsl:if test="position() = 1">
                  <xsl:value-of select="."/>
                </xsl:if>
              </xsl:for-each>
            </xsl:attribute>
          </xsl:if>
        </edm:rights>
      </ore:Aggregation>
    </rdf:RDF>
  </xsl:template>
</xsl:stylesheet>
