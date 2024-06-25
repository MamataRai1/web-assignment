<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

     
    <xsl:key name="categoryKey" match="product" use="category" />

     
    <xsl:template match="/">
        <html>
            <body>
                <h2>Product List</h2>
                 
                <xsl:for-each select="products/product[generate-id() = generate-id(key('categoryKey', category)[1])]">
                    <h3>
                        <xsl:value-of select="category" />
                    </h3>
                    <ul>
                        
                        <xsl:for-each select="key('categoryKey', category)[quantity &gt;= 10]">
                            <xsl:sort select="price" order="descending" data-type="number" />
                            <li>
                                <strong><xsl:value-of select="productname" /></strong><br/>
                                Category: <xsl:value-of select="category" /><br/>
                                Price: <xsl:value-of select="price" /><br/>
                                Quantity: <xsl:value-of select="quantity" /><br/>
                                Total Price: <xsl:value-of select="price * quantity" /><br/>
                            </li>
                            <br/>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>