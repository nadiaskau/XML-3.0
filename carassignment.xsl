<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml"
				indent="yes"
				omit-xml-declaration="no"
	            doctype-system="about:legacy-compat"/>

  <xsl:template match="cars">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="da">
    <head><title>Cars</title></head>
    <style>
        body {font-family: 'Arial';}
        table, td, th {border: 1px solid blue;}
        h1 {background-color: black; color:white; text-align: center;}
        #container {display:flex; flex-direction: column; width: 70%; margin: auto;}
    </style>
    <body>
    <div id="container">
    <h1>Second Hand Sardine Cans</h1>
    <table> <tr>
        <th> Make </th>
        <th> Model </th>
        <th> Year </th>
        <th> KMs </th>
        <th> Color </th>
        <th> Price </th>
        <th> Warranty </th>
        </tr>
 
        <xsl:for-each select="car"> 
        <tr>
            <td><xsl:value-of select="@manufacturer"/></td>
            <td><xsl:value-of select="@model"/></td>
            <td><xsl:value-of select="@year"/></td>
            <td><xsl:value-of select="meter"/></td>

            <xsl:variable name="backgroundColor" select="color"/> 
            <td style='background-color:{$backgroundColor}'></td>
            
            <td><xsl:value-of select="price"/></td>
            <!-- I can't seem to catch this one-->
            <xsl:if test='car/dealersecurity[@buyback]="yes"'><td>Yes</td></xsl:if>
        </tr>
        </xsl:for-each> 
        <tr>
            <td colspan="4">Average price:</td> 
            <td>DKR</td>
            <td>
                <xsl:variable name="noCars" select="count(car)"/>
                <xsl:variable name="sum" select="sum(car/price)"/>
                <xsl:variable name="avg" select="$sum div $noCars"/>
                <xsl:value-of select='format-number($avg, "#")'/>
            </td>
        </tr>
      
        </table>
    </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>