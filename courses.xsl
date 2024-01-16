<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : courses.xsl
    Created on : September 7, 2023, 9:10 PM
    Author     : Tom Coffee
    Description:
        Convert courses.xml into a HTML table.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                version="1.0"
                xmlns="http://www.metrostate.edu/ics625/sections" 
                xmlns:s="http://www.metrostate.edu/ics625/sections"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.metrostate.edu/ics625/sections courses.xsd">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Course Sections</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" 
                      integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous" />
                <style>
                    html, body { width: 100%; }
                    
                    body { background-color: white; 
                        color: black;
                        font-family: arial, verdana, sans-serif; 
                        text-align: center;
                        padding: 0;
                        margin: 0; 
                    }
                    
                    table { padding-top: 10px;  
                        margin: 10px auto;
                    }
                   
                    h1, h2, th, td { padding: 5px; }
                    th, td { border-bottom: 1px solid #DDD; 
                        text-align: left;
                        padding:  10px 10px 20px 10px;
                    } 
                    tr:nth-child(even) { background: #F9F9F9; color: black; }
                    tr:nth-child(odd) { background: white; color: black; }
                    th { background-color: #EEE; color: black; vertical-align: bottom; }
                    td { vertical-align: top; }
                    .make-it-blue { color: #56AAE0; background-color: parent }
                </style>
            </head>
            <body>
                
                <table summary="Table of courses sections.">
                    <thead>
                        <tr>
                            <th scope="col">Course ID, Section, Title</th>
                            <th scope="col">Available Seats</th>
                            <th scope="col">Instructor</th>
                            <th scope="col">Date Range</th>
                            <th scope="col">Days</th>
                            <th scope="col">Times</th>
                            <th scope="col">Building / Room</th>
                            <th scope="col">Cr/Hr</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:call-template name="DisplaySections"/>
                    </tbody>
                </table>
                
            </body>
        </html>
    </xsl:template>

    <xsl:template name="DisplaySections">
            <xsl:for-each select="//s:section">
                <tr>
                    <td>
                        <span class="make-it-blue">
                            <xsl:value-of select="s:course/s:id/."/>
                        </span> 
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="s:course/s:coursenumber/."/> <xsl:text> </xsl:text>
                        <xsl:value-of select="s:sectionnumber/." /> <xsl:text> </xsl:text> 
                        <xsl:value-of select="s:course/s:title/."/> 
                    </td>
                    <td>
                        <xsl:value-of select="s:capacity/. - s:enrolled/."/> 
                        of <xsl:value-of select="s:capacity/."/>
                    </td>
                    <td>
                        <xsl:value-of select="s:instructor/s:lastname/."/>,
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="s:instructor/s:firstname/."/>
                    </td>
                    <td>
                        <xsl:value-of select="s:daterange/s:startdate/."/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="s:daterange/s:enddate/."/>
                    </td>
                    <td>
                        <xsl:value-of select="s:days/." />
                    </td>
                    <td>
                        <xsl:value-of select="s:times/s:starttime/."/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="s:times/s:endtime/."/>
                    </td>
                    <td>
                        <xsl:value-of select="s:location/s:building/."/>
                        <xsl:text>/</xsl:text>
                        <xsl:value-of select="s:location/s:room/."/>
                    </td>
                    <td>
                        <xsl:value-of select="s:credits/." />
                    </td>
                    <td>
                        <xsl:value-of select="s:status/." />
                    </td>
                </tr>
            </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
