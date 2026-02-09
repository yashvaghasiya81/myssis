<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Employee Report</title>
        <style>
          table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px;
          }
          th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #4CAF50;
            color: white;
          }
          tr:nth-child(even) {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h2>Employee List</h2>
        <table>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Salary</th>
          </tr>
          <xsl:for-each select="Employees/Employee">
            <tr>
              <td><xsl:value-of select="ID"/></td>
              <td><xsl:value-of select="Name"/></td>
              <td><xsl:value-of select="Department"/></td>
              <td><xsl:value-of select="Salary"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>