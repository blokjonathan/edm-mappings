<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:crm="http://www.cidoc-crm.org/rdfs/cidoc_crm_v5.0.2_english_label.rdfs#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:edm="http://www.europeana.eu/schemas/edm/"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:ore="http://www.openarchives.org/ore/terms/"
  xmlns:owl="http://www.w3.org/2002/07/owl#"
  xmlns:rdaGr2="http://rdvocab.info/ElementsGr2/"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:skos="http://www.w3.org/2004/02/skos/core#"
  xmlns:wgs84="http://www.w3.org/2003/01/geo/wgs84_pos#"
  xmlns:xalan="http://xml.apache.org/xalan" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="baseURI">http://mint-projects.image.ntua.gr/data/</xsl:param>
  <xsl:param name="collection">euscreenXL</xsl:param>
  <xsl:template match="/">
    <xsl:apply-templates select="/collection/record"/>
  </xsl:template>
  <xsl:template match="/collection/record">
    <!-- rdf:RDF, id: 0 -->
    <rdf:RDF>
      <!-- edm:ProvidedCHO, id: 1 -->
      <edm:ProvidedCHO>
        <xsl:if test="tag_856/code_u">
          <xsl:attribute name="rdf:about">
            <xsl:for-each select="tag_856/code_u">
              <xsl:if test="position() = 1">
                <xsl:value-of select="."/>
              </xsl:if>
            </xsl:for-each>
          </xsl:attribute>
        </xsl:if>
        <!-- dc:creator, id: 9 -->
        <xsl:for-each select="tag_100/code_a">
          <dc:creator>
            <xsl:value-of select="."/>
          </dc:creator>
        </xsl:for-each>
        <!-- dc:description, id: 15 -->
        <xsl:for-each select="tag_500/code_a">
          <dc:description>
            <xsl:if test="../../tag_040/code_b">
              <xsl:attribute name="xml:lang">
                <xsl:for-each select="../../tag_040/code_b">
                  <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="."/>
          </dc:description>
        </xsl:for-each>
        <!-- dc:identifier, id: 387 -->
        <xsl:for-each select="tag_856/code_u">
          <dc:identifier>
            <xsl:value-of select="substring-after(.,'hdl.handle.net/')"/>
          </dc:identifier>
        </xsl:for-each>
        <!-- dc:identifier, id: 21 -->
        <xsl:for-each select="tag_776/code_o">
          <dc:identifier>
            <xsl:value-of select="."/>
          </dc:identifier>
        </xsl:for-each>
        <!-- dc:publisher, id: 25 -->
        <xsl:for-each select="tag_776/code_d">
          <dc:publisher>
            <xsl:value-of select="substring-before(substring-after(.,': '), ',')"/>
          </dc:publisher>
        </xsl:for-each>
        <!-- dc:rights, id: 31 -->
        <xsl:for-each select="tag_540/code_a">
          <dc:rights>
            <xsl:if test="../../tag_040/code_b">
              <xsl:attribute name="xml:lang">
                <xsl:for-each select="../../tag_040/code_b">
                  <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="."/>
          </dc:rights>
        </xsl:for-each>
        <!-- dc:subject, id: 37 -->
        <xsl:for-each select="tag_650/code_a">
          <dc:subject>
            <xsl:if test="../../tag_040/code_b">
              <xsl:attribute name="xml:lang">
                <xsl:for-each select="../../tag_040/code_b">
                  <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="."/>
          </dc:subject>
        </xsl:for-each>
        <!-- dc:title, id: 40 -->
        <dc:title>
          <xsl:if test="tag_040/code_a">
            <xsl:attribute name="xml:lang">
              <xsl:for-each select="tag_040/code_a">
                <xsl:if test="position() = 1">
                  <xsl:value-of select="substring-before(.,'-')"/>
                </xsl:if>
              </xsl:for-each>
            </xsl:attribute>
          </xsl:if>
          <xsl:for-each select="tag_245/code_a">
            <xsl:value-of select="."/>
          </xsl:for-each>
          <xsl:for-each select="tag_245/code_b">
            <xsl:value-of select="."/>
          </xsl:for-each>
        </dc:title>
        <!-- dc:type, id: 380 -->
        <dc:type>
          <xsl:attribute name="rdf:resource">
            <xsl:text>http://vocab.getty.edu/aat/300417953</xsl:text>
          </xsl:attribute>
        </dc:type>
        <!-- dc:type, id: 42 -->
        <xsl:for-each select="tag_336/code_a">
          <dc:type>
            <xsl:if test="../../tag_040/code_b">
              <xsl:attribute name="xml:lang">
                <xsl:for-each select="../../tag_040/code_b">
                  <xsl:if test="position() = 1">
                    <xsl:value-of select="."/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="."/>
          </dc:type>
        </xsl:for-each>
        <!-- dcterms:issued, id: 80 -->
        <xsl:for-each select="tag_776/code_d">
          <dcterms:issued>
            <xsl:value-of select="substring-after(.,', ')"/>
          </dcterms:issued>
        </xsl:for-each>
        <!-- dcterms:spatial, id: 101 -->
        <xsl:for-each select="tag_776/code_d">
          <dcterms:spatial>
            <xsl:if test="../../tag_040/code_a">
              <xsl:attribute name="xml:lang">
                <xsl:for-each select="../../tag_040/code_a">
                  <xsl:if test="position() = 1">
                    <xsl:value-of select="substring-before(.,'-')"/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="substring-before(.,' :')"/>
          </dcterms:spatial>
        </xsl:for-each>
        <!-- edm:currentLocation, id: 110 -->
        <edm:currentLocation>
          <xsl:attribute name="rdf:resource">
            <xsl:text>http://sws.geonames.org/2751773/</xsl:text>
          </xsl:attribute>
        </edm:currentLocation>
        <!-- edm:type, id: 134 -->
        <edm:type>
          <xsl:text>IMAGE</xsl:text>
        </edm:type>
      </edm:ProvidedCHO>
      <!-- ore:Aggregation, id: 340 -->
      <ore:Aggregation>
        <xsl:attribute name="rdf:about">
          <xsl:value-of select="$baseURI"/>
          <xsl:value-of select="$collection"/>
          <xsl:text>/Aggregation_</xsl:text>
          <xsl:for-each select="tag_856/code_u">
            <xsl:if test="position() = 1">
              <xsl:value-of select="."/>
            </xsl:if>
          </xsl:for-each>
        </xsl:attribute>
        <!-- edm:aggregatedCHO, id: 342 -->
        <edm:aggregatedCHO>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="$baseURI"/>
            <xsl:value-of select="$collection"/>
            <xsl:text>/</xsl:text>
            <xsl:for-each select="tag_856/code_u">
              <xsl:if test="position() = 1">
                <xsl:value-of select="."/>
              </xsl:if>
            </xsl:for-each>
          </xsl:attribute>
        </edm:aggregatedCHO>
        <!-- edm:dataProvider, id: 344 -->
        <edm:dataProvider>
          <xsl:text>Netherlands Institute for Sound and Vision</xsl:text>
        </edm:dataProvider>
        <!-- edm:hasView, id: 347 -->
        <edm:hasView>
          <xsl:attribute name="rdf:resource">
            <xsl:text> https://digitalcollections.universiteitleiden.nl/iiif_manifest/item%3A</xsl:text>
            <xsl:for-each select="tag_856/code_u">
              <xsl:if test="position() = 1">
                <xsl:value-of select="substring-after(.,'item:')"/>
              </xsl:if>
            </xsl:for-each>
            <xsl:text>/manifest</xsl:text>
          </xsl:attribute>
        </edm:hasView>
        <!-- edm:isShownAt, id: 349 -->
        <edm:isShownAt>
          <xsl:if test="tag_856/code_u">
            <xsl:attribute name="rdf:resource">
              <xsl:for-each select="tag_856/code_u">
                <xsl:if test="position() = 1">
                  <xsl:value-of select="."/>
                </xsl:if>
              </xsl:for-each>
            </xsl:attribute>
          </xsl:if>
        </edm:isShownAt>
        <!-- edm:isShownBy, id: 351 -->
        <edm:isShownBy>
          <xsl:attribute name="rdf:resource">
            <xsl:text>https://digitalcollections.universiteitleiden.nl/view/item/</xsl:text>
            <xsl:for-each select="tag_856/code_u">
              <xsl:if test="position() = 1">
                <xsl:value-of select="substring-after(.,'item:')"/>
              </xsl:if>
            </xsl:for-each>
            <xsl:text>/datastream/JPG/</xsl:text>
          </xsl:attribute>
          <xsl:text/>
        </edm:isShownBy>
        <!-- edm:object, id: 353 -->
        <edm:object>
          <xsl:attribute name="rdf:resource">
            <xsl:text>https://digitalcollections.universiteitleiden.nl/view/item/</xsl:text>
            <xsl:for-each select="tag_856/code_u">
              <xsl:if test="position() = 1">
                <xsl:value-of select="substring-after(.,'http://hdl.handle.net/1887.1/item:')"/>
              </xsl:if>
            </xsl:for-each>
            <xsl:text>/datastream/JPG/</xsl:text>
          </xsl:attribute>
        </edm:object>
        <!-- edm:provider, id: 355 -->
        <edm:provider>
          <xsl:text>EUscreen</xsl:text>
        </edm:provider>
        <!-- edm:rights, id: 361 -->
        <edm:rights>
          <xsl:attribute name="rdf:resource">
            <xsl:text>http://creativecommons.org/licenses/by/4.0/</xsl:text>
          </xsl:attribute>
          <xsl:text/>
        </edm:rights>
      </ore:Aggregation>
    </rdf:RDF>
  </xsl:template>
</xsl:stylesheet>
